return {
  -- Useful plugin to show you pending keybinds.
  'folke/which-key.nvim',
  event = 'VimEnter',
  opts_extend = { 'spec' },
  opts = {
    preset = 'helix',
    delay = 0,
    defaults = {},
    sort = { "group", "manual" },
    icons = {
      -- Hide icons from mappings and from rules.
      mappings = false,
      rules = false,
    },
    spec = {
      {
        mode = { "n", "v" },

        { "<leader>f",      group = "[F]ile" },
        { "<leader>e",      group = "[E]ditor" },
        { "<leader>g",      group = "[G]it" },
        { "<leader>t",      group = "[T]est" },
        { "<leader>d",      group = "[D]ebug" },
        { "<leader>w",      group = "[W]indow" },
        { "<leader><tab>",  group = "[Tab]" },
        { "<leader>v",      group = "[V]im" },
        { "<leader>q",      group = "[Q]uit & Session" },

        { "<localleader>g", group = "[G]it" },
        { "<localleader>d", group = "[D]iff" },

        { "[",              group = "Prev" },
        { "]",              group = "Next" },
        { "g",              group = "Goto" },
        { "gs",             group = "Surround" },
        { "z",              group = "Fold" },
      },
    },
  },
}
