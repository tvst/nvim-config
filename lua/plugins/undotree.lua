return {
  {
    'jiaoshijie/undotree',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    config = true,
    keys = {
      {
        '<leader>u',
        '<cmd>lua require("undotree").toggle()<cr>',
        desc = '[U]ndolist',
        noremap = true,
        silent = true,
      },
    },
    opts = {
      float_diff = false,
    },
  },
}
