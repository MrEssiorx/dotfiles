-- General autocommands that are not specific to one filetype.

local augroup = vim.api.nvim_create_augroup("UserCoreAutocmds", { clear = true })

-- Insert a template from $HOME/templates/<ext>.<ext> when a new file is created.
vim.api.nvim_create_autocmd("BufNewFile", {
  group = augroup,
  pattern = "*",
  callback = function()
    local ext = vim.fn.expand("%:e")
    if ext == "" then
      return
    end

    local template = vim.fn.expand("$HOME/templates/" .. ext .. "." .. ext)
    if vim.fn.filereadable(template) == 1 then
      vim.cmd("0r " .. vim.fn.fnameescape(template))
    end
  end,
})
