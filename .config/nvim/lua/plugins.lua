return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- LSP
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v1.x',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-path'},
      {'saadparwaiz1/cmp_luasnip'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/cmp-nvim-lua'},

      -- Snippets
      {'L3MON4D3/LuaSnip'},
      {'rafamadriz/friendly-snippets'},
    }
  }

  -- Treesitter
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use { 'nvim-treesitter/playground' }

  -- Fuzzy Finder (files, lsp, etc)
  use { 'nvim-telescope/telescope.nvim', branch = '0.1.x', requires = { 'nvim-lua/plenary.nvim' } }
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  -- Copilot
  use 'github/copilot.vim'

  -- Statusline
  use 'nvim-lualine/lualine.nvim'

  -- Colorscheme
  use 'rebelot/kanagawa.nvim'

  -- Utilities
  use 'mattn/emmet-vim'
  use 'mbbill/undotree'
  use 'windwp/nvim-autopairs'
  use 'numToStr/Comment.nvim'
  use 'prettier/vim-prettier'
  use 'MaxMEllon/vim-jsx-pretty'
  use 'lewis6991/impatient.nvim'
  use 'christoomey/vim-tmux-navigator'

  -- Text objects
  use 'wellle/targets.vim'
  use 'kana/vim-textobj-line'
  use 'kana/vim-textobj-user'
  use 'kana/vim-textobj-entire'
  use 'michaeljsmith/vim-indent-object'

  -- Tpope stuff
  use 'tpope/vim-endwise'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-rails'
  use 'tpope/vim-repeat'
  use 'tpope/vim-surround'
  use 'tpope/vim-unimpaired'
  use 'tpope/vim-vinegar'
end)
