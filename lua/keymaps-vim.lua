local add = require("which-key").add
local p = require("snacks").picker

add({ "<leader>v:", function() p.command_history() end, desc = "Command history" })
add({ "<leader>vh", function() p.help() end, desc = "[H]elp" })
add({ "<leader>vk", function() p.keymaps() end, desc = "[K]eymaps" })
add({ "<leader>vc", function() Snacks.picker.commands() end, desc = "[C]ommands" })
add({ "<leader>vu", function() p.undo() end, desc = "[U]ndo tree" })
add({ "<leader>vC", function() p.colorschemes() end, desc = "[C]olor schemes" })
add({ "<leader>vH", vim.show_pos, desc = "Inspect [H]ighlight group under cursor" })
add({
  "<leader>vT",
  function()
    vim.treesitter.inspect_tree()
    vim.api.nvim_input("I")
  end,
  desc = "Inspect [T]reesitter node"
})
add({ "<leader>vp", "<cmd>:Lazy<cr>", desc = "Open [P]ackage manager (Lazy.nvim)" })
add({ "<leader>vd", "<cmd>:Mason<cr>", desc = "Open [D]ependency manager (Mason)" })
