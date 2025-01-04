local M = {}

local samsSuperCoolCards = {}
local SamsSuperCoolCustomCard = require("poker.samsSuperCoolCustomCard")

---@param dt number: delta time
function M.update(dt)
  for _, card in ipairs(samsSuperCoolCards) do
    card:update(dt)
  end
end

function M.mousereleased(x, y, button)
  if button == 1 then
    table.insert(samsSuperCoolCards, SamsSuperCoolCustomCard:new())
  end
end

function M.draw()
  for _, card in ipairs(samsSuperCoolCards) do
    card:draw()
  end
end

function M.keypressed(k)
  if k == "escape" then
    state.current = state.menu
  end
end

return M
