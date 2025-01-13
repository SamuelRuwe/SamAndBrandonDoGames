local eq = assert.are.same
local state = require("state.highcard.state")
local reducer = require("state.highcard.reducer")
local actions = require("state.highcard.action")
local selectors = require("state.highcard.selector")
local phases = require("state.highcard.phases")

describe("high card game state", function()
  it("should set initial state", function()
    local game_state = state.state
    eq(0, #game_state.deck)
    eq(0, #game_state.player.hand)
    eq(0, #game_state.cpu.hand)
  end)

  it("should create a deck that has 52 cards", function()
    local game_state = state.state
    local next_state = reducer.reduce(game_state, actions.new_game())
    eq(52, #next_state.deck)
  end)

  it("should add a card to the players hand", function()
    local game_state = state.state
    local next_state = reducer.reduce(game_state, actions.new_game())
    local player_turn_state = reducer.reduce(next_state, actions.draw_card())
    eq(1, #player_turn_state.player.hand)
    eq(51, selectors.selectDeckSize(player_turn_state))
    eq(phases.cpu_turn, selectors.selectPhase(player_turn_state))
  end)

  it("should add a card to the cpu's hand", function()
    local game_state = state.state
    local next_state = reducer.reduce(game_state, actions.new_game())
    local player_turn_state = reducer.reduce(next_state, actions.draw_card())
    local cpu_turn_state = reducer.reduce(player_turn_state, actions.draw_card())
    eq(1, selectors.selectCPUHandSize(cpu_turn_state))
    eq(50, selectors.selectDeckSize(cpu_turn_state))
    eq(phases.game_over, selectors.selectPhase(cpu_turn_state))
  end)
end)
