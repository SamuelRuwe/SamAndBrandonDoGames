local Button = {}
local logger = require("utils.logger")

local printed = {}
local function print_once(input)
  if not printed[input] then
    logger.log(input)
    printed[input] = true
  end
end

---@class button.opts
---@field text string: text to display on the button

---@param x number
---@param y number
---@param width number
---@param height number
---@param opts button.opts
function Button.create(x, y, width, height, opts)
  local opts = opts or {}
  love.graphics.rectangle("fill", x, y, width, height)

  if opts.text then
    local text_length = #opts.text
    local font_size = width / text_length
    local font = love.graphics.newFont(font_size)
    print_once("font width " .. font:getWidth(opts.text))
    print_once("font size " .. font_size)
    love.graphics.setColor(0, 0, 0, 1)
    love.graphics.print(opts.text, font, x, y)
    love.graphics.setColor(1, 1, 1, 1)
    love.keypressed()
  end
end

function Button.contains(x, y, width, height, mouseX, mouseY)
  local inX = (x <= mouseX) and mouseX <= x + width
  local inY = (y <= mouseY) and mouseY <= y + height
  return inX and inY
end

return Button
