vim.g.mapleader = " "
vim.g.maplocalleader = ","

vim.opt.termguicolors = true
vim.g.have_nerd_font = true

vim.o.scrolloff = 10

vim.o.foldcolumn = '1'
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true


vim.diagnostic.config({
 virtual_lines = false,
 virtual_text = false,
 underline = true,

 signs = {
   text = {
     [vim.diagnostic.severity.ERROR] = '',
     [vim.diagnostic.severity.WARN] = '',
     [vim.diagnostic.severity.INFO] = '',
     [vim.diagnostic.severity.HINT] = '󰌵',
   },
 }
})

vim.opt.laststatus = 3

vim.o.relativenumber = true
vim.o.number = true

vim.o.showmode = false

vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.undofile = true

vim.o.showtabline = 2

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

vim.schedule(function() vim.o.clipboard = "unnamedplus" end)

vim.cmd("set tabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set expandtab")

vim.cmd("set splitbelow")
