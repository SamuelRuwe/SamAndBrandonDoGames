local M = {}

---@param value any
---@return poker.state.ACTION
function M.draw_card(value)
  return { type = "[DECK] DRAW_CARD", value = value }
end

---@param value any
---@return poker.state.ACTION
function M.new_game(value)
  return { type = "[GAME] NEW_GAME", value = value }
end

---@class poker.state.Deck
---@field card_back string: the card back on top of the deck
---@field deck_cards poker.card.Card[]: cards remaining in deck available to draw

---@class poker.state.Hand
---@field cards poker.card.Card[]: cards in the players hand

---@class poker.state.Core
---@field deck poker.state.Deck: the state of the deck
---@field hand poker.state.Hand: the state of the player's hand

return M
