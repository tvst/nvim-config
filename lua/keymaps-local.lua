local add = require("which-key").add

add({ "<localleader>w", "<cmd>w<cr>", noremap = true, silent = true, desc = "[W]rite buffer" })
add({ "<localleader><localleader>", "<cmd>e #<cr>", desc = "Switch to prev buffer" })

-- Clear search, diff update and redraw
add({
    "<localleader>r",
    "<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>",
    { desc = "[R]edraw" }
})

-- Mappings for diffs
add({ "<localleader>d", "<cmd>diffthis<cr>", desc = "[D]iff file" })
add({ "<localleader>du", "<cmd>diffupdate<cr>", desc = "Diff [U]pdate" })
add({ "<localleader>dd", "<cmd>diffoff<cr>", desc = "Stop [D]iff" })

add({ "<localleader>q", "<C-W>q", desc = "[C]lose window" })
require("snacks").toggle.zoom():map("<localleader>z")

-- Local Git mappings at: keymaps-git.lua
