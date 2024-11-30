return { -- Autocompletion
  "hrsh7th/nvim-cmp",

  dependencies = { "hrsh7th/cmp-emoji" },

  opts = function(_, opts)
    table.insert(opts.sources, { name = "emoji" })

    opts["window"] = {
      documentation = {
        border = "rounded",
        -- winhighlight = "NormalFloat:FloatWithBg,FloatBorder:FloatWithBg",
      },
    }
  end,
}
