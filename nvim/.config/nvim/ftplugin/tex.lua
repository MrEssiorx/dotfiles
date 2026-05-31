local map = vim.keymap.set
local opts = { buffer = true, silent = true }

map("n", "<leader>lc", "<cmd>VimtexCompile<CR>", opts)
map("n", "<leader>lv", "<cmd>VimtexView<CR>", opts)
map("n", "<leader>lk", "<cmd>VimtexStop<CR>", opts)
map("n", "<leader>lt", "<cmd>VimtexTocOpen<CR>", opts)
