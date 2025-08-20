--
-- [[ Colorscheme ]]
--

require("github-theme")

vim.cmd("colorscheme github_dark_default")

-- require("tokyonight").setup({
-- 	style = "moon",
-- 	on_highlights = function(hl, c)
-- 		hl.PreProc = {
-- 			fg = c.red,
-- 		}

-- 		-- Make Telescope borderless
-- 		local prompt = "#2d3149"
-- 		hl.TelescopeNormal = {
-- 			bg = c.bg_dark,
-- 			fg = c.fg_dark,
-- 		}
-- 		hl.TelescopeBorder = {
-- 			bg = c.bg_dark,
-- 			fg = c.bg_dark,
-- 		}
-- 		hl.TelescopePromptNormal = {
-- 			bg = prompt,
-- 		}
-- 		hl.TelescopePromptBorder = {
-- 			bg = prompt,
-- 			fg = prompt,
-- 		}
-- 		hl.TelescopePromptTitle = {
-- 			bg = prompt,
-- 			fg = prompt,
-- 		}
-- 		hl.TelescopePreviewTitle = {
-- 			bg = c.bg_dark,
-- 			fg = c.bg_dark,
-- 		}
-- 		hl.TelescopeResultsTitle = {
-- 			bg = c.bg_dark,
-- 			fg = c.bg_dark,
-- 		}
-- 	end,
-- })

-- vim.cmd("colorscheme tokyonight")
