
return {
  "elmcgill/springboot-nvim",
  dependencies = {
    "neovim/nvim-lspconfig",
    "mfussenegger/nvim-jdtls"
  },
  config = function()
    -- gain acces to the springboot nvim plugin and its functions
    local springboot_nvim = require("springboot-nvim")

    -- run the spring boot project in a vim terminal
    vim.keymap.set('n', '<leader>JR', springboot_nvim.boot_run, {desc = "[J]ava [R]un Spring Boot"})
    -- open the generate class ui to create a class
    vim.keymap.set('n', '<leader>Jc', springboot_nvim.generate_class, {desc = "[J]ava Create [C]lass"})
    -- open the generate interface ui to create an interface
    vim.keymap.set('n', '<leader>Ji', springboot_nvim.generate_interface, {desc = "[J]ava Create [I]nterface"})
    -- open the generate enum ui to create an enum
    vim.keymap.set('n', '<leader>Je', springboot_nvim.generate_enum, {desc = "[J]ava Create [E]num"})
    -- open the generate record ui to create a record
    vim.keymap.set('n', '<leader>Jr', springboot_nvim.generate_record, {desc = "[J]ava Create [R]ecord"})

    -- run the setup function with default configuration
    springboot_nvim.setup()
  end
}
