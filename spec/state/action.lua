---@diagnostic disable: undefined-field

local eq = assert.are.same
local create_action = require("state.action").create_action

describe("poker.state.ACTION", function()
  it("should create a new action", function()
    local action = create_action("originator", "event", "")
    eq({ table = "great" }, { table = "great" })
  end)
end)
