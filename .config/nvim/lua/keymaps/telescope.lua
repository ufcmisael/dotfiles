
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = "Search files (Telescope)" })
vim.keymap.set('n', '<leader>pg', builtin.git_files, { desc = "Search git_files (Telescope)" })
vim.keymap.set('n', '<leader>vh', builtin.help_tags, { desc = "View helptags (Telescope)" })

vim.keymap.set('n', '<leader>pb', builtin.buffers, { desc = "Search exiting buffers (Telescope)" })
vim.keymap.set('n', '<leader>po', builtin.oldfiles, { desc = "Search recent files (Telescope)" }) -- paia
vim.keymap.set('n', '<leader>pd', builtin.diagnostics, { desc = "Search diagnostics (Telescope)" }) -- paia

vim.keymap.set('n', '<leader>pF', function() builtin.find_files({ cwd = vim.fn.expand('$HOME') }) end,
  { desc = "Search files from $HOME (Telescope)" })

vim.keymap.set('n', '<leader>ps', function()
  builtin.grep_string({ search = vim.fn.input("Grep > ") });
end, { desc = "Search string (Telescope)" })

vim.keymap.set('n', '<leader>pws', function()
  local word = vim.fn.expand("<cword>")
  builtin.grep_string({ search = word });
end, { desc = "Search first word in buffer (Telescope)" })

vim.keymap.set('n', '<leader>pwS', function()
  local word = vim.fn.expand("<cWORD>")
  builtin.grep_string({ search = word });
end, { desc = "Search whole buffer (Telescope)" })

local lsp = vim.lsp.buf
vim.keymap.set('n', '<leader>ch', lsp.hover, { desc = "Code hover doc (Lsp)" })
vim.keymap.set('n', '<leader>cd', lsp.definition, { desc = "Code goto definition (Lsp)" })
vim.keymap.set({ 'n', 'v' }, '<leader>ca', lsp.code_action, { desc = "Code actions (Lsp)" })
vim.keymap.set('n', '<leader>cr', builtin.lsp_references, { desc = "Code goto references (Telescope)" })
vim.keymap.set('n', '<leader>ci', builtin.lsp_implementations, { desc = "Code goto implementations (Telescope)" })
vim.keymap.set('n', '<leader>cR', lsp.rename, { desc = "Code rename (Lsp)" })
vim.keymap.set('n', '<leader>cD', lsp.declaration, { desc = "Code goto declaration (Lsp)" })
