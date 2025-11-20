return {
  { "folke/neodev.nvim" },
  {
    "folke/neoconf.nvim",
    cmd = "Neoconf",
    dependencies = { "neovim/nvim-lspconfig" },
  },
  { "nvim-lua/plenary.nvim", lazy = true },
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
  },
  { "mfussenegger/nvim-jdtls" },
  {
    "L3MON4D3/LuaSnip",
    build = "make install_jsregexp",
    dependencies = { "rafamadriz/friendly-snippets" },
  },
  --  { "github/copilot.vim" },
  -- {
  --   "folke/noice.nvim",
  --   event = "VeryLazy",
  --   opts = {},
  --   dependencies = {
  --     "MunifTanjim/nui.nvim",
  --     "rcarriga/nvim-notify",
  --   },
  -- },
}
