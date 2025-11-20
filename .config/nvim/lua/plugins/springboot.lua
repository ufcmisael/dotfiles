return {
  "mfussenegger/nvim-jdtls",
  "elmcgill/springboot-nvim",
  dependencies = {
    "neovim/nvim-lspconfig",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "mfussenegger/nvim-dap",
    "jay-babu/mason-nvim-dap.nvim",
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    local jdtls_config = require("jdtls-config") -- seu setup_jdtls.lua
    local springboot_nvim = require("springboot-nvim")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    -- Função para detectar se o projeto é Spring Boot
    local function is_spring_project()
      local root_files = { "pom.xml", "build.gradle", "build.gradle.kts" }
      local root_dir = vim.fn.getcwd()
      for _, f in ipairs(root_files) do
        if vim.fn.filereadable(root_dir .. "/" .. f) == 1 then
          local spring_files = vim.fn.glob(root_dir .. "/src/main/java/**/*.java")
          if string.find(spring_files, "springframework") then
            return true
          end
        end
      end
      return false
    end

    -- Função para iniciar o LSP correto
    local function setup_java()
      if is_spring_project() then
        -- Spring Boot plugin + JDTLS integrado
        springboot_nvim.setup({
          on_attach = function()
            jdtls_config.setup_jdtls()
          end,
        })

        -- Keymaps Spring Boot
        vim.keymap.set('n', '<leader>JR', springboot_nvim.boot_run, {desc = "[J]ava [R]un Spring Boot"})
        vim.keymap.set('n', '<leader>Jc', springboot_nvim.generate_class, {desc = "[J]ava Create [C]lass"})
        vim.keymap.set('n', '<leader>Ji', springboot_nvim.generate_interface, {desc = "[J]ava Create [I]nterface"})
        vim.keymap.set('n', '<leader>Je', springboot_nvim.generate_enum, {desc = "[J]ava Create [E]num"})
        vim.keymap.set('n', '<leader>Jr', springboot_nvim.generate_record, {desc = "[J]ava Create [R]ecord"})
      else
        -- JDTLS puro
        jdtls_config.setup_jdtls()
      end
    end

    -- Chamando a função para configurar o LSP
    setup_java()
  end
}

