local M = {}

local font = love.graphics.newFont(50)
local cursor = { x = 405, y = 210, w = 190, h = 45, index = 1, max = 4 }

function M.draw()
  -- "disable" main menu
  if state.current == state.menu then
    love.graphics.setColor(0.2, 0.2, 0.2, 0.5)
    love.graphics.rectangle("fill", 80, 150, 315, 160, 5, 5)
  end

  -- draw options background
  love.graphics.setColor(0.2, 0.2, 0.2, 1)
  love.graphics.rectangle("fill", 400, 205, 200, 205, 5, 5)

  -- draw selection box
  love.graphics.setColor(0.5, 0.5, 1, 0.75)
  love.graphics.rectangle("fill", cursor.x, cursor.y, cursor.w, cursor.h, 25, 15)

  -- draw options menu
  love.graphics.setFont(font)
  love.graphics.setColor(1, 1, 1, 1)
  love.graphics.print("Sound", 415, 200)
  love.graphics.print("Music", 415, 250)
  love.graphics.print("Input", 415, 300)
  love.graphics.print("Quit", 415, 350)
end

function M.keypressed(key)
  if key == "escape" then
    overlay.pop()
    return
  elseif key == "up" then
    if cursor.index > 1 then
      cursor.index = cursor.index - 1
    end
    cursor.y = cursor.index * (cursor.h + 5) + 160
    return
  elseif key == "down" then
    if cursor.index < cursor.max then
      cursor.index = cursor.index + 1
    end
    cursor.y = cursor.index * (cursor.h + 5) + 160
    return
  elseif key == "left" or key == "right" then
    return -- consume other direction keys
  elseif key == "return" or key == "space" then
    if cursor.index == cursor.max then -- Quit
      if state.current == state.menu then
      else
        overlay.pop()
        state.current = state.menu
      end
    end
    return
  end
  return key
end

function M.update(dt) end

return M
