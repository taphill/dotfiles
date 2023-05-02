--
-- [[ Lualine ]]
-- See `:help lualine.txt`
--

require("lualine").setup({
	options = {
		icons_enabled = false,
		component_separators = "|",
		section_separators = "",
	},
	sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {},
		lualine_x = { { "filename", path = 1 } },
		lualine_y = { "branch", "diff", "diagnostics" },
		lualine_z = { "mode" },
	},
})
