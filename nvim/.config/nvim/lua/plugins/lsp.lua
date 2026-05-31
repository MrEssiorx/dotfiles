return {
  -- LSP
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("config.lsp")
    end,
  },
  { "williamboman/mason.nvim", config = true },
  { "williamboman/mason-lspconfig.nvim" },

  -- completion
  {
    "hrsh7th/nvim-cmp",
    config = function()
      require("config.cmp")
    end,
  },
  { "hrsh7th/cmp-nvim-lsp" },
  { "L3MON4D3/LuaSnip" },
  { "saadparwaiz1/cmp_luasnip" },
  { "rafamadriz/friendly-snippets" },

  -- formatting / linters
  { "jose-elias-alvarez/null-ls.nvim" },
}
