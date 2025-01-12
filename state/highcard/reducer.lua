local M = {}
local selectors = require("state.highcard.selector")

function M.reduce(state, action)
  local phase = selectors.selectPhase(state)
  return require("state.highcard.states." .. phase).handle_action(state, action)
end

return M
