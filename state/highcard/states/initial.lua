local M = {}

local create_deck = require("poker.deck").deckgen
local action_types = require("state.highcard.action").action_types
local phases = require("state.highcard.phases")

function M.can(action)
  return action.type == action_types.NEW_GAME
end

function M.handle_action(state, action)
  if action.type == action_types.NEW_GAME then
    return {
      player = state.player,
      cpu = state.cpu,
      deck = create_deck(),
      phase = phases.player_turn,
    }
  end
  return state
end

return M
