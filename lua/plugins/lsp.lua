return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "AstroNvim/astrolsp",
        opts = {
          handlers = {
            zls = function() end,
          },
        },
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
          },
        },
        config = function(_, opts)
          require("mason").setup()
          require("mason-lspconfig").setup(opts)
          -- i dont even fucking know anymore honestly
          -- require("astrolsp.mason-lspconfig").register_servers()
        end,
      },
    },
    config = function() vim.tbl_map(require("astrolsp").lsp_setup, require("astrolsp").config.servers) end,
  },

  {
    "jay-babu/mason-null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "mason-org/mason.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
      "nvimtools/none-ls.nvim",
    },

    config = function()
      require("mason").setup()
      require("mason-null-ls").setup {
        ensure_installed = {
          "stylua",
          "selene",
          "prettier",
          "clang_format"
        },
        automatic_installation = false,
        handlers = {},
      }
      require("null-ls").setup {
        sources = {
          -- Anything not supported by mason.
        },
      }
    end,
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
  },
}
