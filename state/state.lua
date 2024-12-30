local M = {}

---@class poker.state.Deck
---@field card_back string: the card back on top of the deck
---@field deck_cards poker.card.Card[]: cards remaining in deck available to draw

---@class poker.state.Hand
---@field cards poker.card.Card[]: cards in the players hand

---@class poker.state.Core

---@class poker.state.Game
---@field deck poker.state.Deck: the state of the deck
---@field hand poker.state.Hand: the state of the player's hand

---@class poker.state.Core
---@field is_paused boolean
---@field game_state poker.state.Game | nil
M.initial_state = {
  is_paused = false,
}

return M
