return {
  {
    "mfussenegger/nvim-dap",
    event = "VeryLazy",
    dependencies = {
      {
        "jay-babu/mason-nvim-dap.nvim",
        dependencies = { "nvim-dap", "williamboman/mason.nvim" },
        cmd = { "DapInstall", "DapUninstall" },
        opts_extend = { "ensure_installed" },
        opts = {
          ensure_installed = {
            "codelldb"
          },
          handlers = {}
        },
      },
    }
  },

  {
    "rcarriga/nvim-dap-ui",
    keys = "<Leader>du",
    dependencies = { { "nvim-neotest/nvim-nio", lazy = true } },
    opts = { floating = { border = "rounded" } },
  }
}
