local poker = require("poker.card")
local game_state = require("state.core")
local dump = require("utils.debug").dump

local function load_img(file_name)
  print(file_name)
  return love.graphics.newImage("assets/" .. file_name)
end

local function load_cards(directory)
	local card_assets_dir = love.filesystem.getDirectoryItems(directory)
	CardImages = {}
	for k, card_asset in ipairs(card_assets_dir) do
		CardImages[card_asset]  = load_img(card_asset)
	end
end

function love.load()
  load_cards("assets")
  GameState = game_state.initial_state
end

---@param dt number: delta time
function love.update(dt) end

function love.mousereleased(x, y, button)
  if button == 1 then
    GameState = game_state.reduce(GameState, game_state.draw_card({ suit = poker.SUIT.clubs, rank = poker.RANK.ace }))
  end
  if button == 2 then
    GameState = game_state.reduce(GameState, game_state.new_game())
  end
end

function love.draw(t)
  love.graphics.print(dump(GameState), 300, 400)

  for i, v in ipairs(GameState.hand.cards) do
    love.graphics.draw(CardImages["clubs-2.png"], i * 50, 50)
  end
end
