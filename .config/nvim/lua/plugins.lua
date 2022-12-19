-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
-- vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- LSP
  use {
    'VonHeikemen/lsp-zero.nvim',
    requires = {
      {'neovim/nvim-lspconfig'},
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-path'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/cmp-nvim-lua'}
    }
  }

  -- Fuzzy Finder (files, lsp, etc)
  use { 'nvim-telescope/telescope.nvim', branch = '0.1.x', requires = { 'nvim-lua/plenary.nvim' } }
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  -- Colorscheme
  use 'tjdevries/colorbuddy.nvim'
  use 'taphill/glamour.nvim'
  use 'taphill/inspired_github.nvim'

  -- Syntax highlighting
  use 'pangloss/vim-javascript'
  use 'MaxMEllon/vim-jsx-pretty'
  use 'prettier/vim-prettier'

  -- Utilities
  use 'mattn/emmet-vim'
  use 'mbbill/undotree'
  use 'folke/zen-mode.nvim'
  use 'jiangmiao/auto-pairs'
  use 'numToStr/Comment.nvim'
  use 'lewis6991/gitsigns.nvim'
  use 'lukas-reineke/indent-blankline.nvim'

  -- Text objects
  use 'wellle/targets.vim'
  use 'kana/vim-textobj-line'
  use 'kana/vim-textobj-user'
  use 'kana/vim-textobj-entire'
  use 'michaeljsmith/vim-indent-object'

  -- Tpope stuff
  use 'tpope/vim-endwise'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-repeat'
  use 'tpope/vim-surround'
  use 'tpope/vim-unimpaired'
  use 'tpope/vim-vinegar'
end)
