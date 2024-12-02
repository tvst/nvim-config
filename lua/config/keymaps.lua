-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set(
  "n",
  "<leader>sx",
  require("telescope.builtin").resume,
  { noremap = true, silent = true, desc = "Resume" }
)

vim.keymap.set("n", "<S-h>", "gT", { desc = "Prev Tab" })
vim.keymap.set("n", "<S-l>", "gt", { desc = "Next Tab" })

vim.keymap.set("n", "<localleader>w", ":w<cr>", { noremap = true, silent = true, desc = "Write buffer" })
vim.keymap.set("n", "<localleader>q", ":q<cr>", { noremap = true, silent = true, desc = "Close window" })

-- vim.keymap.set('n', '\\q', ':q<cr>', { desc = '[Q]uit' })
-- vim.keymap.set('n', '\\w', ':w<cr>', { desc = 'Close [W]indow' })
-- vim.keymap.set('n', '\\t', ':tabe %<cr>', { desc = 'New [T]ab' })
-- vim.keymap.set('n', '\\tt', ':tabe<cr>', { desc = 'New blank [Tt]ab' })

-- Mappings for diffs
vim.keymap.set("n", "\\d", ":diffthis<cr>", { desc = "Diff File" })
vim.keymap.set("n", "\\du", ":diffupdate<cr>", { desc = "Diff Update" })
vim.keymap.set("n", "\\dd", ":diffoff<cr>", { desc = "Stop Diff" })

-- Navigate the Treesitter tree with [; ]; [p and ]p

local function jump_to(line, col)
  -- Add current position to jumplist so you can return with Ctrl-O
  vim.cmd([[normal! m']])

  pcall(vim.api.nvim_win_set_cursor, 0, { line + 1, col })
end

local function get_prev_sibling(node)
  local old_node = node
  local old_line = old_node:start()
  local line = old_line

  while line >= old_line do
    old_node = node
    node = node:prev_sibling() or node:parent()

    if node == nil then
      return old_node
    end

    line = node:start()
  end

  return node
end

local function get_next_sibling(node)
  local old_node = node
  local old_line = old_node:start()
  local line = old_line

  while line <= old_line do
    old_node = node
    node = node:next_sibling() or node:parent()

    if node == nil then
      return old_node
    end

    line = node:start()
  end

  return node
end

local function get_parent_up(node)
  local old_node = node
  local old_line = old_node:start()
  local line = old_line

  while line >= old_line do
    old_node = node
    node = node:parent() or node:prev_sibling()

    if node == nil then
      return old_node
    end

    line = node:start()
  end

  return node
end

local function get_parent_down(node)
  local old_node = node
  local old_line = old_node:end_()
  local line = old_line

  while line <= old_line do
    old_node = node
    node = node:parent() or node:next_sibling()

    if node == nil then
      return old_node
    end

    line = node:end_()
  end

  return node
end

vim.keymap.set("n", "[;", function()
  local node = vim.treesitter.get_node()

  if node == nil then
    return
  end

  node = get_prev_sibling(node)

  local line, col = node:start()
  jump_to(line, col)
end, { noremap = true, desc = "Goto previous sibling" })

vim.keymap.set("n", "];", function()
  local node = vim.treesitter.get_node()

  if node == nil then
    return
  end

  node = get_next_sibling(node)

  local line, col = node:start()
  jump_to(line, col)
end, { noremap = true, desc = "Goto next sibling" })

vim.keymap.set("n", "[p", function()
  local node = vim.treesitter.get_node()

  if node == nil then
    return
  end

  node = get_parent_up(node)

  local line, col = node:start()
  jump_to(line, col)
end, { noremap = true, desc = "Goto parent top" })

vim.keymap.set("n", "]p", function()
  local node = vim.treesitter.get_node()

  if node == nil then
    return
  end

  node = get_parent_down(node)

  local line, col = node:end_()
  jump_to(line, col)
end, { noremap = true, desc = "Goto parent bottom" })
