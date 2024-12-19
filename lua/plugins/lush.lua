local linux_dir = "/home/tvst/Projects/config/repos/neophile"
local mac_dir = "/Users/tteixeira/Projects/config/repos/neophile"

local dir_name = linux_dir

if vim.fn.isdirectory(dir_name) == 0 then
  dir_name = mac_dir
end

return {
  "rktjmp/lush.nvim",
  { dir = dir_name, lazy = true },
}
