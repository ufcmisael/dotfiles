
return {
	"Eandrju/cellular-automaton.nvim",
	config = function()
		local config = {
			fps = 50,
			name = "slide",
		}
		config.update = function(grid)
			for i = 1, #grid do
				local prev = grid[i][#grid[i]]
				for j = 1, #grid[i] do
					grid[i][j], prev = prev, grid[i][j]
				end
			end
			return true
		end
		require("cellular-automaton").register_animation(config)

		-- hero
    vim.keymap.set("n", "<leader>fmg", "<cmd>CellularAutomaton game_of_life<CR>", { desc = "Best thing ever (game)" })
		vim.keymap.set("n", "<leader>fmr", "<cmd>CellularAutomaton make_it_rain<CR>", { desc = "Best thing ever (rain)" })
		vim.keymap.set("n", "<leader>fms", "<cmd>CellularAutomaton scramble<CR>", { desc = "Best thing ever (scramble)" })
		vim.keymap.set("n", "<leader>fmS", "<cmd>CellularAutomaton slide<CR>", { desc = "Best thing ever (slide)" })

	end,
}
