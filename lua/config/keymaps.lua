local wk = require("which-key")

vim.api.nvim_set_keymap("n", "<TAB>", "<C-^>", { noremap = true, silent = true, desc = "Alternate buffers" })

wk.add({
  { "<Leader>b", group = "Buffer", icon = { icon = '' } }
})

vim.api.nvim_set_keymap("n", "<leader>bf", "<cmd>lua vim.lsp.buf.format()<CR>",
  { noremap = true, silent = true, desc = "Format buffer" })
wk.add({
  { "<Leader>bf", icon = { icon = '' } }
})

vim.api.nvim_set_keymap("n", "<Leader>e", "<cmd>Neotree toggle<CR>",
  { noremap = true, silent = true, desc = "Toggle neotree" })
wk.add({
  { "<Leader>e", icon = { icon = '' } }
})

vim.keymap.set({ 'n', 'x', 'o' }, 'f', '<Plug>(leap)')
vim.keymap.set('n', 'F', '<Plug>(leap-from-window)')

--UI

wk.add({
  { "<Leader>u", group = "UI", icon = { icon = '' } }
})

vim.g.diagnostic_text_active = false
function _G.toggle_diagnostics()
  vim.g.diagnostic_text_active = not vim.g.diagnostic_text_active
  vim.diagnostic.config({
    virtual_lines = vim.g.diagnostic_text_active,
    virtual_text = vim.g.diagnostic_text_active
  })
end

vim.g.diagnostic_underline_active = true
function _G.toggle_diagnostic_underline()
  vim.g.diagnostic_underline_active = not vim.g.diagnostic_underline_active
  vim.diagnostic.config({
    underline = vim.g.diagnostic_underline_active,
  })
end

vim.api.nvim_set_keymap('n', '<leader>ud', ':call v:lua.toggle_diagnostics()<CR>',
  { noremap = true, silent = true, desc = "Toggle diagnostic text" })
wk.add({
  { "<Leader>ud", icon = { icon = '' } }
})

vim.api.nvim_set_keymap('n', '<leader>uD', ':call v:lua.toggle_diagnostic_underline()<CR>',
  { noremap = true, silent = true, desc = "Toggle diagnostic underlines" })
wk.add({
  { "<Leader>uD", icon = { icon = '' } }
})

vim.api.nvim_set_keymap('t', "<Leader><ESC>", "<C-\\><C-n>", { noremap = true, desc = "Exit Terminal Mode" })

--Debugging

wk.add({
  { "<Leader>d", group = "Debug", icon = { icon = '' } }
})

vim.api.nvim_set_keymap('n', '<leader>db', '<cmd>DapToggleBreakpoint<CR>',
  { noremap = true, silent = true, desc = "Toggle Breakpoint" })
wk.add({
  { "<Leader>db", icon = { icon = '' } }
})

vim.keymap.set('n', "<Leader>dB", function()
  vim.ui.input({ prompt = "Condition: " }, function(condition)
    if condition then require("dap").set_breakpoint(condition) end
  end)
      { desc = "Add Conditional Breakpoint", silent = true }
end)
wk.add({
  { "<Leader>dB", desc = "Add Conditional Breakpoint", icon = { icon = '' } }
})

vim.api.nvim_set_keymap('n', '<leader>dC', '<cmd>DapClearBreakpoints<CR>',
  { noremap = true, silent = true, desc = "Clear Breakpoints" })

vim.api.nvim_set_keymap('n', '<leader>ds', '<cmd>DapContinue<CR>',
  { noremap = true, silent = true, desc = "Start Debugger" })

vim.api.nvim_set_keymap('n', '<leader>dp', '<cmd>DapPausee<CR>',
  { noremap = true, silent = true, desc = "Pause Debugger" })

vim.api.nvim_set_keymap('n', '<leader>dS', '<cmd>DapTerminate<CR>',
  { noremap = true, silent = true, desc = "Stop Debugger" })

vim.api.nvim_set_keymap('n', '<leader>dr', '<cmd>DapRestartFrame<CR>',
  { noremap = true, silent = true, desc = "Restart Debugger Frame" })

vim.api.nvim_set_keymap('n', '<leader>dR', '<cmd>DapToggleRepl<CR>',
  { noremap = true, silent = true, desc = "Toggle REPL" })

vim.api.nvim_set_keymap('n', '<F1>', '<cmd>DapStepOver<CR>',
  { noremap = true, silent = true, desc = "Step Over" })

vim.api.nvim_set_keymap('n', '<F2>', '<cmd>DapStepInto<CR>',
  { noremap = true, silent = true, desc = "Step Into" })

vim.api.nvim_set_keymap('n', '<F3>', '<cmd>DapStepOut<CR>',
  { noremap = true, silent = true, desc = "Step Out" })

vim.api.nvim_set_keymap('n', '<leader>du', '<cmd>lua require("dapui").toggle()<CR>',
  { noremap = true, silent = true, desc = "Toggle DAP UI" })

vim.api.nvim_set_keymap('n', '<leader>dh', '<cmd>lua require("dap.ui.widgets").hover()<CR>',
  { noremap = true, silent = true, desc = "Debugger Hover" })

vim.api.nvim_set_keymap('n', '<leader>de', '<cmd>lua require("dapui").eval()<CR>',
  { noremap = true, silent = true, desc = "Evaluate Expression" })

-- Terminal

wk.add({
  { "<Leader>t", group = "Terminal", icon = { icon = '' } }
})

vim.api.nvim_set_keymap('n', '<leader>tt', '<cmd>ToggleTerm size=20 dir=' .. vim.fn.getcwd() .. ' <CR>',
  { noremap = true, silent = true, desc = "Open Terminal" })

vim.api.nvim_set_keymap('n', '<leader>tm', '<Nop>',
  { noremap = true, silent = true, desc = "Run Makefile", callback = function ()
    local cwd = vim.fn.getcwd()
    if vim.fn.filereadable(cwd .. "/Makefile") == 0 then
      vim.notify("No Makefile found in the cwd.", vim.log.levels.ERROR)
      return
    end

    vim.cmd('TermExec cmd="make" direction=float dir=' .. cwd)
  end })

vim.api.nvim_set_keymap(  't'  ,  '<Leader><ESC>'  ,  '<C-\\><C-n>'  ,  {noremap = true}  )
