return {
  "jinzhongjia/zig-lamp",
  ft = { "zig", "zon" },
  build = ":ZigLamp build sync",
  dependencies = {
    "neovim/nvim-lspconfig",
    "nvim-lua/plenary.nvim",
  },
  init = function()
    vim.g.zig_lamp_zls_auto_install = nil
    vim.g.zig_lamp_fall_back_sys_zls = nil
    vim.g.zig_lamp_zls_lsp_opt = {}
    vim.g.zig_lamp_pkg_help_fg = "#CF5C00"
    vim.g.zig_lamp_zig_fetch_timeout = 5000
  end,
}
