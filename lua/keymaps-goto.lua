local add = require("which-key").add
local p = require("snacks").picker

add({ "gr", function() p.lsp_references() end, nowait = true, desc = "References" })
add({ "gI", function() p.lsp_implementations() end, desc = "Goto implementation" })
add({ "gy", function() p.lsp_type_definitions() end, desc = "Goto type definition" })
