local add = require("which-key").add

add({
  "<leader>wq",
  --"<cmd>copen<cr>"
  function()
    local success, err = pcall(vim.fn.getqflist({ winid = 0 }).winid ~= 0 and vim.cmd.cclose or vim.cmd.copen)
    if not success and err then
      vim.notify(err, vim.log.levels.ERROR)
    end
  end,
  desc = "Open [Q]uickfix list"
})

add({
  "<leader>wl",
  --"<cmd>lopen<cr>",
  function()
    local success, err = pcall(vim.fn.getloclist(0, { winid = 0 }).winid ~= 0 and vim.cmd.lclose or vim.cmd.lopen)
    if not success and err then
      vim.notify(err, vim.log.levels.ERROR)
    end
  end,
  desc = "Open [L]ocation list"
})

add({ "<leader>wt", function() Snacks.terminal() end, desc = "Open [T]erminal" })
add({
  "<leader>wT",
  function() Snacks.terminal(nil, { cwd = vim.api.nvim_buf_get_name(0) }) end,
  desc =
  "Open [T]erminal (here)"
})
add({ "<leader>wd", "<cmd>Trouble diagnostics toggle<cr>", desc = "Open [D]iagnostics (project)" })
add({ "<leader>wD", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Open [D]iagnostics (buffer)" })
add({ "<leader>wi", vim.diagnostic.open_float, desc = "Show line d[i]agnostics" })
add({ "<leader>wy", function() Snacks.picker.lsp_symbols() end, desc = "Open S[y]mbols picker" })
add({ "<leader>wY", "<cmd>Trouble symbols toggle<cr>", desc = "Open S[y]mbols list" })
add({ "<leader>wr", "<cmd>Trouble lsp toggle<cr>", desc = "Open [R]eferences/definitions/... list" })

-- Global search and replace
add({
  "<leader>ws",
  function()
    local grug = require("grug-far")
    local ext = vim.bo.buftype == "" and vim.fn.expand("%:e")
    grug.open({
      transient = true,
      prefills = {
        filesFilter = ext and ext ~= "" and "*." .. ext or nil,
      },
    })
  end,
  mode = { "n", "v" },
  desc = "Open [S]earch and replace",
})

add({ "<leader>wn", function() Snacks.notifier.show_history() end, desc = "Open [N]otification history" })
add({ "<leader>ww", function() Snacks.notifier.hide() end, desc = "Dismiss Notifications" })
require("snacks").toggle.zoom():map("<leader>wz")
