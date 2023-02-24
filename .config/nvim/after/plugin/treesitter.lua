--[[

Unforunately, treesitter's indent feature is not very stable right now for jsx/tsx files.

But, I do still want to use treesitter for syntax highlighting, so I've had to do some hacks.

  1. Disable treesitter's indent feature
  2. Enable 'additional_vim_regex_highlighting'.
  3. Install the 'maxmellon/vim-jsx-pretty' plugin to use it's indenting.

--]]


--
-- Set colorscheme
--

vim.o.termguicolors = true
vim.o.background = 'dark'

local default_colors = require("kanagawa.colors").setup()

-- These overrides are necessary to get the correct colors for jsx/tsx files
-- They are NOT doing what the code says they should be doing, but for some reason
-- they are necessary to get the correct colors for me.
local overrides = {
  ['@conditional.ternary'] = { fg = default_colors.fujiWhite },
  htmlEndTag = { fg = default_colors.crystalBlue },
  htmlTagName = { fg = default_colors.oniViolet, bold = false },
  javaScriptReserved = { fg = default_colors.waveRed },
  javaScriptLabel = { fg = default_colors.waveRed },
  javaScriptStatement = { fg = default_colors.waveRed },
  jsonKeyword = { fg = default_colors.oniViolet, bold = false },
  typescriptDefault = { fg = default_colors.waveRed },
  typescriptObjectLabel = { fg = default_colors.waveRed },
  typescriptStatementKeyword = { fg = default_colors.waveRed },
}

require'kanagawa'.setup({ overrides = overrides })

vim.cmd("colorscheme kanagawa")


--
-- [[ Configure Treesitter ]]
-- See `:help nvim-treesitter`
--

require('nvim-treesitter.configs').setup {
  ensure_installed = { 'lua', 'javascript', 'typescript', 'tsx', 'help', 'vim' },
  highlight = {
    enable = true,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = { 'javascript', 'typescript', 'tsx' }
  },
  indent = {
    enable = false
  }
}
