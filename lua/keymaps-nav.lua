local map = vim.keymap.set
local add = require("which-key").add

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
-- map('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
-- map('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
-- map('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
-- map('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
map("n", "<c-h>", "<c-w>h", { desc = "go to left window", remap = true })
map("n", "<c-j>", "<c-w>j", { desc = "go to lower window", remap = true })
map("n", "<c-k>", "<c-w>k", { desc = "go to upper window", remap = true })
map("n", "<c-l>", "<c-w>l", { desc = "go to right window", remap = true })

-- Resize window using <ctrl> arrow keys
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

-- Since I disable bufferline, make tabs follow same behavior as bufferline.
map("n", "<S-h>", "gT", { desc = "Prev Tab" })
map("n", "<S-l>", "gt", { desc = "Next Tab" })

add({
  { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end,       desc = "Flash" },
  { ";", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
  -- { "r",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
  -- { "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
  -- { "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
})
