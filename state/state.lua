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

return M
