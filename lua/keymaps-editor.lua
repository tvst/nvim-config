local add = require("which-key").add

Snacks.toggle.diagnostics():map("<leader>ed")
Snacks.toggle.indent():map("<leader>ei")
Snacks.toggle.inlay_hints():map("<leader>eh")
Snacks.toggle.line_number():map("<leader>en")
--Snacks.toggle.option({ "cursorline" }):map("<leader>ec")

local M = {}

-- From https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/util/format.lua
function M.toggle_autoformat(buf)
  return Snacks.toggle({
    name = "Auto Format (" .. (buf and "Buffer" or "Global") .. ")",
    get = function()
      if not buf then
        return vim.g.autoformat == nil or vim.g.autoformat
      end
      return M.autoformat_enabled()
    end,
    set = function(state)
      M.enable_autoformat(state, buf)
    end,
  })
end

function M.autoformat_enabled(buf)
  buf = (buf == nil or buf == 0) and vim.api.nvim_get_current_buf() or buf
  local gaf = vim.g.autoformat
  local baf = vim.b[buf].autoformat

  -- If the buffer has a local value, use that
  if baf ~= nil then
    return baf
  end

  -- Otherwise use the global value if set, or true by default
  return gaf == nil or gaf
end

function M.enable_autoformat(enable, buf)
  if enable == nil then
    enable = true
  end
  if buf then
    vim.b.autoformat = enable
  else
    vim.g.autoformat = enable
    vim.b.autoformat = nil
  end
end

M.toggle_autoformat(true):map("<leader>eF")
M.toggle_autoformat():map("<leader>ef")
