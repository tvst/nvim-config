local add = require("which-key").add

add({
  { "<leader>qq", "<cmd>qa<cr>",                                               desc = "[Q]uit" },
  { "<leader>qu", "<cmd>qa!<cr>",                                              desc = "Quit (ignore [U]nsaved)" },
  { "<leader>qd", function() require("persistence").stop() end,                desc = "Quit ([D]on't save session)" },
  { "<leader>qr", function() require("persistence").load() end,                desc = "[R]estore session" },
  { "<leader>qs", function() require("persistence").select() end,              desc = "[S]elect session" },
  { "<leader>ql", function() require("persistence").load({ last = true }) end, desc = "Restore [L]ast session" },
})
