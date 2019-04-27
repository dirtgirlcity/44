local shelfClass = { }
shelfClass.__index = shelfClass

local function Shelf(spec)
  local instance = {
    x = spec.x,
    y = spec.y,
    w = spec.w,
    h = spec.h
  }
  setmetatable(instance, shelfClass)
  return instance
end

function shelfClass:draw()
  love.graphics.setColor(0, 50, 0)
  love.graphics.rectangle( 'fill', self.x, self.y, self.w, self.h )
end

return Shelf
