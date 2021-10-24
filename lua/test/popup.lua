local popup = require "learn-nvim.popup"
local autocmd = require "learn-nvim.popup.autocmd"
local api = vim.api

function prompt_new(optssfdsff)
  local obj = {}
  if opts.border == nil then
    opts.border = false
  end
  opts.title = opts.title or ""
  opts.height = 1
  opts.prompt_text = opts.prompt_text or ""
  obj.prefix = opts.prompt_text .. "> "
  local win_buf = popup.create_win(opts)
  obj.buffer = win_buf.buf
  obj.window = win_buf.win
  opts.highlight = opts.highlight or "Normal"
  api.nvim_win_set_option(obj.window, "winhl", "Normal:" .. opts.highlight)
  api.nvim_buf_set_option(obj.buffer, "bufhidden", "hide")
  api.nvim_win_set_option(obj.window, "wrap", false)
  api.nvim_win_set_option(obj.window, "number", false)
  api.nvim_win_set_option(obj.window, "relativenumber", false)
  api.nvim_buf_set_option(obj.buffer, "buftype", "prompt")
  vim.fn.prompt_setprompt(obj.buffer, obj.prefix)
  opts.prompt_highlight = opts.prompt_highlight or "Normal"
  obj.prompt_highlight = opts.prompt_highlight
  api.nvim_buf_add_highlight(obj.buffer, promptHighlightNamespace, obj.prompt_highlight, 0, 0, #obj.prefix)
  if opts.init_text then
    obj:setPromptText(opts.init_text)
    obj.insertStarted = true
  end
  local function startInsert()
    if not obj.insertStarted then
      vim.cmd "startinsert"
      obj.insertStarted = true
    end
  end
  -- autocmd.addCommand(obj.buffer, { ["BufEnter,WinEnter"] = startInsert })
  return obj
end
local function popup_editor(opts)
  local editorWidth = api.nvim_get_option "columns"
  local editorHeight = api.nvim_get_option "lines"
  opts.list.height = opts.height or math.ceil(editorHeight * 0.8 - 4)
  if opts.list.height >= api.nvim_get_option "lines" - 4 then
    print "no enough space to draw popup"
    return
  end
  local percent = opts.list.height / editorHeight
  local newWidth = percent * editorWidth
  opts.list.width = opts.width or math.ceil(newWidth)
  if opts.list.width >= api.nvim_get_option "columns" - 4 then
    print "no enough space to draw popup"
    return
  end
  opts.list.row = math.ceil((editorHeight - opts.list.height) / 2 - 1)
  opts.list.col = math.ceil((editorWidth - opts.list.width) / 2) + 2
  -- self.list = list:new(opts.list)
  -- if not self.list then
  --   return false
  -- end
  if opts.list.border then
    opts.prompt.list_border = true
  end
  opts.prompt.width = opts.list.width
  opts.prompt.row = opts.list.row - 1
  if opts.list.border then
    opts.prompt.row = opts.prompt.row - 1
  end
  opts.prompt.col = opts.list.col
  if opts.prompt.border then
    opts.prompt.row = opts.prompt.row - 1
    if not opts.list.border then
      opts.prompt.width = opts.prompt.width - 2
      opts.prompt.col = opts.prompt.col + 1
    end
  end
  local prompt = prompt_new(opts.prompt)
  -- if not self.prompt then
  --   self.list:close()
  --   return false
  -- end
  return true
end

local opts = {
  prompt = {
    border = true,
    title = "Search",
    highlight = "Normal",
    prompt_highlight = "Normal",
    init_text = "testing",
  },
  mode = "editor",
}
opts.list = opts.list or {}

local popup_win = popup_editor(opts)
