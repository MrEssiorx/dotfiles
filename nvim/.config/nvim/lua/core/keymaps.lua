-- Global keymaps not tied to a plugin or a specific filetype.

local opts = { silent = true }

-- tabs
vim.keymap.set("n", "<C-h>", ":tabp<CR>", opts)
vim.keymap.set("n", "<C-l>", ":tabn<CR>", opts)

-- alternative Esc
vim.keymap.set("i", "jj", "<Esc>", opts)
vim.keymap.set("v", ";;", "<Esc>", opts)

-- copy whole buffer: keep the current Linux/WSL distinction
if string.find(vim.loop.os_uname().version, "Microsoft") then
  vim.keymap.set("n", "<C-a>", "GVgg:Wsly<CR>", opts)
else
  vim.keymap.set("n", "<C-a>", ":%y+<CR>", opts)
end
