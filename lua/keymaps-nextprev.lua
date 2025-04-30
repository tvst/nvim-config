local add = require("which-key").add

add({ "[b", "<cmd>bprevious<cr>", desc = "Prev Buffer" })
add({ "]b", "<cmd>bnext<cr>", desc = "Next Buffer" })

add({
  "[q",
  function()
    if require("trouble").is_open() then
      require("trouble").prev({ skip_groups = true, jump = true })
    else
      local ok, err = pcall(vim.cmd.cprev)
      if not ok then
        vim.notify(err, vim.log.levels.ERROR)
      end
    end
  end,
  desc = "Previous Quickfix item",
})

add({
  "]q",
  function()
    if require("trouble").is_open() then
      require("trouble").next({ skip_groups = true, jump = true })
    else
      local ok, err = pcall(vim.cmd.cnext)
      if not ok then
        vim.notify(err, vim.log.levels.ERROR)
      end
    end
  end,
  desc = "Next Quickfix item",
})

-- diagnostic
local diagnostic_goto = function(next, severity)
  local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
  severity = severity and vim.diagnostic.severity[severity] or nil
  return function()
    go({ severity = severity })
  end
end

add({ "]d", diagnostic_goto(true), desc = "Next Diagnostic" })
add({ "[d", diagnostic_goto(false), desc = "Prev Diagnostic" })
add({ "]e", diagnostic_goto(true, "ERROR"), desc = "Next Error" })
add({ "[e", diagnostic_goto(false, "ERROR"), desc = "Prev Error" })
add({ "]w", diagnostic_goto(true, "WARN"), desc = "Next Warning" })
add({ "[w", diagnostic_goto(false, "WARN"), desc = "Prev Warning" })

-- Navigate the Treesitter tree

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

add({
  mode = { "v", "n" },
  {
    "[;",
    function()
      vim.cmd("norm! $^")
      local node = vim.treesitter.get_node()

      if node == nil then
        return
      end

      node = get_prev_sibling(node)

      local line, col = node:start()
      jump_to(line, col)
    end,
    noremap = true,
    desc = "Goto previous sibling",
  },
  {
    "];",
    function()
      vim.cmd("norm! $^")
      local node = vim.treesitter.get_node()

      if node == nil then
        return
      end

      node = get_next_sibling(node)

      local line, col = node:start()
      jump_to(line, col)
    end,
    noremap = true,
    desc = "Goto next sibling",
  },
  {
    "[p",
    function()
      vim.cmd("norm! $^")
      local node = vim.treesitter.get_node()

      if node == nil then
        return
      end

      node = get_parent_up(node)

      local line, col = node:start()
      jump_to(line, col)
    end,
    noremap = true,
    desc = "Goto [P]arent top",
  },
  {
    "]p",
    function()
      vim.cmd("norm! $^")
      local node = vim.treesitter.get_node()

      if node == nil then
        return
      end

      node = get_parent_down(node)

      local line, col = node:end_()
      jump_to(line, col)
    end,
    noremap = true,
    desc = "Goto [P]arent bottom"
  }
})
