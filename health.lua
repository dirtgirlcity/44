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
  love.graphics.setColor(200, 200, 200)
  love.graphics.rectangle( 'fill', self.x, self.y, self.pts, self.h )
end

function healthClass:restore(years)
  if years ~= nil then
    self.pts = self.pts + years
  end
end

function healthClass:sacrifice(years)
  if years ~= nil then
    self.pts = self.pts - years
  end
end

function healthClass:isGone()
  return self.pts <= 0
end

return Health
