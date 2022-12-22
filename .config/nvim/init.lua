-- Setup
require 'plugins'

local g = vim.g
local api = vim.api
local cmd = vim.cmd
local opt = vim.opt

-- Disable some built-in plugins we don't want
local disabled_built_ins = {
  'gzip', 'man', 'shada_plugin', 'tarPlugin', 'tar', 'zipPlugin', 'zip'
}

for i = 1, 7 do g['loaded_' .. disabled_built_ins[i]] = 1 end

-- Utils
-- vim.api.nvim_exec([[
--   function! SynStack()
--     if !exists("*synstack")
--       return
--     endif
--     echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
--   endfunc
--   noremap ,f :call SynStack()<CR>
-- ]], false)


-- Colorscheme
opt.termguicolors = true

local background = 'dark'

if background == 'dark' then
  require('colorbuddy').colorscheme('glamour_nvim')
else
  require('colorbuddy').colorscheme('inspired_github_nvim')
end

-- Settings
opt.expandtab       = true
opt.undolevels      = 1000
opt.ttimeoutlen     = 20
opt.shiftwidth      = 2
opt.softtabstop     = 2
opt.smartindent     = true
opt.splitbelow      = true
opt.splitright      = true
opt.tabstop         = 2
opt.synmaxcol       = 200
opt.updatetime      = 200
opt.conceallevel    = 2
opt.cscopetagorder  = 0
opt.cscopepathcomp  = 3
opt.showbreak       = string.rep(' ', 3) -- Make it so that long lines wrap smartly

-- UI
opt.wrap            = false
opt.cursorline      = true
opt.number          = true
opt.rnu             = true
opt.showcmd         = false
opt.showmode        = false
opt.ruler           = false
opt.pumblend        = 20
opt.pumheight       = 15
opt.cmdheight       = 1
opt.scrolloff       = 10
opt.sidescrolloff   = 5

-- Auto commands
cmd('autocmd Filetype go setlocal tabstop=8 shiftwidth=8 softtabstop=8')
cmd('autocmd Filetype markdown setlocal wrap textwidth=65')

-- Status line
opt.statusline = table.concat {
  '%#CursorLine#',
  ' ‹‹ ',
  '%f',
  ' ›› ',
  '%#DiffChange#',
  '%(  %M%R  %)',
  '%#CursorLine#',
  '%=',
  '  %*',
  '%#CursorLine#',
  ' ::',
  ' %{FugitiveStatusline()}',
  ' ::',
  ' %*'
}

-- Mappings
vim.g.mapleader = " "
local opts = { noremap=true, silent=true }

vim.g.user_emmet_mode = 'n'
vim.g.user_emmet_leader_key = ','

api.nvim_set_keymap('n', '<leader>ee', '<cmd>Explore<CR>', opts)
api.nvim_set_keymap('n', '<leader>es', '<cmd>Sexplore<CR>', opts)
api.nvim_set_keymap('n', '<leader>ev', '<cmd>Vexplore<CR>', opts)
api.nvim_set_keymap('n', '<leader>h', '<C-W><C-H><CR>', opts)
api.nvim_set_keymap('n', '<leader>j', '<C-W><C-J><CR>', opts)
api.nvim_set_keymap('n', '<leader>k', '<C-W><C-K><CR>', opts)
api.nvim_set_keymap('n', '<leader>l', '<C-W><C-L><CR>', opts)
api.nvim_set_keymap('n', '<leader>t', '<cmd>tabn<CR>', opts)
api.nvim_set_keymap('n', '<leader>r', '<cmd>tabp<CR>', opts)
api.nvim_set_keymap('v', ',c', '"+y', opts)
api.nvim_set_keymap('n', ',ws', '<cmd>write <bar> suspend<CR>', opts)
api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
