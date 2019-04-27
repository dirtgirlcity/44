local infoClass = { }
infoClass.__index = infoClass

local function Info(spec)
  local instance = {
    x = spec.x,
    y = spec.y,
    w = spec.w,
    h = spec.h
  }
  setmetatable(instance, infoClass)
  return instance
end

function infoClass:draw()
  love.graphics.setColor(50, 0, 50)
  love.graphics.rectangle( 'fill', self.x, self.y, self.w, self.h )
end

return Info
