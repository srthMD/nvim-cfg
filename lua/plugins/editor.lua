return {
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = "BufEnter",
    ---@module "ibl"
    ---@type ibl.config
    opts = {
      scope = { enabled = true },
    },
  },

  {
    "kevinhwang91/nvim-ufo",
    event = "BufReadPre",
  },

  {
    "saghen/blink.cmp",
    dependencies = { "rafamadriz/friendly-snippets", "L3MON4D3/LuaSnip" },
    version = "1.*",
    opts = function()
      return {
        keymap = {
          preset = "super-tab",

          ["<S-Tab>"] = {
            "show",
          },
        },

        snippets = {
          preset = "luasnip",
        },

        appearance = {
          nerd_font_variant = "mono",
        },

        completion = {
          documentation = { auto_show = true, auto_show_delay_ms = 1000 },
          menu = {
            auto_show = false,

            draw = {
              treesitter = { "lsp" },
            },
          },

          trigger = {
            show_in_snippet = false,
          },

          ghost_text = {
            enabled = true,
            show_with_menu = false,
          },
        },

        cmdline = {
          enabled = true,

          keymap = { preset = "cmdline" },
          sources = { "cmdline", "path" },
        },

        fuzzy = { implementation = "prefer_rust_with_warning" },
      }
    end,

    opts_extend = { "sources.default" },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    main = "nvim-treesitter.config",
    lazy = false,
    build = ":TSUpdate",
    opts = {
      ensure_installed = {
        "lua",
        "luau",
        "json",
        "rust",
        "c",
        "cpp",
        "nu",
        "java",
        "toml",
        "asm",
        "kotlin",
        "zig",
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter-textobjects",
  },

  {
    "NMAC427/guess-indent.nvim",
    event = "BufEnter",
  },

  {
    "echasnovski/mini.pairs",
    version = false,
    config = function() require("mini.pairs").setup {} end,
  },

  {
    "echasnovski/mini.comment",
    version = false,
    opts = {
      mappings = {
        comment_line = ";",
        comment_visual = ";",
      },
    },
  },

  {
    "echasnovski/mini.surround",
    version = false,
    config = function()
      require("mini.surround").setup {
        mappings = {
          add = "ys",
          delete = "ds",
          replace = "rs",
          find = "",
          find_left = "",
          highlight = "",
          update_n_lines = "",
          suffix_next = "",
          suffix_last = "",
        },
      }
    end,
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons",
    },

    lazy = false,

    opts = function(_, _)
      local events = require "neo-tree.events"

      return {
        enable_git_status = true,
        enable_diagnostics = true,
        open_files_do_not_replace_types = { "terminal", "trouble", "qf" }, -- when opening files, do not use windows containing these filetypes or buftypes
        open_files_using_relative_paths = false,

        filesystem = {
          filtered_items = {
            visible = true,

            never_show = { ".git", "sourcemap.json" },
          },
        },
        source_selector = {
          winbar = true,
          statusline = true,
        },

        default_component_configs = {
          indent = {
            padding = 0,
          },
          modified = { symbol = "" },
          git_status = {
            symbols = {
              added = "",
              deleted = "",
              modified = "",
              renamed = "",
              untracked = "",
              ignored = "",
              conflict = "󰘞",
            },
          },
        },

        icon = {
          provider = function(icon, node, state) -- default icon provider utilizes nvim-web-devicons if available
            if node.type == "file" or node.type == "terminal" then
              local success, web_devicons = pcall(require, "nvim-web-devicons")
              local name = node.type == "terminal" and "terminal" or node.name
              if success then
                local devicon, hl = web_devicons.get_icon(name)
                icon.text = devicon or icon.text
                icon.highlight = hl or icon.highlight
              end
            end
          end,

          event_handlers = {
            {
              event = events.BEFORE_FILE_ADD,
              handler = function(args) require("astrolsp.file_operations").willCreateFiles(args) end,
            },
            {
              event = events.FILE_ADDED,
              handler = function(args) require("astrolsp.file_operations").didCreateFiles(args) end,
            },
            {
              event = events.BEFORE_FILE_DELETE,
              handler = function(args) require("astrolsp.file_operations").willDeleteFiles(args) end,
            },
            {
              event = events.FILE_DELETED,
              handler = function(args) require("astrolsp.file_operations").didDeleteFiles(args) end,
            },
            {
              event = events.BEFORE_FILE_MOVE,
              handler = function(args)
                require("astrolsp.file_operations").willRenameFiles { from = args.source, to = args.destination }
              end,
            },
            {
              event = events.BEFORE_FILE_RENAME,
              handler = function(args)
                require("astrolsp.file_operations").willRenameFiles { from = args.source, to = args.destination }
              end,
            },
            {
              event = events.FILE_MOVED,
              handler = function(args)
                require("astrolsp.file_operations").didRenameFiles { from = args.source, to = args.destination }
              end,
            },
            {
              event = events.FILE_RENAMED,
              handler = function(args)
                require("astrolsp.file_operations").didRenameFiles { from = args.source, to = args.destination }
              end,
            },
          },
        },
      }
    end,
  },

  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = true,
  },
}
