require("plenary.reload").reload_module "learn-nvim"

local curl = require "plenary.curl"

local res = curl.get("https://jsonplaceholder.typicode.com/todos", {
  accept = "application/json",
})
print(vim.inspect.inspect(res))

local res = curl.post("https://postman-echo.com/post", {
  body = "John Doe",
})
print(vim.inspect.inspect(res))
