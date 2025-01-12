local logger = {}
local tail = require("utils.fp").tail

local logs = {}

---@param n number: the number of lines from the end of the logs you want returned
---@return table: the last n logs
function logger.tail(n)
  return tail(logs, n)
end

function logger.log(content)
  table.insert(logs, content)
  print(content)
end

return logger
