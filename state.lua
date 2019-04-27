local stateClass = { }
stateClass.__index = stateClass

local function State()
  local instance = {
    entities = { },
    width = 1920/4,
    height = 1080/4
  }
  setmetatable(instance, stateClass)
  return instance
end

return State
