local M = {}

local action_types = require("state.highcard.action").action_types
local phases = require("state.highcard.phases")
local selectors = require("state.highcard.selector")

function M.can(next_state)
  return false
end

function M.handle_action(state, action)
  if action.type == action_types.DRAW_CARD then
    local drawn = table.remove(state.deck)
    local player_hand = table.insert(selectors.selectPlayerHand(state), drawn)
    Logger.log("deck size " .. #state.deck)
    return {
      player = {
        hand = player_hand,
      },
      cpu = state.cpu,
      deck = state.deck,
      phase = phases.cpu_turn,
    }
  end
  return state
end

return M
