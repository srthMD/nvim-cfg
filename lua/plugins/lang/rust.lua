return {
  {
    "vxpm/ferris.nvim",
    ft = "rust",
    opts = {
      create_commands = true,
      url_handler = "xdg-open",
    },
  },

  {
    "Saecki/crates.nvim",
    tag = "stable",
    ft = "toml",
    config = function() require("crates").setup() end,
  },
}
