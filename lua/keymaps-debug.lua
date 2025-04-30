local add = require("which-key").add

add({
  -- Basic debugging keymaps, feel free to change to your liking!
  {
    '<leader>dc',
    function()
      require('dap').continue()
    end,
    desc = 'Start/Continue',
  },
  {
    '<leader>di',
    function()
      require('dap').step_into()
    end,
    desc = 'Step Into',
  },
  {
    '<leader>ds',
    function()
      require('dap').step_over()
    end,
    desc = 'Step Over',
  },
  {
    '<leader>do',
    function()
      require('dap').step_out()
    end,
    desc = 'Step Out',
  },
  {
    '<leader>db',
    function()
      require('dap').toggle_breakpoint()
    end,
    desc = 'Toggle Breakpoint',
  },
  {
    '<leader>dB',
    function()
      require('dap').set_breakpoint(vim.fn.input 'Breakpoint condition: ')
    end,
    desc = 'Set Breakpoint',
  },
  -- Toggle to see last session result. Without this, you can't see session output in case of unhandled exception.
  {
    '<leader>dd',
    function()
      require('dapui').toggle()
    end,
    desc = 'See last session result.',
  },
})
