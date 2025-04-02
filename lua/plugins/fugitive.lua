-- Awesome Git support
return {
  {
    "tpope/vim-fugitive",
    keys = {
      {
        "<leader>gs",
        "<cmd>:tab :Git<cr>",
        desc = "Git status",
        remap = true,
      },

      {
        "<leader>gl",
        "<cmd>:Gclog!<cr>",
        desc = "Git repo log",
        remap = true,
      },

      {
        "<localleader>gl",
        "<cmd>:0Gclog!<cr>",
        desc = "Git file log",
        remap = true,
      },

      {
        "<localleader>gb",
        "<cmd>:Git blame<cr>",
        desc = "Git blame",
        remap = true,
      },

      {
        "<localleader>gd",
        "<cmd>:Gvdiffsplit<cr>",
        desc = "Git file diff",
        remap = true,
      },

      {
        "<localleader>gr",
        "<cmd>:Gread<cr>",
        desc = "Git reset file",
        remap = true,
      },
    },
  },
}
