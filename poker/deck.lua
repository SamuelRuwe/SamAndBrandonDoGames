local M = {}
local cards = require("poker.card")

local function recurse(random_deck, remaining_cards)
  if #remaining_cards == 0 then
    return random_deck
  end
  local next = math.random(#remaining_cards)
  local card = table.remove(remaining_cards, next)
  table.insert(random_deck, card)
  return recurse(random_deck, remaining_cards)
end

---@return poker.card.Card[]
function M.deckgen(seed)
  seed = seed or os.time()
  math.randomseed(seed)
  local deck = {}
  for _, rank in pairs(cards.RANK) do
    for _, suit in pairs(cards.SUIT) do
      table.insert(deck, cards.poker_card(suit, rank, true))
    end
  end
  return recurse({}, deck)
end

return M
