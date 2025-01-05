local M = {}

function M.reduce(reducer)
  return function(state, action)
    print("Recieved action: " .. action.type)
    local next_state = reducer(state, action)
    return next_state
  end
end
return M
