-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  use {
    'VonHeikemen/lsp-zero.nvim',
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

  -- Colorscheme
  use 'tjdevries/colorbuddy.nvim'
  use 'taphill/glamour.nvim'
  use 'taphill/inspired_github.nvim'

  -- Syntax highlighting
  use 'pangloss/vim-javascript'
  use 'MaxMEllon/vim-jsx-pretty'
  use 'prettier/vim-prettier'

  -- Utilities
  use 'mbbill/undotree'
  use 'folke/zen-mode.nvim'
  use 'jiangmiao/auto-pairs'
  use 'mattn/emmet-vim'
  use 'terrortylor/nvim-comment'

  -- Text objects
  use 'wellle/targets.vim'
  use 'kana/vim-textobj-entire'
  use 'kana/vim-textobj-line'
  use 'kana/vim-textobj-user'
  use 'michaeljsmith/vim-indent-object'

  -- Tpope stuff
  use 'tpope/vim-endwise'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-repeat'
  use 'tpope/vim-surround'
  use 'tpope/vim-unimpaired'
  use 'tpope/vim-vinegar'
end)
