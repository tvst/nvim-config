local add = require("which-key").add

add({
  -- {"<leader>t", "", desc = "+test"},
  { "<leader>tt", function() require("neotest").run.run(vim.fn.expand("%")) end,                      desc = "[T]est file" },
  { "<leader>tT", function() require("neotest").run.run(vim.uv.cwd()) end,                            desc = "Run all [T]est files" },
  { "<leader>tr", function() require("neotest").run.run() end,                                        desc = "[R]un nearest" },
  { "<leader>tl", function() require("neotest").run.run_last() end,                                   desc = "Run [L]ast" },
  { "<leader>ts", function() require("neotest").summary.toggle() end,                                 desc = "Toggle [S]ummary" },
  { "<leader>to", function() require("neotest").output.open({ enter = true, auto_close = true }) end, desc = "Show [O]utput" },
  { "<leader>tO", function() require("neotest").output_panel.toggle() end,                            desc = "Toggle [O]utput panel" },
  { "<leader>tS", function() require("neotest").run.stop() end,                                       desc = "[S]top" },
  { "<leader>tw", function() require("neotest").watch.toggle(vim.fn.expand("%")) end,                 desc = "Toggle [W]atch" },
  { "<leader>td", function() require("neotest").run({ strategy = "dap" }) end,                        desc = "Debug [N]earest" },
})
