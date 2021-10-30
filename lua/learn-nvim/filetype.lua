require("plenary.reload").reload_module "learn-nvim"

local filetype = require "plenary.filetype"

print(filetype.detect_from_extension "test.txt")
print(filetype.detect_from_name "Makefile")
print(filetype._parse_shebang "#!/usr/bin/python3")

print(assert("a", "b"))
