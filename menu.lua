local menuClass = { }
menuClass.__index = menuClass

local function Menu(spec)
  local instance = {
    x = spec.x,
    y = spec.y,
    w = spec.w,
    h = spec.h
  }
  setmetatable(instance, menuClass)
  return instance
end

function menuClass:draw()
  love.graphics.setColor(50, 50, 0)
  love.graphics.rectangle( 'fill', self.x, self.y, self.w, self.h )
end

return Menu
