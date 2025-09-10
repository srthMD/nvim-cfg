local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

local general = augroup("General", { clear = true })

autocmd({ "BufWinEnter" }, {
  group = general,
  pattern = { "*" },
  callback = function()
    vim.cmd("checktime")
  end,
})

autocmd("BufWritePre", {
  desc = "Auto-create directories",
  group = general,
  pattern = "*",
  callback = function(event)
    if event.match:match("^%w%w+://") then
      return
    end
    local file = vim.loop.fs_realpath(event.match) or event.match
    vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
  end,
})

autocmd('TextYankPost', {
  desc = 'Highlight on yank',
  group = general,
  callback = function()
    vim.hl.on_yank()
  end,
})

local Snacks = require("snacks")
local prev = { new_name = "", old_name = "" } -- Prevents duplicate events
autocmd("User", {
  pattern = "NvimTreeSetup",
  callback = function()
    local events = require("nvim-tree.api").events
    events.subscribe(events.Event.NodeRenamed, function(data)
      if prev.new_name ~= data.new_name or prev.old_name ~= data.old_name then
        data = data
        Snacks.rename.on_rename_file(data.old_name, data.new_name)
      end
    end)
  end,
})
