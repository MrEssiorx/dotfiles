require("toggleterm").setup({
  size = 5,
  open_mapping = [[<C-\\>]],
  shade_terminals = true,
  shading_factor = 2,
  direction = "horizontal",
  float_opts = {
    border = "curved",
  },
})

vim.keymap.set("n", "<leader>t", ":Terminal ")
vim.keymap.set("t", "<leader>+", function()
  local term = require("toggleterm.terminal").get(1)
  if term then
    term:resize(term.size + 2)
  end
end)
vim.keymap.set("t", "<leader>-", function()
  local term = require("toggleterm.terminal").get(1)
  if term then
    term:resize(term.size - 2)
  end
end)

-- terminal mode navigation
vim.api.nvim_set_keymap("t", "<Esc>", [[<C-\><C-n>]], { noremap = true })
vim.api.nvim_set_keymap("t", "<C-h>", [[<C-\><C-n><C-w>h]], { noremap = true })
vim.api.nvim_set_keymap("t", "<C-j>", [[<C-\><C-n><C-w>j]], { noremap = true })
vim.api.nvim_set_keymap("t", "<C-k>", [[<C-\><C-n><C-w>k]], { noremap = true })
vim.api.nvim_set_keymap("t", "<C-l>", [[<C-\><C-n><C-w>l]], { noremap = true })
