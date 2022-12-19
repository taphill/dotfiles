-- Enable `lukas-reineke/indent-blankline.nvim`
-- See `:help indent_blankline.txt`

vim.g.indent_blankline_enabled = false

require('indent_blankline').setup {
  char = '┊',
  show_trailing_blankline_indent = false,
}


