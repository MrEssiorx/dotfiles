require("neo-tree").setup({
  close_if_last_window = true,
  popup_border_style = "rounded",
  enable_git_status = true,
  enable_diagnostics = true,
  filesystem = {
    filtered_items = {
      hide_dotfiles = false,
      hide_gitignored = true,
      hide_by_name = { ".git" },
    },
    follow_current_file = { enabled = true },
    group_empty_dirs = true,
    use_libuv_file_watcher = true,
  },
  window = {
    width = 30,
    mappings = {
      ["<space>"] = "none",
    },
  },
})

vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>", { noremap = true, silent = true })
