local M = {}

---@type poker.state.Core
M.initial_state = {
  deck = {
    card_back = "",
    deck_cards = {},
  },
  hand = {
    cards = {},
  },
}

---@class poker.state.ACTION<T>
---@field type string: the type of the action
---@field value any: the value of the action

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

---@param state poker.state.Core
---@param action poker.state.ACTION
---@return poker.state.Core
function M.reduce(state, action)
  if action == nil then
    return state
  end
  if action.type == "[GAME] NEW_GAME" then
    return {
      deck = {
        card_back = "",
        deck_cards = {},
      },
      hand = {
        cards = {},
      },
    }
  elseif action.type == "[DECK] DRAW_CARD" then
    return {
      deck = {
        deck_cards = (function()
          local t = state.deck.deck_cards
          table.insert(t, action.value)
          return t
        end)(),
      },
      hand = {
        cards = (function()
          local t = state.hand.cards
          table.insert(t, action.value)
          return t
        end)(),
      },
    }
  end
  return state
end

return M
