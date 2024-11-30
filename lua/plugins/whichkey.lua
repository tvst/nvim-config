return { -- Useful plugin to show you pending keybinds.
  "folke/which-key.nvim",
  event = "VimEnter", -- Sets the loading event to 'VimEnter'
  opts = {
    sort = { "desc" },
    spec = {
      { "<leader>d", group = "debug", mode = { "n" } },
    },
  },
}
