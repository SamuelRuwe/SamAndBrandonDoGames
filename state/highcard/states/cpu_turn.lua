local M = {}

local phases = require("state.highcard.phases")
local selectors = require("state.highcard.selector")
local action_types = require("state.highcard.action").action_types

function M.handle_action(state, action)
  if action.type == action_types.DRAW_CARD then
    local drawn = table.remove(state.deck)
    local cpu_hand = table.insert(selectors.selectCPUHand(state), drawn)
    Logger.log("deck size " .. #state.deck)
    return {
      player = state.player,
      cpu = {
        hand = cpu_hand,
      },
      deck = state.deck,
      phase = phases.game_over,
    }
  end
  return state
end

return M
