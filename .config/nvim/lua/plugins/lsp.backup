
return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"mfussenegger/nvim-dap",
		"jay-babu/mason-nvim-dap.nvim",
	},

	config = function()
		require("mason").setup()
		require("mason-nvim-dap").setup({
			ensure_installed = { "javadbg", "javatest" },
		})

		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		require("mason-lspconfig").setup({
			ensure_installed = { "lua_ls", "rust_analyzer", "jdtls", "ts_ls", "bashls", "clangd" },
			handlers = {
				function(server_name) -- default handler
					print("setting up ", server_name)
					if server_name ~= "jdtls" then -- avoid duplicate lsp jdtls
						require("lspconfig")[server_name].setup({
							capabilities = capabilities,
						})
					end
				end,
			},
		})

		local lspconfig = require("lspconfig")

		lspconfig.lua_ls.setup({
			settings = {
				Lua = {
					runtime = {
						-- Tell the language server which version of Lua you're using
						-- (most likely LuaJIT in the case of Neovim)
						version = "LuaJIT",
					},
					diagnostics = {
						-- Get the language server to recognize the `vim` global
						globals = {
							"vim",
							"require",
						},
					},
					workspace = {
						-- Make the server aware of Neovim runtime files
						library = vim.api.nvim_get_runtime_file("", true),
					},
					-- Do not send telemetry data containing a randomized but unique identifier
					telemetry = {
						enable = false,
					},
				},
			},
			capabilities = capabilities,
		})

	end,
}
