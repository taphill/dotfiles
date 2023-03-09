--
-- [[ Treesitter ]]
-- See `:help treesitter`
--

require('nvim-treesitter.configs').setup {
  ensure_installed = { 'lua', 'javascript', 'typescript', 'tsx', 'help', 'vim' },
  highlight = {
    enable = true,
  },
  indent = {
    enable = true
  }
}
