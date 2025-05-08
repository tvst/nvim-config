return { -- Collection of various small independent plugins/modules
  "echasnovski/mini.nvim",
  enabled = true,
  config = function()
    -- Better Around/Inside textobjects
    --
    -- Examples:
    --  - va)  - [V]isually select [A]round [)]paren
    --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
    --  - ci'  - [C]hange [I]nside [']quote
    require("mini.ai").setup({
      n_lines = 500,
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

    -- Navigate using [ ]
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
  end,
}
