
local harpoon = require('harpoon')
harpoon:setup({})

-- basic telescope-ui configuration
local conf = require("telescope.config").values
local function toggle_telescope(harpoon_files)
  local file_paths = {}
  for _, item in ipairs(harpoon_files.items) do
    table.insert(file_paths, item.value)
  end

  require("telescope.pickers").new({}, {
    prompt_title = "Harpoon",
    finder = require("telescope.finders").new_table({
      results = file_paths,
    }),
    previewer = conf.file_previewer({}),
    sorter = conf.generic_sorter({}),
    attach_mappings = function(prompt_buffer_number, map)
      -- Delete selected entry from the list
      map('i', '<C-d>', function()
        local state = require 'telescope.actions.state'
        local selected_entry = state.get_selected_entry()
        local current_picker = state.get_current_picker(prompt_buffer_number)
        print(selected_entry.index)
        harpoon:list():remove_at(selected_entry.index)
        current_picker:refresh(make_finder())
      end)
      return true
    end,
  }):find()
end

-- shortcuts
vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)

vim.keymap.set("n", "<C-e>", function() toggle_telescope(harpoon:list()) end,
  { desc = "Open harpoon window" })

vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end, { desc = "File 1 (Harpoon)" })
vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end, { desc = "File 2 (Harpoon)" })
vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end, { desc = "File 3 (Harpoon)" })
vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end, { desc = "File 4 (Harpoon)" })

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<C-P>", function() harpoon:list():prev() end)
vim.keymap.set("n", "<C-N>", function() harpoon:list():next() end)

