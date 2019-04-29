local playerClass = { }
playerClass.__index = playerClass

local state = require('state')

local function Player(spec)
  local instance = {
    x = spec.x,
    y = spec.y,
    w = spec.w,
    h = spec.h
  }
  setmetatable(instance, playerClass)
  return instance
end

function playerClass:draw()
  state.health:age()
  love.graphics.rectangle( 'fill', self.x, self.y, self.w, self.h )
end

return Player
