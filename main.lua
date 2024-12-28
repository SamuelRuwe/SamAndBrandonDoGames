local poker = require("poker")

---@type poker_game.state.Core
local initial_state = {
	deck = {
		card_back = "",
	},
	hand = {
		cards = {},
	},
}

function love.load()
	SpriteSheet = love.graphics.newImage("game-cards/card-suites.png")
	CardBack = love.graphics.newImage("game-cards/card-back.png")
	TwoOfClubs = love.graphics.newImage("game-cards/clubs-2.png")

	Card = nil

	SpriteAnimation = newAnimation(love.graphics.newImage("game-cards/card-suites.png"), 64, 64, 12)
	GameState = initial_state
end

local function newAnimation(sheet, width, height, duration)
	local images = {}
	images.spriteSheet = sheet
	images.quads = {}
	for i = 0, sheet:getHeight() - height, height do
		for j = 0, sheet:getWidth() - width, width do
			table.insert(images.quads, love.graphics.newQuad(j, i, width, height, sheet:getDimensions()))
		end
	end

	images.duration = duration
	images.currentTime = 0

	return images
end

function love.update(dt)
	SpriteAnimation.currentTime = SpriteAnimation.currentTime + dt
	if SpriteAnimation.currentTime >= SpriteAnimation.duration then
		SpriteAnimation.currentTime = SpriteAnimation.currentTime - SpriteAnimation.duration
	end
end

function love.mousereleased(x, y, button)
	GameState = poker.reduce(GameState, poker.draw_card({ suit = poker.SUIT.clubs, rank = poker.RANK.two }))
end

function love.draw(t)
	-- local spriteCounter = math.floor(spriteAnimation.currentTime / spriteAnimation.duration * #spriteAnimation.quads) + 1
	-- love.graphics.draw(spriteAnimation.spriteSheet, spriteAnimation.quads[spriteCounter], 0, 0, 0, 4)
end
