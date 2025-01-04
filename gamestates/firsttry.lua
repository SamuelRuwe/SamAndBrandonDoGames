local game_state = require("state.core")
local dump = require("utils.debug").dump
local reducer = require("state.reducer")
local actions = game_state.actions
local M = {}
local GameState = game_state.initial_state

local windowWidth, windowHeight = love.graphics.getDimensions()
local playerWidth = math.floor(windowWidth * 0.7)
local playerHeight = math.floor(windowHeight * 0.25)

---@param dt number: delta time
function M.update(dt) end

function M.mousereleased(x, y, button)
  if button == 1 then
    GameState = reducer.reduce(GameState, actions.DRAW_CARD())
  end
  if button == 2 then
    GameState = reducer.reduce(GameState, actions.NEW_GAME())
  end
end

function M.draw()
  -- center lines
  love.graphics.rectangle("fill", windowWidth / 2 - 2, 0, 4, windowHeight)
  love.graphics.rectangle("fill", 0, windowHeight / 2 - 2, windowWidth, 4)

  -- player card area
  love.graphics.rectangle(
    "fill",
    math.floor(windowWidth * 0.15),
    math.floor(windowHeight * 0.75),
    playerWidth,
    playerHeight
  )

  for i, card in ipairs(GameState.game_state.hand.cards) do
    love.graphics.draw(
      CardImages[card.suit .. "-" .. card.rank .. ".png"],
      windowWidth / (1 + #GameState.game_state.hand.cards) * i - (35 / 2),
      windowHeight * 0.85
    )
  end
end

function M.keypressed(k)
  if k == "escape" then
    state.current = state.menu
  end
end

return M
