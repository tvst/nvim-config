local add = require("which-key").add

Snacks.toggle.diagnostics():map("<leader>ed")
Snacks.toggle.indent():map("<leader>ei")
Snacks.toggle.inlay_hints():map("<leader>eh")
Snacks.toggle.line_number():map("<leader>en")
--Snacks.toggle.option({ "cursorline" }):map("<leader>ec")

Snacks.toggle
    .new({
      id = "Auto Format (buffer)",
      name = "Auto Format (buffer)",
      get = function()
        return not vim.b.disable_autoformat
      end,
      set = function(state)
        vim.b.disable_autoformat = not state
      end,
    })
    :map("<leader>eF")

Snacks.toggle
    .new({
      id = "Auto Format (global)",
      name = "Auto Format (global)",
      get = function()
        return not vim.g.disable_autoformat
      end,
      set = function(state)
        vim.g.disable_autoformat = not state
      end,
    })
    :map("<leader>ef")
