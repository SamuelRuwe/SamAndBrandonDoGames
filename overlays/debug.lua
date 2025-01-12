local M = {}

local log_file = love.filesystem.getInfo("log.txt")

local font = love.graphics.newFont(12)
function M.draw()
  love.graphics.setFont(font)
  love.graphics.setColor(0.3, 0.3, 0.3, 0.5)
  love.graphics.rectangle("fill", 0, 0, 300, 300, 5, 5)
  love.graphics.setColor(1, 1, 1, 1)
  for i, line in ipairs(Logger.tail(12)) do
    love.graphics.print(line, 10, 10 + ((i - 1) * 24))
  end
end

function M.keypressed(key)
  if key == "escape" or key == "f2" then
    overlay.pop()
    return
  end
  return key
end

function M.update(dt) end

return M
