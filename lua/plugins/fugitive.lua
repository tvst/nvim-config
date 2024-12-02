-- Awesome Git support
return {
  {
    "tpope/vim-fugitive",
    keys = {
      {
        "<leader>ggs",
        "<cmd>:Git<cr>",
        desc = "Git status",
      },

      {
        "<leader>ggd",
        "<cmd>:Gvdiffsplit<cr>",
        desc = "Git file diff",
      },

      {
        "<leader>ggl",
        "<cmd>:Gclog!<cr>",
        desc = "Git repo log",
      },

      {
        "<localleader>gl",
        "<cmd>:0Gclog!<cr>",
        desc = "Git file log",
      },

      {
        "<localleader>gb",
        "<cmd>:Git blame<cr>",
        desc = "Git blame",
      },

      {
        "<localleader>gr",
        "<cmd>:Gread<cr>",
        desc = "Git reset file",
      },
    },
  },
}