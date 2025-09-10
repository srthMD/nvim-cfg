return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "AstroNvim/astrolsp",
        opts = {
          handlers = {
            zls = function() end
          }
        }
      },
      {
        "williamboman/mason-lspconfig.nvim",
        opts = {
          handlers = { function(server) require("astrolsp").lsp_setup(server) end },
          ensure_installed = {
            "rust_analyzer",
            "clangd",
            "lua_ls",
            "zls",
            "pylyzer",
          }
        },
        config = function(_, opts)
          require("astrolsp.mason-lspconfig").register_servers()
          require("mason-lspconfig").setup(opts)
        end,
      },
    },
    config = function() vim.tbl_map(require("astrolsp").lsp_setup, require("astrolsp").config.servers) end,
  },

  {
    "mason-org/mason.nvim",
    opts = {},
  },

  "WhoIsSethDaniel/mason-tool-installer.nvim",

  {
    "jay-babu/mason-null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      {
        "nvimtools/none-ls.nvim",
        opts = function()
          return {
            on_attach = require("astrolsp").on_attach,
            automatic_installation = true,
            ensure_installed = {
              "stylua",
              "selene",
              "prettier",
              "clang-format",
            }
          }
        end,
      },
    },
  },

  {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
      library = {
        "nvim-dap-ui",
        -- Load luvit types when the `vim.uv` word is found
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  }
}
