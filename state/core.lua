local M = {}

---@param value any
---@return poker.state.ACTION
function M.draw_card(value)
  return { type = "[DECK] DRAW_CARD", value = value }
end

---@param value any
---@return poker.state.ACTION
function M.new_game(value)
  return { type = "[GAME] NEW_GAME", value = value }
end

return M
