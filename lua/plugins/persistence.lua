-- Session management. This saves your session in the background,
-- keeping track of open buffers, window arrangement, and more.
-- You can restore sessions when returning through the dashboard.
return {
  "folke/persistence.nvim",
  event = "BufReadPre",
  opts = {},
}
