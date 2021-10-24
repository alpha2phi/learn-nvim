local api = vim.api
local popup = require "learn-nvim.popup"

local function create_floating_win()
  local editorWidth = api.nvim_get_option "columns"
  local editorHeight = api.nvim_get_option "lines"
  local opts = {
    height = math.ceil(editorHeight * 0.8 - 4),
    width = math.ceil(editorWidth * 0.8),
    border = true,
    title = "Floating Window",
  }
  opts.row = math.ceil((editorHeight - opts.height) / 2 - 1)
  opts.col = math.ceil((editorWidth - opts.width) / 2)
  local win_buf = popup.create_win(opts)
  api.nvim_buf_set_option(win_buf.buf, "bufhidden", "wipe")
  api.nvim_win_set_option(win_buf.win, "winhl", "Normal:Normal")
  api.nvim_win_set_option(win_buf.win, "number", true)
  api.nvim_set_current_win(win_buf.win)
  return win_buf
end

create_floating_win()
