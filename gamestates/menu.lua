local M = {}

-- initialize main menu
local font = love.graphics.newFont(50)
local cursor = {}
cursor.index = 1
cursor.max = 3
cursor.x = 85
cursor.y = 155
cursor.w = 305
cursor.h = 50

function M.draw()
  love.graphics.setColor(1, 1, 1, 1)

  -- menu background
  love.graphics.setColor(1, 1, 1, 0.5)
  love.graphics.rectangle("fill", cursor.x - 5, 150, cursor.w + 10, 160, 5, 5)

  -- draw selection box
  love.graphics.setColor(0.5, 0.5, 1, 0.75)
  love.graphics.rectangle("fill", cursor.x, cursor.y, cursor.w, cursor.h, 25, 15)

  -- draw menu options
  love.graphics.setFont(font)
  love.graphics.setColor(0, 0, 0, 1)
  love.graphics.print("The Worlds Best Card Game", 12, 2)
  love.graphics.setColor(1, 1, 1, 1)
  love.graphics.print("New Game", 100, 150)
  love.graphics.print("Sams Super Cool Card Click Game", 100, 200)
  love.graphics.print("Quit", 100, 250)
end

function M.keypressed(key)
  if key == "down" then
    if cursor.index < cursor.max then
      cursor.index = cursor.index + 1
    else
      cursor.index = 1
    end
    cursor.y = cursor.index * cursor.h + 105
  elseif key == "up" then
    if cursor.index > 1 then
      cursor.index = cursor.index - 1
    else
      cursor.index = cursor.max
    end
    cursor.y = cursor.index * cursor.h + 105
  elseif key == "space" or key == "return" then
    if cursor.index == 1 then
      state.current = state.highcard
    end
    if cursor.index == 2 then
      state.current = state.samssupercoolcardstate
    end
    if cursor.index == 3 then
      love.event.quit()
    end
  end
end

function M.update(dt) end

return M
