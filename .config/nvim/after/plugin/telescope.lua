--
-- [[ Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`
-- See `:help telescope.builtin`
-- See `:help telescope.themes`
--

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

local nmap = function(keys, func, desc)
  vim.keymap.set('n', keys, func, { desc = desc })
end

nmap('gr', builtin.lsp_references, '[G]oto [R]eferences')
nmap('<leader>fp', builtin.find_files, '[F]ind files')
nmap('<leader>fh', builtin.help_tags, '[F]ind [H]elp')
nmap('<leader>fw', builtin.grep_string, '[F]ind current [W]ord')
nmap('<leader>fg', builtin.live_grep, '[F]ind by [G]rep')
nmap('<leader>fb', builtin.buffers, '[F]ind existing [B]uffers')
nmap('<leader>fm', builtin.marks, '[F]ind existing [M]arks')
nmap('<leader>fd', builtin.diagnostics, '[F]ind [D]iagnostics')
nmap('<leader>fr', builtin.oldfiles, '[F]ind [R]ecently opened files')
nmap('<leader>fs', builtin.lsp_document_symbols, '[F]ind document [S]ymbols')

nmap(
  '<leader><leader>',
  function()
    builtin.current_buffer_fuzzy_find(themes.get_dropdown {
      winblend = 10,
      previewer = false,
    })
  end,
  '[  ] Fuzzily search in current buffer'
)
