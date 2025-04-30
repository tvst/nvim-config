local add = require("which-key").add
local p = require("snacks").picker

add({ "<leader>gs", "<cmd>tab :Git<cr>", desc = "View [S]tatus" })
add({ "<leader>gl", "<cmd>Gclog!<cr>", desc = "Open [L]og" })
add({ "<leader>gL", function() p.git_log() end, desc = "Search [L]og" })
add({ "<leader>gb", function() p.git_branches() end, desc = "Open [B]ranch" })
add({ "<leader>gf", function() p.git_files() end, desc = "Open git [F]ile" })

add({ "<localleader>gl", "<cmd>0Gclog!<cr>", desc = "File [L]og" })
add({ "<localleader>gb", "<cmd>Git blame<cr>", desc = "[B]lame" })
add({ "<localleader>gd", "<cmd>Gvdiffsplit<cr>", desc = "Git [D]iff" })
add({ "<localleader>gc", "<cmd>Gread<cr>", desc = "Go to [C]urrent version" })
