local healthClass = { }
healthClass.__index = healthClass

local function Health(spec)
  local max = 100
  local instance = {
    x = spec.x,
    y = spec.y,
    w = spec.w,
    h = spec.h,
    pts = max
  }
  setmetatable(instance, healthClass)
  return instance
end

function healthClass:draw()
  love.graphics.setColor(0, 50, 50)
  love.graphics.rectangle( 'fill', self.x, self.y, self.w, self.h )
end

function healthClass:isGone()
  if self.pts <= 0 then
    return true
  else
    return false
  end
end

return Health
