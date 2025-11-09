
--vim.g.mapleader = " "
--vim.g.maplocalleader = " "

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Exit file to netrw" })

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Remove search highlights" })
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" });

-- better window navigation
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- terminal mode
vim.keymap.set("t", "<C-h>", "<C-\\><C-n><C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("t", "<C-l>", "<C-\\><C-n><C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("t", "<C-j>", "<C-\\><C-n><C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("t", "<C-k>", "<C-\\><C-n><C-w><C-k>", { desc = "Move focus to the upper window" })

-- split windows
vim.keymap.set("n", "<leader>ws", "<C-w><C-s>", { desc = "Window split horizontal" })
vim.keymap.set("n", "<leader>wv", ":vsplit<CR>", { desc = "Window split vertical" })

-- in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move marked text" })
vim.keymap.set("v", "K", ":m '>-2<CR>gv=gv", { desc = "Move marked text" })
vim.keymap.set("v", "<", "<gv", { desc = "Ident left" })
vim.keymap.set("v", ">", ">gv", { desc = "Ident right" })

-- identation helper 
vim.keymap.set("n", "<leader>bl", function() require("ibl").setup() end, { desc = "BlankLine enable" })
vim.keymap.set("n", "<leader>bL", "<cmd>IBLDisable<CR>", { desc = "BlankLine disable" })
