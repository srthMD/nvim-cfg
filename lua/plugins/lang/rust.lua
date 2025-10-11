return {
  {
    "vxpm/ferris.nvim",
    ft = "rs",
  },

  {
    "Saecki/crates.nvim",
    tag = "stable",
    ft = "toml",
    config = function() require("crates").setup() end,
  },
}
