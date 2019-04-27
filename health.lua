local healthClass = { }
healthClass.__index = healthClass

local function Health(spec)
  local instance = {
    x = spec.x,
    y = spec.y,
    w = spec.w,
    h = spec.h
  }
  setmetatable(instance, healthClass)
  return instance
end

function healthClass:draw()
  love.graphics.setColor(0, 50, 50)
  love.graphics.rectangle( 'fill', self.x, self.y, self.w, self.h )
end

return Health
