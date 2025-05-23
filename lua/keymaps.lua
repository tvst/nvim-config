local add = require("which-key").add

require "keymaps-file"
require "keymaps-editor"
require "keymaps-git"
require "keymaps-window"
require "keymaps-tab"
require "keymaps-debug"
require "keymaps-test"
require "keymaps-vim"
require "keymaps-session"

require "keymaps-nextprev"
require "keymaps-goto"
require "keymaps-nav"
require "keymaps-local"
require "keymaps-fixes"

add({ "<leader>-", "<C-W>s", desc = "Split below" })
add({ "<leader>|", "<C-W>v", desc = "Split right" })
add({ "<leader>.", function() require("snacks").picker.resume() end, desc = "Resume last picker" })
