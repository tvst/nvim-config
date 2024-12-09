return {
  {
    "mfussenegger/nvim-dap-python",
    dependencies = { "HiPhish/debugpy.nvim" },
  },
  {
    "mfussenegger/nvim-dap",
    opts = function()
      local dap = require("dap")

      table.insert(dap.configurations.python, {
        type = "python",
        request = "launch",
        name = "Launch Streamlit app",
        module = "streamlit",
        args = { "run", "${file}" },
      })
    end,
  },
}
