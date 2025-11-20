return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "mfussenegger/nvim-dap",
    "jay-babu/mason-nvim-dap.nvim",
  },

  config = function()
    -- ========================
    -- Setup Mason
    -- ========================
    require("mason").setup()
    require("mason-nvim-dap").setup({
      ensure_installed = { "javadbg", "javatest" },
    })

    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    local lspconfig = require("lspconfig")
    local mason_lspconfig = require("mason-lspconfig")

    -- ========================
    -- Setup Mason-LSPConfig
    -- ========================
    mason_lspconfig.setup({
      ensure_installed = { "elixirls", "lua_ls", "rust_analyzer", "jdtls", "ts_ls", "bashls", "clangd" },
    })

    -- ========================
    -- Lua
    -- ========================
    lspconfig.lua_ls.setup({
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

    -- ========================
    -- Rust
    -- ========================
    lspconfig.rust_analyzer.setup({
      capabilities = capabilities,
      settings = {
        ["rust-analyzer"] = {
          cargo = { allFeatures = true },
          checkOnSave = { command = "clippy" },
        },
      },
    })

    -- ========================
    -- TypeScript / JavaScript
    -- ========================
    lspconfig.ts_ls.setup({
      capabilities = capabilities,
      filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
    })

    -- ========================
    -- Bash
    -- ========================
    lspconfig.bashls.setup({
      capabilities = capabilities,
      filetypes = { "sh", "bash" },
    })

    -- ========================
    -- C/C++
    -- ========================
    lspconfig.clangd.setup({
      capabilities = capabilities,
      cmd = { "clangd", "--background-index" },
    })

    -- ========================
    -- JDTLS (Java)
    -- ========================
    -- Inicie manualmente com:
    -- require("plugins.jdtls").setup_jdtls()
    -- ou via springboot-nvim para projetos Spring Boot
 
    -- ========================
    -- Elixir
    -- ========================
    lspconfig.elixirls.setup({
      capabilities = capabilities,
      cmd = { "elixir-ls" },  -- caminho padrão se instalado via Mason
      filetypes = { "elixir", "eelixir" },
      root_dir = lspconfig.util.root_pattern("mix.exs", ".git"),
    })

  end,
}   
--   end,
-- }

-- return {
--   "neovim/nvim-lspconfig",
--   dependencies = {
--     "williamboman/mason.nvim",
--     "williamboman/mason-lspconfig.nvim",
--     "mfussenegger/nvim-dap",
--     "jay-babu/mason-nvim-dap.nvim",
--   },
--
--   config = function()
--     -- ========================
--     -- Setup Mason
--     -- ========================
--     require("mason").setup()
--     require("mason-nvim-dap").setup({
--       ensure_installed = { "javadbg", "javatest" },
--     })
--
--     local capabilities = require("cmp_nvim_lsp").default_capabilities()
--     local lspconfig = vim.lsp.config  -- Versão nova do nvim-lspconfig
--
--     -- ========================
--     -- Setup Mason-LSPConfig
--     -- ========================
--     local mason_lspconfig = require("mason-lspconfig")
--     mason_lspconfig.setup({
--       ensure_installed = { "lua_ls", "rust_analyzer", "jdtls", "ts_ls", "bashls", "clangd" },
--     })
--
--     -- ========================
--     -- Configura cada LSP manualmente (exceto JDTLS)
--     -- ========================
--     local servers = { "lua_ls", "rust_analyzer", "ts_ls", "bashls", "clangd" }
--
--     for _, server in ipairs(servers) do
--       if server == "lua_ls" then
--         lspconfig.lua_ls.setup({
--           capabilities = capabilities,
--           settings = {
--             Lua = {
--               runtime = { version = "LuaJIT" },
--               diagnostics = { globals = { "vim", "require" } },
--               workspace = { library = vim.api.nvim_get_runtime_file("", true) },
--               telemetry = { enable = false },
--             },
--           },
--         })
--       elseif server == "rust_analyzer" then
--         lspconfig.rust_analyzer.setup({
--           capabilities = capabilities,
--           settings = {
--             ["rust-analyzer"] = {
--               cargo = { allFeatures = true },
--               checkOnSave = { command = "clippy" },
--             },
--           },
--         })
--       elseif server == "ts_ls" then
--         lspconfig.ts_ls.setup({
--           capabilities = capabilities,
--           filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
--         })
--       elseif server == "bashls" then
--         lspconfig.bashls.setup({
--           capabilities = capabilities,
--           filetypes = { "sh", "bash" },
--         })
--       elseif server == "clangd" then
--         lspconfig.clangd.setup({
--           capabilities = capabilities,
--           cmd = { "clangd", "--background-index" },
--         })
--       end
--     end
--
--     -- ========================
--     -- JDTLS (Java) só inicia manualmente
--     -- ========================
--     -- Você pode usar o seu setup_jdtls() do arquivo separado
--     -- ou integrar com springboot-nvim para projetos Spring
--   end,
-- }
