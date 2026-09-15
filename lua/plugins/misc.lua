return {
  {
    "vyfor/cord.nvim",
    build = ":Cord update",
    opts = {
      editor = {
        tooltip = vim.version().major .. "." .. vim.version().minor .. "." .. vim.version().patch,
      },

      display = {
        theme = "atom",
      },
    },
    enabled = false,
  },

  {
    "brianhuster/unnest.nvim",
  },

  {
    "nvim-mini/mini.nvim",
    version = false,
  },

  {
    "Who5673/who5673-nasm", -- Or git@github.com:Who5673/who5673-nasm if you use SSH Key (recommended)
    dependencies = {
      "L3MON4D3/LuaSnip",
      "hrsh7th/nvim-cmp",
    },
    ft = "nasm",
    lazy = true,
  },
}
