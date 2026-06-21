return {
  {
    "mrcjkb/rustaceanvim",
    version = "^9",
    lazy = false,
  },

  {
    "Saecki/crates.nvim",
    tag = "stable",
    ft = "toml",
    config = function() require("crates").setup() end,
  },
}
