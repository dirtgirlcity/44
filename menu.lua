local menuClass = { }
menuClass.__index = menuClass

local util = require('util')

local function Menu(spec)
  local instance = {
    name = spec.name,
    x = spec.x,
    y = spec.y,
    w = spec.w,
    h = spec.h,
    r = 4,
    c = 1,
    items = { }
  }
  setmetatable(instance, menuClass)
  return instance
end

function menuClass:draw()
  love.graphics.setColor(50, 50, 0)
  love.graphics.rectangle( 'fill', self.x, self.y, self.w, self.h )
  for _, item in ipairs(self.items) do
    item:draw()
  end
end

function menuClass:mousepressed(x, y)
--  for _, item in ipairs(self.items) do
 --   item:mousepressed(x, y)
 -- end
end

return Menu
