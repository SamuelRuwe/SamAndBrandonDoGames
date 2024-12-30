local M = {}
local cards = require("poker.card")

---@return poker.card.Card[]
function M.deckgen()
  local deck = {}
  for _, rank in pairs(cards.RANK) do
    for _, suit in pairs(cards.SUIT) do
      table.insert(deck, cards.poker_card(suit, rank))
    end
  end
  return deck
end
return M
