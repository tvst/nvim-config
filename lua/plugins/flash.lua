-- Flash enhances the built-in search functionality by showing labels
-- at the end of each match, letting you quickly jump to a specific
-- location.
return {
  "folke/flash.nvim",
  event = "VeryLazy",
  vscode = true,
  ---@type Flash.Config
  opts = {
    modes = {
      char = {
        enabled = false,
        -- -- hide after jump when not using jump labels
        -- autohide = false,
        -- -- show jump labels
        -- jump_labels = true,
      },
      -- options used for treesitter selections
      -- `require("flash").treesitter()`
      treesitter = {
        jump = { pos = "start", autojump = true },
      },
      treesitter_search = {
        jump = { pos = "start" },
      },
    },
  },
}
