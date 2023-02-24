-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`
-- See `:help telescope.builtin`
-- See `:help telescope.themes`

local telescope = require('telescope')
local actions = require('telescope.actions')
local builtin = require('telescope.builtin')
local themes = require('telescope.themes')

telescope.setup {
  defaults = {
    layout_strategy = 'horizontal',
    layout_config = {
      height = 0.95,
      width = 0.99,
    },
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
        ["<esc>"] = actions.close,
      }
    }
  },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    }
  }
}

telescope.load_extension('fzf')

vim.keymap.set('n', '<leader>fp', builtin.find_files, { desc = '[F]ind [F]iles' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = '[F]ind [H]elp' })
vim.keymap.set('n', '<leader>fw', builtin.grep_string, { desc = '[F]ind current [W]ord' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = '[F]ind by [G]rep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = '[F]ind existing [B]uffers' })
vim.keymap.set('n', '<leader>fm', builtin.marks, { desc = '[F]ind existing [M]arks' })
vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = '[F]ind [D]iagnostics' })
vim.keymap.set('n', '<leader>fr', builtin.oldfiles, { desc = '[F]ind [R]ecently opened files' })

vim.keymap.set('n', '<leader><leader>', function()
  builtin.current_buffer_fuzzy_find(themes.get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[  ] Fuzzily search in current buffer' })
