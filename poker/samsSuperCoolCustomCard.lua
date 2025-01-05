local SamsSuperCoolCard = {}

function SamsSuperCoolCard:new(card)
  card = card or {}
  self.x = 100
  self.y = 100
  self.width = 200
  self.height = 150
  self.speed = 100
  setmetatable(card, self)
  self.__index = self
  return card
end

---call in love.update
---@param dt number: deltatime from love
function SamsSuperCoolCard:update(dt)
  self.x = self.x + self.speed * dt
end

---call in love.draw
function SamsSuperCoolCard:draw()
  love.graphics.rectangle("line", self.x, self.y, self.width, self.height)
end

return SamsSuperCoolCard
