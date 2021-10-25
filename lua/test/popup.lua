require("plenary.reload").reload_module "learn-nvim"

local popup = require "plenary.popup"

vim.cmd [[highlight PopupColor ctermbg=black ctermfg=white guifg=white guibg=green]]

popup.create({ "another one", "another two", "another three" }, {
  line = 10,
  col = 25,
  minwidth = 20,
  -- highlight = "PopupColor",
})

popup.create("all the plus signs", {
  line = 8,
  col = 55,
  padding = { 0, 3, 0, 3 },
  border = { 0, 1, 0, 1 },
  borderchars = { "-", "+" },
})
