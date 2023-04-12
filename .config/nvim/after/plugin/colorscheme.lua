--
-- [[ Colorscheme ]]
--

local colors = require("kanagawa.colors").setup({ theme = 'wave' })
local palette = colors.palette
local theme = colors.theme

require('kanagawa').setup({
  colors = {
    theme = {
      all = {
        ui = {
          bg_gutter = "none"
        },
      },
      wave = {
        syn = {
          constant = palette.fujiWhite,
        },
      },
    },
  },
  overrides = function(colors)
    return {
      -- Built-in highlight groups
      ['@boolean'] = { bold = false },
      ['@conditional'] = { bold = false },
      ['@conditional.ternary'] = { fg = palette.fujiWhite },
      ['@constant'] = { fg = palette.fujiWhite },
      ['@exception'] = { bold = false },
      ['@keyword.operator'] = { bold = false },
      ['@repeat'] = { bold = false },
      ['@tag'] = { fg = palette.oniViolet },
      htmlEndTag = { fg = palette.crystalBlue },
      htmlTagName = { fg = palette.oniViolet, bold = false },
      jsonBoolean = { fg = palette.surimiOrange, bold = false },
      jsonKeyword = { fg = palette.oniViolet, bold = false },

      -- 'MaxMEllon/vim-jsx-pretty' highlight groups
      jsxOpenPunct = { fg = palette.springViolet2, italic = false },
      jsxClosePunct = { fg = palette.springViolet2, italic = false },
      javaScriptBoolean = { fg = palette.surimiOrange, bold = false },
      javaScriptConditional = { fg = palette.oniViolet, bold = false },
      javaScriptLabel = { fg = palette.oniViolet, bold = false },
      javaScriptReserved = { fg = palette.waveRed, italic = false },
      javaScriptStatement = { fg = palette.peachRed, bold = false },
      typescriptBoolean = { fg = palette.surimiOrange, bold = false },
      typescriptBranch = { fg = palette.oniViolet, bold = false },
      typescriptConditional = { fg = palette.oniViolet, bold = false },
      typescriptDefault = { fg = palette.oniViolet, bold = false },
      typescriptObjectLabel = { fg = palette.carpYellow, bold = false },
      typescriptRepeat = { fg = palette.oniViolet, bold = false },
      typescriptStatementKeyword = { fg = palette.peachRed, bold = false },

      -- Custom Telescope UI
      TelescopeTitle = { fg = theme.ui.special, bold = true },
      TelescopePromptNormal = { bg = theme.ui.bg_p1 },
      TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
      TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
      TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
      TelescopePreviewNormal = { bg = theme.ui.bg_dim },
      TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },
    }
  end,
})

vim.cmd("colorscheme kanagawa")
