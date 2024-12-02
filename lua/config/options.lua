-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = "⇥ ", trail = "·", nbsp = "␣", extends = "…", precedes = "…" }

-- -- Characters to use to fill UI elements.
-- vim.opt.fillchars = { fold = '·', diff = ' ', vert = ' ', stlnc = ' ', stl = ' ' }

-- Show which line your cursor is on
-- vim.opt.cursorline = false

-- Column that should be colored differently.
vim.opt.textwidth = 100
vim.opt.colorcolumn = "+1" -- The column after textwidth.

-- Show borders in diagnostic floats
vim.diagnostic.config({
	float = { border = "rounded" },
})

-- Use treesitter for folding.
vim.wo.foldmethod = "expr"
vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
