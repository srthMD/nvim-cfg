return {
  {
    "mfussenegger/nvim-dap",
    lazy = true,
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
    dependencies = { { "nvim-neotest/nvim-nio", lazy = true } },
    opts = { floating = { border = "rounded" } },
  }
}
