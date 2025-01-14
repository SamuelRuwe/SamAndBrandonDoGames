local M = {}

---@param k string
---@return function: t :: Table : t -> t[k]
function M.prop(k)
  return function(t)
    return t[k]
  end
end

---@param f function: x -> y
---@return function: [x] -> [y]
function M.map(f)
  return function(t)
    local ret = {}
    for k, v in pairs(t) do
      ret[k] = f(v)
    end
    return ret
  end
end

---@param p function: a -> Bool
---@return function: [a] -> [a]
function M.filter(p)
  return function(t)
    local ret = {}
    for _, v in pairs(t) do
      if p(v) then
        table.insert(ret, v)
      end
    end
    return ret
  end
end

---@param f function: (b, a) -> b
---@param acc any: the initial accumulator state
---@return function: [a] -> b
function M.reduce(f, acc)
  local ret = acc
  return function(t)
    for _, v in ipairs(t) do
      ret = f(ret, v)
    end
    return ret
  end
end

--- @vararg function: (y -> z), (x -> y), ..., (a -> b)
--- @return function: [a] -> [z]
function M.compose(...)
  local fns = { ... }
  local function recurse(i, ...)
    if i == 1 then
      return fns[i](...)
    end
    return recurse(i - 1, fns[i](...))
  end

  return function(...)
    return recurse(#fns, ...)
  end
end

---@param list table: the input list
---@param n number: the number of lines from the end of the logs you want returned
---@return table: the list with the last n elements from the input list
function M.tail(list, n)
  local result = {}
  local lower_bound = math.max(1, #list - n + 1)
  for i = lower_bound, #list do
    table.insert(result, list[i])
  end
  return result
end

return M
