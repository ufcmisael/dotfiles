
require("config.lazy")
--require("config.autocmds") -- needs be required in lazy.lua if not on_attach wont work
require("keymaps.remap")
require("keymaps.telescope")
require("keymaps.harpoon")

-- enable mouse
vim.opt.mouse = "a"
--vim.opt.mouse = ""

-- line number
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.numberwidth = 3
vim.opt.signcolumn = "yes"
-- vim.opt.colorcolumn = "200"

-- enable relative number in netrw
vim.g.netrw_bufsettings = 'noma nomod nu rnu nobl nowrap ro'

-- tab config
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2 -- <Tab> key
vim.opt.smartindent = true
vim.opt.breakindent = true

-- general config
vim.opt.syntax = "ON"
vim.opt.smartcase = true
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.cmdheight = 0
vim.opt.clipboard = "unnamedplus"
vim.opt.termguicolors = true
vim.g.transparent_enabled = true
vim.completeopt = "menu,menuone,noselect"
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.updatetime = 100 -- faster completion
vim.opt.writebackup = false -- prevent editing files openned elsewhere
--vim.opt.undofile = true -- create an undofile; enable undo after reopening nvim

-- setting scroll limits; keep minimum x number of screen lines above and below the cursor
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 8

-- setting current cursor line color
vim.o.cursorline = true
--vim.api.nvim_set_hl(0, 'LineNr', { fg = "#d8dee9"})
--vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = "yellow"})
--vim.opt.cursorlineopt = "number"
--vim.opt.cursorline = true
