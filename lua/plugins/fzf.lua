return {
  "ibhagwan/fzf-lua",
  opts = function(_, opts)
    opts.winopts.backdrop = 100
  end,
  keys = {
    { "<leader><space>", LazyVim.pick("files", { root = false }), desc = "Find Files (cwd)" },
  },
}
