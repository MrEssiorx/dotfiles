-- LSP setup.
-- Split from cmp so it is easier to extend with more servers later.

local cmp = require("cmp")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

cmp.setup({
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
    }),
    sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
    }),
})

local function find_root(bufname, markers)
    local startpath = vim.fs.dirname(bufname)
    local root_marker = vim.fs.find(markers, {
        path = startpath,
        upward = true,
    })[1]

    if root_marker then
        return vim.fs.dirname(root_marker)
    end

    return startpath
end

local clangd_config = {
    name = "clangd",
    cmd = { "clangd", "--header-insertion=never", "--background-index" },
    capabilities = capabilities,
}

local texlab_config = {
    name = "texlab",
    cmd = { "texlab" },
    capabilities = capabilities,
    settings = {
        texlab = {
            build = {
                executable = "latexmk",
                args = {
                    "-pdf",
                    "-interaction=nonstopmode",
                    "-synctex=1",
                    "%f",
                },
                onSave = false,
                forwardSearchAfter = false,
            },
            chktex = {
                onOpenAndSave = true,
            },
            forwardSearch = {
                executable = "zathura",
                args = { "--synctex-forward", "%l:1:%f", "%p" },
            },
        },
    },
}

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "c", "cpp", "objc", "objcpp" },
    callback = function(args)
        local bufname = vim.api.nvim_buf_get_name(args.buf)
        if bufname == "" then
            return
        end

        vim.lsp.start(vim.tbl_extend("force", clangd_config, {
            root_dir = find_root(bufname, { ".git", "compile_commands.json" }),
        }))
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "tex", "plaintex", "bib" },
    callback = function(args)
        local bufname = vim.api.nvim_buf_get_name(args.buf)
        if bufname == "" then
            return
        end

        vim.lsp.start(vim.tbl_extend("force", texlab_config, {
            root_dir = find_root(bufname, {
                ".git",
                ".latexmkrc",
                "latexmkrc",
                ".texlabroot",
                "Tectonic.toml",
            }),
        }))
    end,
})

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(ev)
        local opts = { buffer = ev.buf, silent = true }
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    end,
})
