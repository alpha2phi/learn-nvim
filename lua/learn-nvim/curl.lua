require("plenary.reload").reload_module "learn-nvim"

local curl = require "plenary.curl"

local function invoke_api()
  local res = curl.get("https://postman-echo.com/get", {
    accept = "application/json",
  })
  print(vim.inspect.inspect(res))
end

invoke_api()
