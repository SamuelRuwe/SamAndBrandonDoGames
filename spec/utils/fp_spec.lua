---@diagnostic disable: undefined-field

local eq = assert.are.same
local fp = require("utils.fp")
local map = fp.map
local filter = fp.filter
local compose = fp.compose
local prop = fp.prop
local reduce = fp.reduce

describe("fp utils", function()
  it("map a list", function()
    local list = { 1, 2, 3 }
    local expected = { 2, 4, 6 }
    local function timestwo(x)
      return x * 2
    end
    local result = map(timestwo)(list)
    eq(expected, result)
  end)

  it("map a record", function()
    local record = { a = 1, b = 2, c = 3 }
    local expected = { a = 2, b = 4, c = 6 }
    local function timestwo(x)
      return x * 2
    end
    local result = map(timestwo)(record)
    eq(expected, result)
  end)

  it("filter a list", function()
    local list = { 1, 2, 3 }
    local expected = { 2 }
    local function evens(x)
      return x % 2 == 0
    end
    local result = filter(evens)(list)
    eq(expected, result)
  end)

  it("should be composable", function()
    local list = { 1, 2, 3 }
    local expected = { 2, 6 }
    local function timestwo(x)
      return x * 2
    end

    local function odds(x)
      return x % 2 ~= 0
    end
    local composed = compose(map(timestwo), filter(odds))
    local result = composed(list)
    eq(expected, result)
  end)

  it("should get a property", function()
    local card = { rank = 1 }
    local result = prop("rank")(card)
    eq(1, result)
  end)

  it("should reduce", function()
    local list = { 1, 2, 3, 4 }
    local function sum(acc, next)
      return acc + next
    end

    eq(10, reduce(sum, 0)(list))
  end)
end)
