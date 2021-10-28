require("plenary.reload").reload_module "learn-nvim"

local popup = require "plenary.popup"

local function create_default_popup()
  local win_id = popup.create({ "menu item 1", "menu item 2", "menu item 3" }, {})
  print(win_id)
end

create_default_popup()

vim.cmd [[highlight PopupColor ctermbg=black ctermfg=blue guifg=blue guibg=green]]

local function create_highlight_popup()
  local win_id = popup.create({ "item 1", "item 2", "item 3" }, {
    line = 15,
    col = 45,
    minwidth = 20,
    border = true,
    highlight = "PopupColor",
  })
  print(win_id)
end

create_highlight_popup()

local function create_border_popup(borderchars)
  local _, config = popup.create("popup with custom border", {
    line = 8,
    col = 55,
    padding = { 0, 3, 0, 3 },
    borderchars = borderchars,
  })

  local border_id = config.border.win_id
  local border_bufnr = vim.api.nvim_win_get_buf(border_id)
  print(border_id)
  print(border_bufnr)
end

create_border_popup { "+" }
