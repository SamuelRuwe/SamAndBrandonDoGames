local M = {}

M.action_types = {
  NEW_GAME = "[HIGH_CARD] NEW_GAME",
  DRAW_CARD = "[HIGH_CARD] DRAW_CARD",
  END_GAME = "[HIGH_CARD] END_GAME",
}

function M.new_game()
  return { type = M.action_types.NEW_GAME }
end

--- Drawing a card is the composition of removing a card from the deck and adding a card to a players hand
function M.draw_card()
  return { type = M.action_types.DRAW_CARD }
end

function M.calculate_winner()
  return { type = M.action_types.END_GAME }
end

return M
