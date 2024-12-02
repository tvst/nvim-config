return {
  {
    "jiaoshijie/undotree",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = true,
    keys = {
      {
        "<leader>cu",
        '<cmd>lua require("undotree").toggle()<cr>',
        desc = "Undo list",
        noremap = true,
        silent = true,
      },
    },
    opts = {
      float_diff = false,
    },
  },
}
