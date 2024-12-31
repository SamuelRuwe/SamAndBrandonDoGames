---@diagnostic disable: undefined-field

local eq = assert.are.same
local core = require("state.core")
local create_action = require("state.action").create_action
local c = require("poker.card")
local rank = c.RANK
local suit = c.SUIT

describe("core", function()
  it("should register a handler", function()
    local res = nil
    local function cb(card)
      res = card
    end

    core.on_action(core.action_types.DRAW_CARD, cb)
    local card = { suit = c.SUIT.clubs, rank = c.RANK.ace }

    local action = core.actions.DRAW_CARD(card)
    core.handle_action(action)

    eq(card.rank, res.rank)
    eq(card.suit, res.suit)
  end)
end)
