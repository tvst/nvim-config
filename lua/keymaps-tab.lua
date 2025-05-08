local add = require("which-key").add

add({ "<leader><tab><tab>", "<cmd>tabedit %<cr>", desc = "Open in new tab" })
add({ "<leader><tab>n", "<cmd>tabnew<cr>", desc = "Open new file in a tab" })
add({ "<leader><tab>q", "<cmd>tabclose<cr>", desc = "Close tab" })
