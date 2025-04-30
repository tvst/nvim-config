local add = require("which-key").add
local p = require("snacks").picker

add({
  "<leader><leader>",
  function()
    p.smart({
      multi = { "buffers", "git_files", "files" }
    })
  end,
  desc = "Open file"
})
add({ "<leader>/", function() p.grep() end, desc = "Open file by contents" })

add({ "<leader>fn", "<cmd>enew<cr>", desc = "[N]ew file" })
add({ "<leader>ff", function() p.files() end, desc = "Open [F]ile" })
add({ "<leader>fF", function() p.files({ cwd = vim.api.nvim_buf_get_name(0) }) end, desc = "Open [F]ile (here)" })
add({ "<leader>fb", function() p.buffers() end, desc = "Open [B]uffer" })
add({
  "<leader>f/",
  function() p.grep({ dirs = { vim.api.nvim_buf_get_name(0) } }) end,
  desc =
  "Open file by contents (here)"
})
