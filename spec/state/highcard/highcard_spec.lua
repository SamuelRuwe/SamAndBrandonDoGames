local eq = assert.are.same
local state = require("state.highcard.state")
local reducer = require("state.highcard.reducer")
local actions = require("state.highcard.action")

describe("high card game state", function()
  it("should set initial state", function()
    local game_state = state.state
    eq(0, #game_state.deck)
    eq(0, #game_state.player.hand)
    eq(0, #game_state.cpu.hand)
  end)

  it("should bite me", function()
    local game_state = state.state
    local next_state = reducer.reduce(game_state, actions.new_game())
    -- eq(52, #next_state.deck)
  end)
end)
