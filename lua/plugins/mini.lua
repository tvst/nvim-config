return { -- Collection of various small independent plugins/modules
  "echasnovski/mini.nvim",
  enabled = false,
  config = function()
    -- Better Around/Inside textobjects
    --
    -- Examples:
    --  - va)  - [V]isually select [A]round [)]paren
    --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
    --  - ci'  - [C]hange [I]nside [']quote
    require("mini.ai").setup({
      n_lines = 500,
      custom_textobjects = {
        o = require("mini.ai").gen_spec.treesitter({ -- code block
          a = { "@block.outer", "@conditional.outer", "@loop.outer" },
          i = { "@block.inner", "@conditional.inner", "@loop.inner" },
        }),
        f = require("mini.ai").gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }), -- function
        c = require("mini.ai").gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }),       -- class
        t = { "<([%p%w]-)%f[^<%w][^<>]->.-</%1>", "^<.->().*()</[^/]->$" },                           -- tags
        d = { "%f[%d]%d+" },                                                                          -- digits
        e = {                                                                                         -- Word with case
          { "%u[%l%d]+%f[^%l%d]", "%f[%S][%l%d]+%f[^%l%d]", "%f[%P][%l%d]+%f[^%l%d]", "^[%l%d]+%f[^%l%d]" },
          "^().*()$",
        },
        u = require("mini.ai").gen_spec.function_call(),                           -- u for "Usage"
        U = require("mini.ai").gen_spec.function_call({ name_pattern = "[%w_]" }), -- without dot in function name
      },
    })

    -- Add/delete/replace surroundings (brackets, quotes, etc.)
    --
    -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
    -- - sd'   - [S]urround [D]elete [']quotes
    -- - sr)'  - [S]urround [R]eplace [)] [']
    require("mini.surround").setup({
      mappings = {
        add = 'Sa',            -- Add surrounding in Normal and Visual modes
        delete = 'Sd',         -- Delete surrounding
        find = 'Sf',           -- Find surrounding (to the right)
        find_left = 'SF',      -- Find surrounding (to the left)
        highlight = 'Sh',      -- Highlight surrounding
        replace = 'Sr',        -- Replace surrounding
        update_n_lines = 'Sn', -- Update `n_lines`

        suffix_last = 'l',     -- Suffix to search with "prev" method
        suffix_next = 'n',     -- Suffix to search with "next" method
      },
    })

    -- Navigate blocks using [ ]
    require("mini.bracketed").setup({
      buffer = { suffix = "b", options = {} },
      comment = { suffix = "/", options = {} }, -- ]c is for diffs
      conflict = { suffix = "x", options = {} },
      diagnostic = { suffix = "d", options = {} },
      file = { suffix = "f", options = {} },
      indent = { suffix = "i", options = {} },
      -- oldfile = { suffix = "o", options = {} },
      quickfix = { suffix = "q", options = {} },
      location = { suffix = "l", options = {} },
      undo = { suffix = "u", options = {} },
      yank = { suffix = "y", options = {} },
    })

    -- -- Simple and easy statusline.
    -- --  You could remove this setup call if you don't like it,
    -- --  and try some other statusline plugin
    -- local statusline = require("mini.statusline")
    -- set use_icons to true if you have a Nerd Font
    -- statusline.setup({ use_icons = vim.g.have_nerd_font })

    -- -- You can configure sections in the statusline by overriding their
    -- -- default behavior. For example, here we set the section for
    -- -- cursor location to LINE:COLUMN
    -- ---@diagnostic disable-next-line: duplicate-set-field
    -- statusline.section_location = function()
    --   return "%2l:%-2v"
    -- end
  end,
}
