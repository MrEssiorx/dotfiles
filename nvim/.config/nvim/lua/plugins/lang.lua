return {
  -- language-specific plugins
  { "octol/vim-cpp-enhanced-highlight" },
  {
    "lervag/vimtex",
    lazy = false,
    init = function()
      require("config.vimtex")
    end,
  },
  {
    "SirVer/ultisnips",
    ft = { "tex", "plaintex", "bib" },
    dependencies = {
      "quangnguyen30192/cmp-nvim-ultisnips",
    },
    init = function()
      vim.g.UltiSnipsSnippetDirectories = { "UltiSnips" }
      vim.g.UltiSnipsExpandTrigger = "<Nop>"
      vim.g.UltiSnipsJumpForwardTrigger = "<Nop>"
      vim.g.UltiSnipsJumpBackwardTrigger = "<Nop>"
      vim.g.UltiSnipsEditSplit = "vertical"
    end,
  },
  { "mboughaba/i3config.vim" },
}
