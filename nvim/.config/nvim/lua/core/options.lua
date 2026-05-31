-- Core editor options.
-- Only generic Neovim behavior should live here.

-- encoding
vim.opt.encoding = "utf-8"

-- visuals
vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.foldmethod = "indent"
vim.opt.foldlevel = 99
vim.opt.hlsearch = false
vim.opt.visualbell = true
vim.opt.langmap = "ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz"

-- indentation
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smarttab = true
vim.opt.smartindent = true
vim.opt.cin = true
vim.opt.expandtab = true

-- statusline / UI
vim.opt.laststatus = 2
vim.opt.showmode = false

-- behavior
vim.opt.autowriteall = true
vim.opt.mouse = ""
vim.opt.linebreak = true
vim.opt.conceallevel = 1
