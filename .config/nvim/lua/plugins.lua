return require('packer').startup(function()
  use 'wbthomason/packer.nvim'

  use 'kyazdani42/nvim-web-devicons'
  use 'kyazdani42/nvim-tree.lua'

  use 'mhinz/vim-startify'

  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'} }
  }
  use 'nvim-telescope/telescope-fzy-native.nvim'

  use 'nvim-treesitter/nvim-treesitter'
  use 'nvim-treesitter/nvim-treesitter-textobjects'

  use 'terrortylor/nvim-comment'

  use 'tjdevries/colorbuddy.nvim'
  use 'Th3Whit3Wolf/onebuddy'

  -- Maybe I can delete some of these once treesitter is working?
  use 'jiangmiao/auto-pairs'
  use 'pangloss/vim-javascript'
  use 'kana/vim-textobj-entire'
  use 'kana/vim-textobj-line'
  use 'kana/vim-textobj-user'

  use 'tpope/vim-fugitive'
  use 'tpope/vim-surround'
  use 'tpope/vim-vinegar'
  use 'tpope/vim-unimpaired'
  use 'tpope/vim-endwise'
  use 'tpope/vim-rails'
end)
