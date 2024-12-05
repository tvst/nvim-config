-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local ntcommand = require("neo-tree.command")
local ntevents = require("neo-tree.events")

local tree_open = false

local function tab_enter()
  -- print("enter!")
  if tree_open then
    vim.api.nvim_command("wincmd p") -- ?
    ntcommand.execute({ action = "show" })
  else
    ntcommand.execute({ action = "close" })
  end
end

ntevents.subscribe({
  event = ntevents.NEO_TREE_WINDOW_AFTER_OPEN,
  handler = function()
    tree_open = true
    -- print("Open!")
  end,
  id = "tvst-auto-open-tree",
})

ntevents.subscribe({
  event = ntevents.NEO_TREE_WINDOW_AFTER_CLOSE,
  handler = function()
    tree_open = false
    -- print("Close!")
  end,
  id = "tvst-auto-close-tree",
})

vim.api.nvim_create_autocmd({ "TabEnter", "TabNewEntered" }, { callback = tab_enter })
