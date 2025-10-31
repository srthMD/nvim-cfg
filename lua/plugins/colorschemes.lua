return {
  "rebelot/kanagawa.nvim",
  event = "VeryLazy",
  opts = {
    commentStyle = {
      italic = false,
    },
    keywordStyle = {
      italic = false,
    },

    overrides = function(colors)
      local theme = colors.theme

      local makeDiagnosticColor = function(color)
        local c = require "kanagawa.lib.color"
        return { fg = color, bg = c(color):blend(theme.ui.bg, 0.95):to_hex() }
      end

      return {
        DiagnosticVirtualTextHint = makeDiagnosticColor(theme.diag.hint),
        DiagnosticVirtualTextInfo = makeDiagnosticColor(theme.diag.info),
        DiagnosticVirtualTextWarn = makeDiagnosticColor(theme.diag.warning),
        DiagnosticVirtualTextError = makeDiagnosticColor(theme.diag.error),

        Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 }, -- add `blend = vim.o.pumblend` to enable transparency
        PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
        PmenuSbar = { bg = theme.ui.bg_m1 },
        PmenuThumb = { bg = theme.ui.bg_p2 },
      }
    end,
  },

  {
    "RRethy/base16-nvim",
    priority = 10000,
    lazy = false,
  },

  {
    "everviolet/nvim",
    name = "evergarden.nvim",
    event = "VeryLazy",
  },

  {
    "kamil-koziol/imperial.nvim",
    event = "VeryLazy",
  },

  {
    "marfisc/vorange",
    event = "VeryLazy",
  },
}
