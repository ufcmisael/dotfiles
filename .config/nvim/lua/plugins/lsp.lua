
return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		"mfussenegger/nvim-dap",
		"jay-babu/mason-nvim-dap.nvim",
	},

	config = function()
		-- ========================================================
		-- Variáveis de Organização
		-- ========================================================
		local servers = {
			"bashls",
			"clangd",
			"elixirls",
			"jdtls",
			"lua_ls",
			"pyright",
			"rust_analyzer",
			"ts_ls",
		}

		local non_lsp_tools = {
			"black",
			"flake8",
			"clang-format",
			"google-java-format",
			"prettierd",
			"eslint_d",
			"stylua",
			"shfmt",
			"codebook",
			"java-debug-adapter",
			"java-test",
		}

		-- ========================================================
		-- Inicialização dos Gerenciadores (Mason)
		-- ========================================================

		-- 1. Inicializa o Mason Básico
		require("mason").setup()

		-- 2. Garante Ferramentas Extras (Formatadores e Linters)
		require("mason-tool-installer").setup({
			ensure_installed = non_lsp_tools,
		})

		-- 3. Garante as ferramentas de Debug
		require("mason-nvim-dap").setup({
			ensure_installed = { "javadbg", "javatest" },
		})

		-- 4. Nova API: Ativa e instala os LSPs automaticamente
		require("mason-lspconfig").setup({
			ensure_installed = servers,
		})

		-- ========================================================
		-- 5. CONFIGURAÇÕES CUSTOMIZADAS (Neovim 0.11+ com Mason)
		-- ========================================================
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		-- Servidores Simples
		-- Apenas registramos as capabilities. O Mason fará o vim.lsp.enable() automaticamente.
		local simple_servers = { "bashls", "clangd", "pyright", "ts_ls" }
		for _, server in ipairs(simple_servers) do
			vim.lsp.config(server, { capabilities = capabilities })
		end

		-- Configurações Manuais Avançadas (Overrides)

		-- Lua
		vim.lsp.config("lua_ls", {
			capabilities = capabilities,
			settings = {
				Lua = {
					runtime = { version = "LuaJIT" },
					diagnostics = { globals = { "vim", "require" } },
					workspace = { library = vim.api.nvim_get_runtime_file("", true) },
					telemetry = { enable = false },
				},
			},
		})

		-- Rust
		vim.lsp.config("rust_analyzer", {
			capabilities = capabilities,
			settings = {
				["rust-analyzer"] = {
					cargo = { allFeatures = true },
					checkOnSave = { command = "clippy" },
				},
			},
		})

		-- Elixir
		vim.lsp.config("elixirls", {
			capabilities = capabilities,
			cmd = { "elixir-ls" },
			filetypes = { "elixir", "eelixir" },
			root_dir = function(fname)
				return vim.fs.root(fname, { "mix.exs", ".git" }) or vim.fs.dirname(fname)
			end,
		})

		-- JDTLS (Java)
		vim.lsp.config("jdtls", {})
	end,
}
