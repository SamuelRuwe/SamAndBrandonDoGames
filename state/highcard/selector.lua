local M = {}

function M.selectDeck(state)
  return state.deck
end

function M.selectDeckSize(state)
  return #M.selectDeck(state)
end

function M.selectPhase(state)
  return state.phase
end

function M.selectPlayer(state)
  return state.player
end

function M.selectPlayerHand(state)
  return M.selectPlayer(state).hand
end

function M.selectPlayerHandSize(state)
  return #M.selectPlayerHand(state)
end

function M.selectCPU(state)
  return state.cpu
end

function M.selectCPUHand(state)
  return M.selectCPU(state).hand
end

function M.selectCPUHandSize(state)
  return #M.selectCPUHand(state)
end

return M
