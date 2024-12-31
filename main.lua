local game_state = require("state.core")
local dump = require("utils.debug").dump
local reducer = require("state.reducer")
local actions = game_state.actions

local function load_img(file_name)
  return love.graphics.newImage("assets/" .. file_name)
end

local function load_cards(directory)
  local card_assets_dir = love.filesystem.getDirectoryItems(directory)
  CardImages = {}
  for _, card_asset in ipairs(card_assets_dir) do
    CardImages[card_asset] = load_img(card_asset)
  end
end

function set_windows()
  backgroundImage = love.graphics.newImage("assets/card-suites.png")
  windowWidth, windowHeight = love.graphics.getDimensions()
  playerWidth = math.floor(windowWidth*.7)
  playerHeight = math.floor(windowHeight*.25)
end

function love.load()
  GameState = game_state.initial_state
  set_windows()
  load_cards("assets")
end

---@param dt number: delta time
function love.update(dt)
  set_windows()
end

function love.mousereleased(x, y, button)
  if button == 1 then
    GameState = reducer.reduce(GameState, actions.DRAW_CARD())
  end
  if button == 2 then
    GameState = reducer.reduce(GameState, actions.NEW_GAME())
  end
end

function love.draw(t)
  -- center lines
  love.graphics.rectangle("fill", windowWidth/2 - 2, 0, 4, windowHeight)
  love.graphics.rectangle("fill", 0, windowHeight/2 - 2, windowWidth, 4)

  -- player card area
  love.graphics.rectangle("fill",math.floor(windowWidth*.15), math.floor(windowHeight*.75), playerWidth, playerHeight)

  for i, card in ipairs(GameState.game_state.hand.cards) do
    love.graphics.draw(CardImages[card.suit .. "-" .. card.rank .. ".png"], (windowWidth)/(1+#GameState.game_state.hand.cards)*i -(35/2), windowHeight*.85)
  end
end
