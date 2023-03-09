require 'plugins'

--
-- [[ Colorscheme ]]
--

vim.o.termguicolors = true
vim.o.background = 'dark'

require('kanagawa').setup({
  overrides = function(colors)
    local c = colors.palette
    return {
      ['@boolean'] = { fg = c.surimiOrange , bold = false },
      ['@conditional'] = { fg = c.oniViolet, bold = false },
      ['@conditional.ternary'] = { fg = c.fujiWhite },
      ['@constant'] = { fg = c.fujiWhite },
      ['@tag'] = { fg = c.oniViolet },
      htmlEndTag = { fg = c.crystalBlue },
      htmlTagName = { fg = c.oniViolet, bold = false },
      jsonKeyword = { fg = c.oniViolet, bold = false },
    }
  end,
})

vim.cmd("colorscheme kanagawa")



--
-- [[ Options ]]
-- See `:help vim.o`
--

-- Set cursorline highlight. This does make screen redrawing slower when enabled
vim.o.cursorline = true

-- Set line numbers and relative line numbers
vim.o.number = true
vim.o.rnu = true

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- Set line wrapping
vim.wo.wrap = false

-- Use spaces instead of tabs
vim.o.expandtab = true

-- Set the deafult number of spaces
local spaces = 2
vim.o.tabstop = spaces
vim.o.softtabstop = spaces
vim.o.shiftwidth = spaces

-- Set indent options
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.breakindent = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Decrease update time
vim.o.updatetime = 250

-- Keep the signcolumn expanded
vim.wo.signcolumn = 'yes'

-- When splitting a window, put the new window below the current
vim.o.splitbelow = true

-- When vert splitting a window, put the new window to the right of the current
vim.o.splitright = true

-- Minimum number of screen lines to keep above and below the cursor
vim.o.scrolloff = 10

-- Don't show partial command in the bottom right
vim.o.showcmd = false

-- Disable ruler
vim.o.ruler = false

-- Maximum column length to highlight syntax
-- Lower values will help avoid slow redrawing
vim.bo.synmaxcol = 200



--
-- [[ Keymaps ]]
-- See `:help vim.keymap.set()`
--

vim.g.mapleader = " "
vim.g.user_emmet_mode = 'n'
vim.g.user_emmet_leader_key = ','

local opts = { noremap=true, silent=true }

vim.keymap.set('v', ',c', '"+y', opts)
vim.keymap.set('n', '<leader>t', '<cmd>tabn<CR>', opts)
vim.keymap.set('n', '<leader>r', '<cmd>tabp<CR>', opts)
vim.keymap.set('n', '<leader>h', '<C-W><C-H><CR>', opts)
vim.keymap.set('n', '<leader>j', '<C-W><C-J><CR>', opts)
vim.keymap.set('n', '<leader>k', '<C-W><C-K><CR>', opts)
vim.keymap.set('n', '<leader>l', '<C-W><C-L><CR>', opts)
vim.keymap.set('n', '<leader>ee', '<cmd>Explore<CR>', opts)
vim.keymap.set('n', '<leader>ex', '<cmd>Sexplore<CR>', opts)
vim.keymap.set('n', '<leader>ev', '<cmd>Vexplore<CR>', opts)
vim.keymap.set('n', ',ws', '<cmd>write <bar> suspend<CR>', opts)



--
-- [[ Auto commands ]]
--

-- Format on save
-- vim.cmd('autocmd BufWritePre * lua vim.lsp.buf.formatting_sync()')

-- File specific settings
vim.cmd('autocmd Filetype go setlocal tabstop=8 softtabstop=8 shiftwidth=8')
vim.cmd('autocmd Filetype markdown setlocal wrap textwidth=65')

-- Highlight on yank
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})



--
-- [[ Misc. Functions ]]
--

-- Disable some built-in plugins we don't want
local disabled_built_ins = {
  'gzip', 'man', 'shada_plugin', 'tarPlugin', 'tar', 'zipPlugin', 'zip'
}

for i = 1, 7 do vim.g['loaded_' .. disabled_built_ins[i]] = 1 end

