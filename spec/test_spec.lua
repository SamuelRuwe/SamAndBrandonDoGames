---@diagnostic disable: undefined-field

local eq = assert.are.same

describe("Busted unit testing framework", function()
  describe("should be awesome", function()
    it("should be easy to use", function() end)

    it("should have lots of features", function()
      eq({ table = "great" }, { table = "great" })
    end)
  end)
end)
