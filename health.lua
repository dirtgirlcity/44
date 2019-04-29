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

function healthClass:age()
  if self.pts > 90 then
    love.graphics.setColor(0, 10, 50)
  end
  if self.pts <= 90 and self.pts > 80 then
    love.graphics.setColor(0, 20, 60)
  end
  if self.pts <= 80 and self.pts > 70 then
    love.graphics.setColor(0, 30, 70)
  end
  if self.pts <= 70 and self.pts > 60 then
    love.graphics.setColor(0, 40, 80)
  end
  if self.pts <= 60 and self.pts > 50 then
    love.graphics.setColor(0, 50, 90)
  end
  if self.pts <= 50 and self.pts > 40 then
    love.graphics.setColor(0, 60, 100)
  end
  if self.pts <= 40 and self.pts > 30 then
    love.graphics.setColor(0, 70, 110)
  end
  if self.pts <= 30 and self.pts > 20 then
    love.graphics.setColor(0, 80, 120)
  end
  if self.pts <= 20 and self.pts > 10 then
    love.graphics.setColor(0, 90, 130)
  end
  if self.pts <= 10 and self.pts > 0 then
    love.graphics.setColor(0, 100, 140)
  end
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
