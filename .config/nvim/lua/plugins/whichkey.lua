
return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {},
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false })
			end,
      desc = "Local Keymaps (Buffer)"
		},
	},
	config = function()
		-- gain access to the which key plugin
		local which_key = require("which-key")
-- file where the icons are located
		local icons = require("config.icons")

		-- Register prefixes for the different key mappings we have setup previously
		which_key.add({
			{ "<leader>/", group = "Comments", icon = { icon = icons.ui.Comment2, color = "gray" } },
			{ "<leader>?", group = "Local Keymaps (Whichkey)", icon = { icon = "?", color = "pink" } },
			{ "<leader>a", group = "Add to list (Harpoon)", icon = { icon = icons.ui.Hook, color = "azure" } },
			{ "<leader>b", group = "[B] Help ident", icon = { icon = "", color = "blue" } },
			{ "<leader>c", group = "[C] Code" },
			{ "<leader>d", group = "[D] Debug", icon = { icon = icons.ui.Bug, color = "red"} },
			{ "<leader>f", group = "[F] Surprise", icon = { icon = icons.ui.Fire, color = "yellow" } },
			{ "<leader>fm", group = "[FM] Almost there", icon = { icon = icons.ui.Fire2, color = "red" } },
			{ "<leader>g", group = "[G] Git" },
			{ "<leader>J", group = "[J] Java", icon = { icon = "", color = "red" } },
			{ "<leader>p", group = "[P] Searches", icon = { icon = icons.ui.Search, color = "green" } },
			{ "<leader>pb", icon = { icon = icons.ui.FileSymlink, color = "green" } },
			{ "<leader>pd", icon = { icon = icons.ui.FileSymlink, color = "green" } },
			{ "<leader>pf", icon = { icon = icons.ui.FindFile, color = "green" } },
			{ "<leader>pF", icon = { icon = icons.ui.FindFile, color = "green" } },
			{ "<leader>pg", icon = { icon = icons.ui.Search, color = "cyan" } },
			{ "<leader>po", icon = { icon = icons.ui.Search, color = "cyan" } },
			{ "<leader>ps", icon = { icon = icons.ui.Search, color = "cyan" } },
			{ "<leader>pv", icon = { icon = "", color = "gray" } },
			{ "<leader>pw", group = "[PW] Buffer Searches", icon = { icon = "󰛔", color = "blue" } },
			{ "<leader>pws", icon = { icon = "󰛔", color = "blue" } },
			{ "<leader>pwS", icon = { icon = "󰛔", color = "blue" } },
			{ "<leader>v", group = "[V] View", icon = { icon = icons.ui.Telescope, color = "blue" } },
			-- { '<leader>t', group = '[T] Trouble', icon = { icon = ""󰙵, color = "red" } },
			{ "<leader>x", group = "[X] Trouble", icon = { icon = icons.diagnostics.Debug, color = "red" } },
			-- { "<leader>x", group = "[X] Trouble", icon = { icon = icons.ui.Folder2, color = "red" } },
			-- { '<leader>x', group = '[X] Trouble', icon = { icon = "󱖫", color = "red" } },
			{ "<leader>w", group = "[W] Window", icon = { color = "red" } },
			{ "<leader>z", group = "[Z] Zen", icon = { icon = "󱅻", color = "cyan" } },
		})
	end,
}
