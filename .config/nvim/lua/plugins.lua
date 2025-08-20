return require("packer").startup(function(use)
    -- Packer can manage itself
    use("wbthomason/packer.nvim")

    -- LSP
    use("neovim/nvim-lspconfig")
    use("hrsh7th/nvim-cmp")
    use("hrsh7th/cmp-nvim-lsp")

    -- Treesitter
    use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
    use({ "nvim-treesitter/playground" })

    -- Fuzzy Finder
    use({ "nvim-telescope/telescope.nvim", branch = "0.1.x", requires = { "nvim-lua/plenary.nvim" } })

    -- Statusline
    use("nvim-lualine/lualine.nvim")

    -- Colorscheme
    use("folke/tokyonight.nvim")
    use ("projekt0n/github-nvim-theme")

    -- Syntax
    use("MaxMEllon/vim-jsx-pretty")
    use("sbdchd/neoformat")

    -- Utilities
    use("mattn/emmet-vim")
    use("mbbill/undotree")
    use("windwp/nvim-autopairs")
    use("architect/vim-plugin")
    use("jparise/vim-graphql")
    use("christoomey/vim-tmux-navigator")

    -- Text objects
    use("wellle/targets.vim")
    use("kana/vim-textobj-line")
    use("kana/vim-textobj-user")
    use("kana/vim-textobj-entire")
    use("michaeljsmith/vim-indent-object")

    -- Tpope stuff
    use("tpope/vim-commentary")
    use("tpope/vim-endwise")
    use("tpope/vim-fugitive")
    use("tpope/vim-repeat")
    use("tpope/vim-surround")
    use("tpope/vim-unimpaired")
    use("tpope/vim-vinegar")
end)
