-- Since I disable bufferline, make tabs follow same behavior as bufferline.
vim.keymap.set("n", "<S-h>", "gT", { desc = "Prev Tab" })
vim.keymap.set("n", "<S-l>", "gt", { desc = "Next Tab" })

vim.keymap.set("n", "<localleader>w", ":w<cr>", { noremap = true, silent = true, desc = "Write buffer" })
vim.keymap.set("n", "<localleader>q", ":q<cr>", { noremap = true, silent = true, desc = "Close window" })

-- Mappings for diffs
vim.keymap.set("n", "\\d", ":diffthis<cr>", { desc = "Diff File" })
vim.keymap.set("n", "\\du", ":diffupdate<cr>", { desc = "Diff Update" })
vim.keymap.set("n", "\\dd", ":diffoff<cr>", { desc = "Stop Diff" })

local virtual_text_active = true
vim.keymap.set("n", "<leader>uD", function()
  virtual_text_active = not virtual_text_active
  if virtual_text_active then
    vim.diagnostic.config({ virtual_text = true })
  else
    vim.diagnostic.config({ virtual_text = false })
  end
end, { desc = "Toggle inline diagnostics" })

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
  vim.cmd("norm! $^")
  local node = vim.treesitter.get_node()

  if node == nil then
    return
  end

  node = get_prev_sibling(node)

  local line, col = node:start()
  jump_to(line, col)
end, { noremap = true, desc = "Goto previous sibling" })

vim.keymap.set("n", "];", function()
  vim.cmd("norm! $^")
  local node = vim.treesitter.get_node()

  if node == nil then
    return
  end

  node = get_next_sibling(node)

  local line, col = node:start()
  jump_to(line, col)
end, { noremap = true, desc = "Goto next sibling" })

vim.keymap.set("n", "[p", function()
  vim.cmd("norm! $^")
  local node = vim.treesitter.get_node()

  if node == nil then
    return
  end

  node = get_parent_up(node)

  local line, col = node:start()
  jump_to(line, col)
end, { noremap = true, desc = "Goto parent top" })

vim.keymap.set("n", "]p", function()
  vim.cmd("norm! $^")
  local node = vim.treesitter.get_node()

  if node == nil then
    return
  end

  node = get_parent_down(node)

  local line, col = node:end_()
  jump_to(line, col)
end, { noremap = true, desc = "Goto parent bottom" })
