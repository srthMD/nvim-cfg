return {
  {
    'vxpm/ferris.nvim',
    ft = "rs",
  },

  {
    "Saecki/crates.nvim",
    tag = 'stable',
    config = function()
      require('crates').setup()
    end,
  }
}
