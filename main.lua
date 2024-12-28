function love.load()
	spriteSheet = love.graphics.newImage("game-cards/card-suites.png")
	cardBack = love.graphics.newImage("game-cards/card-back.png")
	twoOfClubs = love.graphics.newArrayImage("game-cards/clubs-2.png")

	card = nil

	spriteAnimation = newAnimation(love.graphics.newImage("game-cards/card-suites.png"), 64, 64, 12)
end

function newAnimation(sheet, width, height, duration)
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
	spriteAnimation.currentTime = spriteAnimation.currentTime + dt
	if spriteAnimation.currentTime >= spriteAnimation.duration then
		spriteAnimation.currentTime = spriteAnimation.currentTime - spriteAnimation.duration
	end
end

function love.mousereleased(x, y, button) end

function love.draw(t)
	-- local spriteCounter = math.floor(spriteAnimation.currentTime / spriteAnimation.duration * #spriteAnimation.quads) + 1
	-- love.graphics.draw(spriteAnimation.spriteSheet, spriteAnimation.quads[spriteCounter], 0, 0, 0, 4)
end

---@class poker_game.Card
---@field suit

---@class poker_game.state.Deck
---@field card_back string: the card back on top of the deck

---@class poker_game.state.Hand
---@field card_back string: the card back on top of the dec

---@class poker_game.State
---@field deck poker_game.state.Deck: the state of the deck
---@field hand poker_game.state.Hand: the state of the player's hand
