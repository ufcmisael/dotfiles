
return{
  "folke/zen-mode.nvim",
  name = "zen-mode",
  config = function()

    vim.keymap.set("n", "<leader>zn", function()
      require("zen-mode").setup {
        window = {
          width = 90,
          options = { }
        },
      }
      require("zen-mode").toggle()
      vim.wo.wrap = false
      vim.wo.number = true
      vim.wo.rnu = true
    end, { desc = "ZenMode (light)" })

    vim.keymap.set("n", "<leader>zN", function()
      require("zen-mode").setup {
        window = {
          width = 80,
          options = { }
        },
      }
      require("zen-mode").toggle()
      vim.wo.wrap = false
      vim.wo.number = false
      vim.wo.rnu = false
      vim.opt.colorcolumn = "0"
    end, { desc = "ZenMode (monk)" })
  end
}

