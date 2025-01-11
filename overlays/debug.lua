local M = {}

function M.draw()
  love.graphics.setColor(0.3, 0.3, 0.3, 0.5)
  love.graphics.rectangle("fill", 0, 0, 300, 300, 5, 5)
  love.graphics.setColor(1, 1, 1, 1)
  love.graphics.printf("Hello world", 0, 0, 300)
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
