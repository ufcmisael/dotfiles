
return {
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      local icons = require("config.icons")

      -- setup gitsigns
      require("gitsigns").setup({
        signs = {
          add = {
            text = icons.ui.BoldLineMiddle,
          },
          change = {
            text = icons.ui.BoldLineDashedMiddle,
          },
          delete = {
            text = icons.ui.TriangleShortArrowRight,
          },
          topdelete = {
            text = icons.ui.TriangleShortArrowRight,
          },
          changedelete = {
            text = icons.ui.BoldLineMiddle,
          },
        },
        watch_gitdir = {
          interval = 1000,
          follow_files = true,
        },
        attach_to_untracked = true,
        current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
        update_debounce = 200,
        max_file_length = 40000,
        preview_config = {
          border = "rounded",
          style = "minimal",
          relative = "cursor",
          row = 0,
          col = 1,
        },
      })

      -- Set a vim motion to <Space> + g + h to preview changes to the file under the cursor in normal mode
      vim.keymap.set("n", "<leader>gh", ":Gitsigns preview_hunk<CR>", { desc = "Git Preview Hunk (Gitsigns)" })
    end,
  },
  {
    "tpope/vim-fugitive",
    config = function()
      -- view the most recent contributers to the file
      vim.keymap.set("n", "<leader>ga", ":Git add %:.<CR>", { desc = "Git Add (Fugitive)" })
      vim.keymap.set("n", "<leader>gA", ":Git add .<CR>", { desc = "Git Add All (Fugitive)" })
      vim.keymap.set("n", "<leader>gb", ":Git blame<CR>", { desc = "Git Blame (Fugitive)" })
      vim.keymap.set("n", "<leader>gc", ":Git commit -m \"", { desc = "Git Commit (Fugitive)" })
      vim.keymap.set("n", "<leader>gp", ":Git push -u origin ", { desc = "Git Push (Fugitive)" })
      vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { desc = "Search git (Fugitive)" })
    end,
  },
}
