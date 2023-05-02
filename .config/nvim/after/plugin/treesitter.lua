--
-- [[ Treesitter ]]
-- See `:help treesitter`
--

require("nvim-treesitter.configs").setup({
	ensure_installed = { "lua", "javascript", "typescript", "tsx", "help", "vim" },
	highlight = {
		enable = true,

		-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
		-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
		-- Using this option may slow down your editor, and you may see some duplicate highlights.
		-- Instead of true it can also be a list of languages
		--
		-- I have this set becuase I want to use 'MaxMEllon/vim-jsx-pretty' for indentation.
		-- Treesitter indentation for jsx/tsx is still a bit buggy, but has gotten a lot better last time I checked.
		-- My hope is to eventually be able to use treesitter for indentation.
		additional_vim_regex_highlighting = { "javascript", "typescript", "tsx" },
	},
	indent = {
		enable = true,
		disable = { "javascript", "typescript", "tsx" },
	},
})
