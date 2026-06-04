
return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "main", -- A versão moderna
        build = ":TSUpdate",
        config = function()
            -- No Neovim 0.12, isso é tudo o que você precisa para ligar as cores.
            -- O editor faz o resto nativamente!
            vim.api.nvim_create_autocmd("FileType", {
                callback = function(args)
                    pcall(vim.treesitter.start, args.buf)
                end,
            })
        end,
    },
    {
        "windwp/nvim-ts-autotag",
        config = function()
            require("nvim-ts-autotag").setup({
                opts = {
                    enable_close = true,
                    enable_rename = true,
                    enable_close_on_slash = false,
                },
                per_filetype = {
                    ["html"] = { enable_close = false },
                },
            })
        end,
    }
}
