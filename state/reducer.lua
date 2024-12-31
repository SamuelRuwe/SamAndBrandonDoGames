local M = {}
local standard_deck = require("poker.deck").deckgen

local function handle_draw_card(state)
  if state.game_state == nil then
    return state
  end
  if #state.game_state.deck.deck_cards == 0 then
    return state
  end
  local drawn_card = table.remove(state.game_state.deck.deck_cards)
  table.insert(state.game_state.hand.cards, drawn_card)
  return {
    is_paused = false,
    game_state = {
      deck = {
        card_back = "card-back",
        deck_cards = state.game_state.deck.deck_cards,
      },
      hand = {
        cards = state.game_state.hand.cards,
      },
    },
  }
end

local function handle_new_game(state)
  return {
    is_paused = false,
    game_state = {
      deck = {
        card_back = "card-back",
        deck_cards = standard_deck(),
      },
      hand = {
        cards = {},
      },
    },
  }
end

---@param state poker.state.Core
---@param action poker.state.ACTION
---@return poker.state.Core
function M.reduce(state, action)
  if action == nil then
    return state
  end
  if action.type == "[GAME] NEW_GAME" then
    return handle_new_game(state)
  elseif action.type == "[DECK] DRAW_CARD" then
    return handle_draw_card(state)
  end
  return state
end

return M
