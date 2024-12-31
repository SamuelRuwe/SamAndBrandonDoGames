local M = {}

---@param state poker.state.Core
---@param action poker.state.ACTION
---@return poker.state.Core
function M.reduce(state, action)
  if action == nil then
    return state
  end
  if action.type == "[GAME] NEW_GAME" then
    return {
      is_paused = false,
      --- will remove this later when game isn't instantly started
      game_state = {
        deck = {
          card_back = "",
          deck_cards = {},
        },
        hand = {
          cards = {},
        },
      },
    }
  elseif action.type == "[DECK] DRAW_CARD" then
    if state.game_state == nil then
      return state
    end
    return {
      is_paused = false,
      game_state = {
        deck = {
          deck_cards = (function()
            local t = state.game_state.deck.deck_cards
            table.insert(t, action.value)
            return t
          end)(),
        },
        hand = {
          cards = (function()
            local t = state.game_state.hand.cards
            table.insert(t, action.value)
            return t
          end)(),
        },
      },
    }
  end
  return state
end

return M
