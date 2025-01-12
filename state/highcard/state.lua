local M = {}
local phases = require("state.highcard.phases")

local initial_state = {
  player = {
    hand = {},
  },
  cpu = {
    hand = {},
  },
  deck = {},
  phase = phases.initial,
}

M.state = initial_state

return M
