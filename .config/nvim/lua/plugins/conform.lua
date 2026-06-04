return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			-- 1. Define qual formatador usar para cada linguagem
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "black" },
				c = { "clang-format" },
				cpp = { "clang-format" },
				java = { "google-java-format" },
				-- Prettierd é super rápido. O Conform vai tentar usá-lo; se falhar, tenta o Prettier normal.
				javascript = { "prettierd", "prettier", stop_after_first = true },
				typescript = { "prettierd", "prettier", stop_after_first = true },
				html = { "prettierd", "prettier", stop_after_first = true },
				css = { "prettierd", "prettier", stop_after_first = true },
				json = { "prettierd", "prettier", stop_after_first = true },
				markdown = { "prettierd", "prettier", stop_after_first = true },
				sh = { "shfmt" },
			},

			-- 2. (OPCIONAL) Formata automaticamente ao salvar o arquivo
			format_on_save = {
				lsp_fallback = true, -- Se não houver formatador definido, usa o LSP padrão (ex: clangd, jdtls)
				async = false,
				timeout_ms = 1000,
			},
		})

		-- 3. Recriando a sua keymap <leader>cf
		vim.keymap.set({ "n", "v" }, "<leader>cf", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			})
		end, { desc = "[C]ode [F]ormat (Conform)" })
	end,
}
