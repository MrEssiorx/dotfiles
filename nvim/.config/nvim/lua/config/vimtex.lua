-- VimTeX globals should be set before the plugin loads.

vim.g.tex_flavor = "latex"
vim.g.vimtex_view_method = "zathura"
vim.g.vimtex_quickfix_mode = 0
vim.g.tex_conceal = "abdmg"

vim.g.vimtex_compiler_method = "latexmk"

vim.g.vimtex_compiler_latexmk = {
  continuous = 1,
  options = {
    "-pdf",
    "-interaction=nonstopmode",
    "-synctex=1",
    "-file-line-error",
  },
}

-- чтобы completion шёл через cmp + texlab, а не через встроенный completion vimtex
vim.g.vimtex_complete_enabled = 0
