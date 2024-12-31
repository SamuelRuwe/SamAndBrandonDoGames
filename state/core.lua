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

--- duplicating for the moment
M.initial_state = {
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

return M
