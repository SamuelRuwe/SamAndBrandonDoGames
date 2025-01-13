local M = {}

local action_types = require("state.highcard.action").action_types
local phases = require("state.highcard.phases")
local selectors = require("state.highcard.selector")
local fp = require("utils.fp")

function M.handle_action(state, action)
  if action.type == action_types.DRAW_CARD then
    local drawn = table.remove(state.deck)
    return {
      player = {
        hand = fp.append(selectors.selectPlayerHand(state), drawn),
      },
      cpu = state.cpu,
      deck = state.deck,
      phase = phases.cpu_turn,
    }
  end
  return state
end

return M
