-- Entry point for Neovim configuration.
-- Keep this file small: it should mostly define load order.

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require("core.options")
require("core.keymaps")
require("core.autocmds")
require("core.lazy")
