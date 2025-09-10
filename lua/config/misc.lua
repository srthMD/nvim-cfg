require("mason").setup()
require("mason-null-ls").setup({})
require("null-ls").setup({})

require("mini.pairs").setup()
vim.keymap.set({ 'n', 'x', 'o' }, 's', '<Nop>')
require("mini.surround").setup({})
