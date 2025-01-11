local M = {}
local game_state = require("state.core")
local og_reducer = require("state.reducer")
local meta_reducer = require("state.metareducer")

local reducer = meta_reducer.reduce(og_reducer.reduce)
local actions = game_state.actions

local windowWidth, windowHeight = love.graphics.getDimensions()

local playerWidth = math.floor(windowWidth * 0.7)
local playerHeight = math.floor(windowHeight * 0.25)

local draggablex = 0
local draggabley = 0
local PlayerCardLocations = {}
local GameState = game_state.initial_state
HANDLING_CARD = false
HANDLE_INDEX = nil
WIDTH_OFFSET = 0.15

local function get_card_locations()
  if #GameState.game_state.hand.cards > 0 then
    for i, card in ipairs(GameState.game_state.hand.cards) do
      table.insert(PlayerCardLocations, i, card)
      PlayerCardLocations[i].x = playerWidth / (1 + #GameState.game_state.hand.cards) * i
        - (35 / 2)
        + windowWidth * WIDTH_OFFSET
      PlayerCardLocations[i].y = windowHeight * 0.85
      print("index: " .. i .. " x: " .. PlayerCardLocations[i].x .. " \r\n y: " .. PlayerCardLocations[i].y)
    end
  end
end

local function get_hovering_details()
  --Card.x <= mouseX <= Card.x + 35
  --Card.y <= mouseY <= Card.y + 53
  local mouseX, mouseY = love.mouse.getPosition()
  for i, card in ipairs(GameState.game_state.hand.cards) do
    if
      mouseX - PlayerCardLocations[i].x <= 35
      and mouseX - PlayerCardLocations[i].x >= 0
      and mouseY - PlayerCardLocations[i].y <= 53
      and mouseY - PlayerCardLocations[i].y >= 0
    then
      return i, true
    end
  end
  return 0, false
end

---@param dt number: delta time
function M.update(dt)
  --check if mouse is hovering over card
  if love.mouse.isDown(1) then
    local cardIndex, isHovering = get_hovering_details()
    if isHovering and not HANDLING_CARD then --grab first card selected
      print("holding " .. cardIndex .. " IS HANDLING? " .. tostring(HANDLING_CARD))
      HANDLING_CARD = true
      HANDLE_INDEX = cardIndex
      GameState = reducer(GameState, actions.GRAB_CARD())
      draggablex, draggabley = love.mouse.getPosition()
    elseif isHovering and HANDLING_CARD then --only grab one card at a time
      print("passed over " .. cardIndex)
      draggablex, draggabley = love.mouse.getPosition()
    elseif not isHovering and HANDLING_CARD then --allows card to be dragged anywhere on screen
      draggablex, draggabley = love.mouse.getPosition()
    end
  end
end

function M.mousereleased(x, y, button)
  if button == 3 then
    GameState = reducer(GameState, actions.DRAW_CARD())
    get_card_locations()
  end
  if button == 2 then
    GameState = reducer(GameState, actions.NEW_GAME())
  end
  if button == 1 and HANDLING_CARD then
    print("released " .. HANDLE_INDEX)
    GameState = reducer(GameState, actions.RELEASE_CARD())
    HANDLING_CARD = false
    HANDLE_INDEX = nil
  end
  -- print(dump(game_state))
end

local function draw_stationary_card(imageName, index)
  love.graphics.draw(
    CardImages[imageName],
    playerWidth / (1 + #GameState.game_state.hand.cards) * index - (35 / 2) + windowWidth * WIDTH_OFFSET,
    windowHeight * 0.85
  )
end

local function draw_dragging_card(imageName)
  love.graphics.draw(CardImages[imageName], draggablex, draggabley)
end

function M.draw(t)
  -- center lines
  love.graphics.rectangle("fill", windowWidth / 2 - 2, 0, 4, windowHeight)
  love.graphics.rectangle("fill", 0, windowHeight / 2 - 2, windowWidth, 4)

  -- player card area
  love.graphics.rectangle(
    "fill",
    math.floor(windowWidth * WIDTH_OFFSET),
    math.floor(windowHeight * 0.75),
    playerWidth,
    playerHeight
  )

  for i, card in ipairs(GameState.game_state.hand.cards) do
    local imageName = card.suit .. "-" .. card.rank .. ".png"
    if card.isStationary then
      draw_stationary_card(imageName, i)
    else
      draw_dragging_card(imageName)
    end
  end
end

function M.keypressed(k)
  if k == "escape" then
    state.current = state.menu
  end
end

return M
