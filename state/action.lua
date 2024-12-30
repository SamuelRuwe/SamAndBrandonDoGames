local M = {}

---@class poker.state.ACTION<T>
---@field type string: the type of the action
---@field value any: the value of the action

---@param originator string: where the event originated from
---@param event string: what event occurred
---@param value any: the value of the event
function M.create_action(originator, event, value)
  return {
    type = "[" .. originator .. "] " .. event,
    value = value,
  }
end

return M
