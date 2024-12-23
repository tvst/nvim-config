return {
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        section_separators = { left = "", right = "" },
        component_separators = { left = "", right = "" },
        disabled_filetypes = {
          statusline = {
            "dashboard",
            "alpha",
            "ministarter",
            "snacks_dashboard",
            "packer",
            "NVimTree",
            "neo-tree",
          },
        },
        always_divide_middle = false,
      },
      sections = {
        lualine_a = {
          { "diagnostics", color = "StatusLineNC" },
        },
        lualine_b = {
          {
            "filename",
            file_status = true,
            path = 1,
            color = "StatusLine",
          },
        },
        lualine_c = {},
        lualine_x = {},
        lualine_y = {
          { "progress", color = "StatusLineNC" },
          { "location", color = "StatusLineNC" },
          { "branch", color = "StatusLineNC" },
        },
        lualine_z = {
          { "mode", color = "StatusLineNC" },
          function()
            local reg = vim.fn.reg_recording()
            if reg == "" then
              return ""
            end
            return "Recording to " .. reg
          end,
        },
      },
      inactive_sections = {
        lualine_a = {
          { "diagnostics", color = "StatusLineNC" },
        },
        lualine_b = {
          {
            "filename",
            file_status = true,
            path = 1,
            color = "StatusLineNC",
          },
        },
        lualine_c = {},
        lualine_x = {},
        lualine_y = {
          { "progress", color = "StatusLineNC" },
          { "location", color = "StatusLineNC" },
          { "branch", color = "StatusLineNC" },
        },
        lualine_z = {},
      },
    },
  },
}
