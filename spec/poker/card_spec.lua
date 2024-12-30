---@diagnostic disable: undefined-field

local eq = assert.are.same
local deck = require("poker.deck")
local c = require("poker.card")
local rank = c.RANK
local suit = c.SUIT

describe("poker deck", function()
  it("should contain 52 cards", function()
    eq(#deck.deckgen(), 52)
  end)

  it("should contain 13 of each suit", function()
    local d = deck.deckgen()
    local clubs = {}
    local diamonds = {}
    local spades = {}
    local hearts = {}
    for _, card in pairs(d) do
      if card.suit == suit.clubs then
        table.insert(clubs, card)
      elseif card.suit == suit.diamonds then
        table.insert(diamonds, card)
      elseif card.suit == suit.hearts then
        table.insert(hearts, card)
      elseif card.suit == suit.spades then
        table.insert(spades, card)
      end
    end

    eq(#clubs, 13)
    eq(#diamonds, 13)
    eq(#spades, 13)
    eq(#hearts, 13)
  end)

  it("should contain 4 of each rank", function()
    local d = deck.deckgen()
    local twos = {}
    local threes = {}
    local fours = {}
    local fives = {}
    local sixes = {}
    local sevens = {}
    local eights = {}
    local nines = {}
    local tens = {}
    local jacks = {}
    local queens = {}
    local kings = {}
    local aces = {}

    for _, card in pairs(d) do
      if card.rank == rank.two then
        table.insert(twos, card)
      elseif card.rank == rank.three then
        table.insert(threes, card)
      elseif card.rank == rank.four then
        table.insert(fours, card)
      elseif card.rank == rank.five then
        table.insert(fives, card)
      elseif card.rank == rank.six then
        table.insert(sixes, card)
      elseif card.rank == rank.seven then
        table.insert(sevens, card)
      elseif card.rank == rank.eight then
        table.insert(eights, card)
      elseif card.rank == rank.nine then
        table.insert(nines, card)
      elseif card.rank == rank.ten then
        table.insert(tens, card)
      elseif card.rank == rank.jack then
        table.insert(jacks, card)
      elseif card.rank == rank.queen then
        table.insert(queens, card)
      elseif card.rank == rank.king then
        table.insert(kings, card)
      elseif card.rank == rank.ace then
        table.insert(aces, card)
      end
    end

    eq(#twos, 4)
    eq(#threes, 4)
    eq(#fours, 4)
    eq(#fives, 4)
    eq(#sixes, 4)
    eq(#sevens, 4)
    eq(#eights, 4)
    eq(#nines, 4)
    eq(#tens, 4)
    eq(#jacks, 4)
    eq(#queens, 4)
    eq(#kings, 4)
    eq(#aces, 4)
  end)
end)
