
return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require('telescope').setup{
      defaults = {

         vimgrep_arguments = {
           "rg",
           "--color=never",
           "--no-heading",
           "--with-filename",
           "--line-number",
           "--column",
           "--smart-case",
           "--ignore-file=" .. vim.fn.expand("$HOME") .. "/.fdignore" -- added, use later
         },

        layout_strategy = 'vertical',
        selection_strategy = "reset",
        sorting_strategy = "ascending",
        preview = { treesitter = true },

        layout_config = {
          prompt_position = 'top',
          width = 0.87,
          height = 0.80,
          --preview_cutoff = 0,
          horizontal = {mirror = false, preview_cutoff = 0 },
          vertical = {mirror = true }
        },

--         path_display = {"truncate"}, -- path_display = {"absolute"},
--         winblend = 0,
--         border = {},
         set_env = {["COLORTERM"] = "truecolor"},
      },

       pickers = {
         find_files = {
          hidden = true,
          file_ignore_patterns = {".git/", ".cache", "%.o", "%.a", "%.out", "%.class",
		"%.pdf", "%.mkv", "%.mp4", "%.png", "%.zip", "%.json" },
         }
       },
    }
  end,
}
