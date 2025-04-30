local add = require("which-key").add

add({ "<leader><tab><tab>", "<cmd>tabnew<cr>", desc = "New file in new tab" })
add({ "<leader><tab>e", "<cmd>tabedit %<cr>", desc = "Open in new tab" })
add({ "<leader><tab>q", "<cmd>tabclose<cr>", desc = "Close tab" })
