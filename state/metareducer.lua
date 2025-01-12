local M = {}

function M.reduce(reducer)
  return function(state, action)
    Logger.log(action.type)
    local next_state = reducer(state, action)
    return next_state
  end
end
return M
