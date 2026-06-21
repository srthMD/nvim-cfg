return {
  {
    "vyfor/cord.nvim",
    build = ':Cord update',
    opts = {
      editor = {
        tooltip = vim.version().major .. "." .. vim.version().minor .. "." .. vim.version().patch,
      },

      display = {
        theme = "atom"
      },
    },
    enabled = false,
  },

  {
    "brianhuster/unnest.nvim"
  },

  { 
    'nvim-mini/mini.nvim',
    version = false 
  },
}
