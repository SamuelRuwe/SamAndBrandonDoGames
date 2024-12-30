local M = {}
local prop = require("utils.fp").prop

---@class poker.card.Card
---@field suit poker.card.SUIT: suit of the card
---@field rank poker.card.RANK: rank of the card

---@enum poker.card.SUIT
M.SUIT = {
  hearts = 0,
  spades = 1,
  diamonds = 2,
  clubs = 3,
}

---@enum poker.card.RANK
M.RANK = {
  ace = 14,
  king = 13,
  queen = 12,
  jack = 11,
  ten = 10,
  nine = 9,
  eight = 8,
  seven = 7,
  six = 6,
  five = 5,
  four = 4,
  three = 3,
  two = 2,
}

---@param suit poker.card.SUIT
---@param rank poker.card.RANK
---@return poker.card.Card
function M.poker_card(suit, rank)
  return {
    suit = suit,
    rank = rank,
  }
end

---@return function: poker.card.Card -> poker.card.SUIT
M.suit = prop("suit")

---@return function: poker.card.Card -> poker.card.RANK
M.rank = prop("rank")

return M
