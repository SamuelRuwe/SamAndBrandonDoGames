local M = {}
local prop = require("utils.fp").prop

---@class poker.card.Card
---@field suit poker.card.SUIT: suit of the card
---@field rank poker.card.RANK: rank of the card
---@field rank poker.card.isStationary: whether card is being dragged


---@enum poker.card.SUIT
M.SUIT = {
  hearts = "hearts",
  spades = "spades",
  diamonds = "diamonds",
  clubs = "clubs",
}

---@enum poker.card.RANK
M.RANK = {
  ace = "ace",
  king = "king",
  queen = "queen",
  jack = "jack",
  ten = "10",
  nine = "9",
  eight = "8",
  seven = "7",
  six = "6",
  five = "5",
  four = "4",
  three = "3",
  two = "2",
}

---@param suit poker.card.SUIT
---@param rank poker.card.RANK
---@return poker.card.Card
function M.poker_card(suit, rank, isStationary)
  if isStationary then
      isStationary = true
  else
    isStationary = false
  end
  return {
    suit = suit,
    rank = rank,
    isStationary = isStationary
  }
end

---@return function: poker.card.Card -> poker.card.SUIT
M.suit = prop("suit")

---@return function: poker.card.Card -> poker.card.RANK
M.rank = prop("rank")

---@return function: poker.card.Card -> poker.card.RANK
M.isStationary = prop("isStationary")

return M
