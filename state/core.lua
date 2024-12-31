local M = {}

---@enum poker.state.action_types
M.action_types = {
  DRAW_CARD = "[DECK] DRAW_CARD",
  NEW_GAME = "[GAME] NEW_GAME",
}

---@param v any
---@return poker.state.ACTION
local function draw_card(v)
  return { type = M.action_types.DRAW_CARD, value = v }
end

---@param value string: the type of game to be played
---@return poker.state.ACTION
local function new_game(v)
  return { type = M.action_types.NEW_GAME, value = v }
end

M.actions = {
  DRAW_CARD = draw_card,
  NEW_GAME = new_game,
}

local callbacks = {}

---@param action poker.state.action_types: the type of action to listen for
---@param cb function: the callback executed with the value of the action
function M.on_action(action, cb)
  callbacks[action] = callbacks[action] or {}
  table.insert(callbacks[action], cb)
end

function M.handle_action(action)
  for _, cb in ipairs(callbacks[action.type]) do
    cb(action.value)
  end
end

--- duplicating for the moment
M.initial_state = {
  is_paused = false,
  --- will remove this later when game isn't instantly started
  game_state = {
    deck = {
      card_back = "",
      deck_cards = {},
    },
    hand = {
      cards = {},
    },
  },
}

return M
