require("plenary.reload").reload_module "learn-nvim"

local scan = require "plenary.scandir"

local dirs = scan.scan_dir("/tmp", { hidden = true, depth = 1 })

print(vim.inspect.inspect(dirs))
