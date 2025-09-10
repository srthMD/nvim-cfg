return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,

  opts = function()
    local wk = require("which-key")

    wk.add({
      { "<Leader>f", icon = { icon = '' }, group = "Find" },
      { "<Leader>s", icon = { icon = '' }, group = "Search" },
      { "<Leader>g", icon = { icon = '' }, group = "Git" },
      { "<Leader>l", icon = { icon = '' }, group = "Language Tools" },
      { "<Leader>lf", icon = { icon = '󰉿' } },
    })

    return {
      bigfile = { enabled = true },
      input = { enabled = true },
      quickfile = { enabled = true },
      scope = { enabled = true },
      rename = { enabled = true },
      statuscolumn = { enabled = true },
      words = { enabled = true },
      win = { enabled = true },
      picker = {
        ui_select = true,
      }
    }
  end,

  --cant fucking bother to move this to keybinds
  keys = {
    --i put the more important find commands under f and the lesser ones under s
    { "<leader>fW", function() Snacks.picker.grep() end,                                                   desc = "Workspace Find Words" },
    { "<leader>fb", function() Snacks.picker.buffers() end,                                                desc = "Buffers" },
    { "<leader>ff", function() Snacks.picker.files() end,                                                  desc = "Find Files" },
    { "<leader>fr", function() Snacks.picker.recent() end,                                                 desc = "Recent" },
    { "<leader>fD", function() Snacks.picker.diagnostics() end,                                            desc = "Diagnostics" },
    { "<leader>fd", function() Snacks.picker.diagnostics_buffer() end,                                     desc = "Buffer Diagnostics" },
    { "<leader>ft", function() Snacks.picker.todo_comments({ keywords = { "TODO", "FIX", "FIXME" } }) end, desc = "Todo/Fix/Fixme" },
    -- git
    { "<leader>gg", function() Snacks.lazygit() end,                                                       desc = "Lazygit" },
    { "<leader>gG", function() Snacks.picker.git_files() end,                                              desc = "Find Git Files" },
    { "<leader>gb", function() Snacks.picker.git_branches() end,                                           desc = "Git Branches" },
    { "<leader>gl", function() Snacks.picker.git_log() end,                                                desc = "Git Log" },
    { "<leader>gL", function() Snacks.picker.git_log_line() end,                                           desc = "Git Log Line" },
    { "<leader>gs", function() Snacks.picker.git_status() end,                                             desc = "Git Status" },
    { "<leader>gS", function() Snacks.picker.git_stash() end,                                              desc = "Git Stash" },
    { "<leader>gd", function() Snacks.picker.git_diff() end,                                               desc = "Git Diff (Hunks)" },
    { "<leader>gf", function() Snacks.picker.git_log_file() end,                                           desc = "Git Log File" },
    -- search
    { '<leader>s"', function() Snacks.picker.registers() end,                                              desc = "Registers" },
    { '<leader>s/', function() Snacks.picker.search_history() end,                                         desc = "Search History" },
    { "<leader>sa", function() Snacks.picker.autocmds() end,                                               desc = "Autocmds" },
    { "<leader>sb", function() Snacks.picker.lines() end,                                                  desc = "Buffer Lines" },
    { "<leader>sc", function() Snacks.picker.command_history() end,                                        desc = "Command History" },
    { "<leader>sC", function() Snacks.picker.commands() end,                                               desc = "Commands" },
    { "<leader>sh", function() Snacks.picker.help() end,                                                   desc = "Help Pages" },
    { "<leader>sH", function() Snacks.picker.highlights() end,                                             desc = "Highlights" },
    { "<leader>si", function() Snacks.picker.icons() end,                                                  desc = "Icons" },
    { "<leader>sj", function() Snacks.picker.jumps() end,                                                  desc = "Jumps" },
    { "<leader>sk", function() Snacks.picker.keymaps() end,                                                desc = "Keymaps" },
    { "<leader>sl", function() Snacks.picker.loclist() end,                                                desc = "Location List" },
    { "<leader>sm", function() Snacks.picker.marks() end,                                                  desc = "Marks" },
    { "<leader>sM", function() Snacks.picker.man() end,                                                    desc = "Man Pages" },
    { "<leader>sp", function() Snacks.picker.lazy() end,                                                   desc = "Search for Plugin Spec" },
    { "<leader>sR", function() Snacks.picker.resume() end,                                                 desc = "Resume" },
    { "<leader>su", function() Snacks.picker.undo() end,                                                   desc = "Undo History" },
    { "<leader>st", function() Snacks.picker.colorschemes() end,                                           desc = "Colorschemes" },
    -- Language stuff
    { "<leader>ld", function() Snacks.picker.lsp_definitions() end,                                        desc = "Goto Definition" },
    { "<leader>lD", function() Snacks.picker.lsp_declarations() end,                                       desc = "Goto Declaration" },
    { "<leader>lr", function() Snacks.picker.lsp_references() end,                                         nowait = true,                  desc = "References" },
    { "<leader>li", function() Snacks.picker.lsp_implementations() end,                                    desc = "Goto Implementation" },
    { "<leader>lt", function() Snacks.picker.lsp_type_definitions() end,                                   desc = "Goto T[y]pe Definition" },

    { "<Leader>.",  function() Snacks.scratch() end,                                                       desc = "Toggle Scratch Buffer" },
    { "<leader>bd", function() Snacks.bufdelete() end,                                                     desc = "Delete Buffer" },
    { "<c-/>",      function() Snacks.terminal() end,                                                      desc = "Toggle Terminal" },
  },
}
