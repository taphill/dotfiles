require("plugins")
require("impatient")

--
-- [[ Options ]]
-- See `:help vim.o`
--

-- Set color options
vim.o.termguicolors = true
vim.o.background = "dark"

-- Set cursorline highlight.
-- This does make screen redrawing slower when enabled, but I haven't noticed any issues
vim.o.cursorline = true

-- Set line numbers and relative line numbers
vim.o.number = true
vim.o.rnu = true

-- Set completeopt to have a better completion experience
vim.o.completeopt = "menuone,noselect"

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
vim.wo.signcolumn = "yes"

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
vim.g.user_emmet_mode = "n"
vim.g.user_emmet_leader_key = ","

local opts = { noremap = true, silent = true }

vim.keymap.set("i", "jk", "<esc>", opts)
vim.keymap.set("v", ",c", '"+y', opts)
vim.keymap.set("n", "<leader>t", "<cmd>tabn<CR>", opts)
vim.keymap.set("n", "<leader>r", "<cmd>tabp<CR>", opts)
vim.keymap.set("n", "<C-h>", "<C-W>h", opts)
vim.keymap.set("n", "<C-j>", "<C-W>j", opts)
vim.keymap.set("n", "<C-k>", "<C-W>k", opts)
vim.keymap.set("n", "<C-l>", "<C-W>l", opts)
vim.keymap.set("n", "<leader>ee", "<cmd>Explore<CR>", opts)
vim.keymap.set("n", "<leader>ex", "<cmd>Sexplore<CR>", opts)
vim.keymap.set("n", "<leader>ev", "<cmd>Vexplore<CR>", opts)
vim.keymap.set("n", "<leader>z", ":wincmd _<cr>:wincmd |<cr>", opts)
vim.keymap.set("n", "<leader>=", ":wincmd =<cr>", opts)
vim.keymap.set("n", "<leader>vs", "<cmd>VtrSendFile<cr>", opts)
vim.keymap.set("n", "<leader>vc", "<cmd>VtrClearRunner<cr>", opts)
vim.keymap.set("n", "<leader>voh", '<cmd>VtrOpenRunner {"orientation": "v", "percentage": 50}<cr>', opts)
vim.keymap.set("n", "<leader>vov", '<cmd>VtrOpenRunner {"orientation": "h", "percentage": 50}<cr>', opts)
vim.keymap.set("n", ",ws", "<cmd>write <bar> suspend<CR>", opts)

--
-- [[ Auto commands ]]
--

-- Automatically rebalance windows on vim resize
vim.cmd("autocmd VimResized * :wincmd =")

-- File specific settings
vim.cmd("autocmd Filetype go setlocal tabstop=8 softtabstop=8 shiftwidth=8")
vim.cmd("autocmd Filetype markdown setlocal wrap textwidth=65")

-- Highlight on yank
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = "*",
})

--
-- [[ Misc. Functions ]]
--

-- Disable some built-in plugins I don't want
local disabled_built_ins = {
	"gzip",
	"man",
	"shada_plugin",
	"tarPlugin",
	"tar",
	"zipPlugin",
	"zip",
}

for i = 1, 7 do
	vim.g["loaded_" .. disabled_built_ins[i]] = 1
end

-- Check highligh group
vim.api.nvim_exec(
	[[
  function! SynStack()
    if !exists("*synstack")
      return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
  endfunc
  noremap ,f :call SynStack()<CR>
]],
	false
)
