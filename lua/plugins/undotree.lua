return {
  {
    "jiaoshijie/undotree",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = true,
    lazy = true,
    keys = {
      {
        "<localleader>u",
        function()
          require("undotree").toggle()
        end,
        desc = "Undo list",
        noremap = true,
      },
    },
    opts = {
      float_diff = false,
    },
  },
}
