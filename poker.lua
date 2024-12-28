local M = {}

---@enum poker_game.SUIT
M.SUIT = {
	hearts = 0,
	spades = 1,
	diamonds = 2,
	clubs = 3,
}

---@enum poker_game.RANK
M.RANK = {
	ace = 14,
	king = 13,
	queen = 12,
	prince = 11,
	ten = 10,
	nine = 9,
	eight = 8,
	seven = 7,
	six = 6,
	five = 5,
	four = 4,
	three = 3,
	two = 2,
}

---@class poker_game.state.ACTION<T>
---@field type string: the type of the action
---@field value any: the value of the action

---@param value any
---@return poker_game.state.ACTION
function M.draw_card(value)
	return { type = "DRAW_CARD", value = value }
end

---@class poker_game.Card
---@field suit poker_game.SUIT
---@field rank poker_game.RANK

---@class poker_game.state.Deck
---@field card_back string: the card back on top of the deck

---@class poker_game.state.Hand
---@field cards poker_game.Card[]: cards in the players hand

---@class poker_game.state.Core
---@field deck poker_game.state.Deck: the state of the deck
---@field hand poker_game.state.Hand: the state of the player's hand

---@param suit poker_game.SUIT
---@param rank poker_game.RANK
---@return poker_game.Card
function M.poker_card(suit, rank)
	return {
		suit = suit,
		rank = rank,
	}
end

---@param state poker_game.state.Core
---@param action poker_game.state.ACTION
---@return poker_game.state.Core
function M.reduce(state, action)
	if action == nil then
		return state
	end
	if action.type == "DRAW_CARD" then
		return {
			deck = state.deck,
			hand = {
				cards = state.hand.cards + action.value,
			},
		}
	end

	return state
end

return M
