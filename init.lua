-------------------------------------------------------------------------------
-- Set up optoins that need to be there before Lazy and plugins.

vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'
vim.g.have_nerd_font = true

-------------------------------------------------------------------------------
-- Install `lazy.nvim` plugin manager.

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  { import = 'plugins' },
})

-------------------------------------------------------------------------------
-- Load everything else.

require "options"
require "keymaps"
vim.cmd.colorscheme('neophile')

-- vim: ts=2 sts=2 sw=2 et
