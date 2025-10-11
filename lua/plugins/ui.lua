return {
  {
    "rebelot/heirline.nvim",
    dependencies = { "Zeioth/heirline-components.nvim" },
    opts = {},
    config = function(_, opts)
      local heirline = require "heirline"
      local hc = require "heirline-components.all"

      hc.init.subscribe_to_events()
      heirline.load_colors(hc.hl.get_colors())
      heirline.setup({
        statusline = {
          hc.component.mode({ mode_text = {} }),
          hc.component.file_info(),
          hc.component.git_diff(),
          hc.component.diagnostics(),
          hc.component.fill(),
          hc.component.cmd_info(),
          hc.component.fill(),
          hc.component.treesitter(),
          hc.component.nav(),
        },

        statuscolumn = {
          hc.component.numbercolumn(),
          hc.component.signcolumn()
        },

        tabline = {
          hc.component.tabline_conditional_padding(),
          hc.component.tabline_buffers(),
          hc.component.fill { hl = { bg = "tabline_bg" } },
          hc.component.tabline_tabpages()
        },

        winbar = {
          hc.component.breadcrumbs()
        },
      })
    end,
  },

  {
    "j-hui/fidget.nvim",
    opts = {
      notification = {
        override_vim_notify = true,
      }
    },
  },

  {
    "folke/which-key.nvim",
    event = "VeryLazy",

    opts = {
      preset = "helix",
      icons = {
        separator = " "
      }
    },
  },

  {
    "folke/trouble.nvim",
    cmd = "Trouble",
    opts = {},
    --TODO: move these to keymaps.lua
    keys = {
      {
        "<leader>lX",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>lx",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>ls",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>ll",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      {
        "<leader>lL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>lq",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      },
    },
  },

  {
    "folke/todo-comments.nvim",
    event = "VeryLazy",
    keys = {
      { "<leader>ft", function() Snacks.picker.todo_comments({ keywords = { "TODO", "FIX", "FIXME" } }) end, desc = "Todo/Fix/Fixme" },
    },
    opts = {},
  },

  {
    "yorickpeterse/nvim-window",
    keys = {
      { "<Leader>w", "<cmd>lua require('nvim-window').pick()<cr>", desc = "Jump to window" },
    },
    opts = {
      filter_rules = {
        include_current_win = false,
        autoselect_one = true,
        bo = {
          filetype = { "neo-tree", "neo-tree-popup", "notify" },
          buftype = { "terminal", "quickfix" },
        },
      },
    },
    config = true,
  }
}
