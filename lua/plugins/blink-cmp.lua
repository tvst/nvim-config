return {
  "saghen/blink.cmp",

  opts = function(_, opts)
    opts["completion"]["ghost_text"]["enabled"] = false
    opts["completion"]["documentation"]["window"] = {
      border = "rounded",
    }

    opts["completion"]["trigger"] = {
      show_on_insert_on_trigger_character = false,
    }
  end,
}
