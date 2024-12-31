local poker = require("poker.card")
local game_state = require("state.core")
local dump = require("utils.debug").dump
local reducer = require("state.reducer")

local function load_img(file_name)
  return love.graphics.newImage("assets/" .. file_name)
end

local function load_cards(directory)
	local card_assets_dir = love.filesystem.getDirectoryItems(directory)
	CardImages = {}
  for _, card_asset in ipairs(card_assets_dir) do
    local index = string.find(card_asset, '.png')
    if index ~= nil then
      CardImages[string.sub(card_asset, 1, index-1)] = load_img(card_asset)
    end
	end
end

local function draw_player_card(card, place)
  cardInfo = card.suit .. "-"
  if card.rank == "ace" or card.rank == "king" or card.rank == "queen" or card.rank == "jack" then
    cardInfo = cardInfo .. card.rank
  else
    if tonumber(card.rank) <= 10 then
      cardInfo = cardInfo .. card.rank
    end
  end
  return cardInfo
end

function love.load()
  GameState = game_state.initial_state
  load_cards("assets")
end

---@param dt number: delta time
function love.update(dt) end

function love.mousereleased(x, y, button)
  if button == 1 then
    GameState = reducer.reduce(GameState, game_state.draw_card({ suit = poker.SUIT.clubs, rank = poker.RANK.ace }))
  end
  if button == 2 then
    GameState = reducer.reduce(GameState, game_state.new_game())
  end
end

function love.draw(t)
  love.graphics.print(dump(GameState), 300, 400)

  for i, v in ipairs(GameState.game_state.hand.cards) do
    cardInfo = draw_player_card(v, i)
    love.graphics.draw(CardImages[cardInfo], i * 50, 50)
  end
end
