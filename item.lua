local itemClass = { }
itemClass.__index = itemClass

local util = require('util')

local function Item(spec)
  local instance = {
    name = spec.name,
    x = spec.x,
    y = spec.y,
    desc = spec.desc,
    price = spec.price,
    w = 10,
    h = 10
  }
  setmetatable(instance, itemClass)
  return instance
end

function itemClass:draw()
  love.graphics.setColor(50, 50, 50)
  love.graphics.rectangle( 'fill', self.x, self.y, self.w, self.h )
  love.graphics.setColor(0, 0, 0)
  love.graphics.print(self.desc, self.x, self.y)
end

function itemClass:isTouched(x, y)
  if ( x >= self.x and x <= self.x + self.w )
    and ( y > self.y and y < self.y + self.h ) then
    return true
  else
    return false
  end
end

function itemClass:insert(container)
  table.insert(container.items, self)
  util.organizeItems(container)
end

function itemClass:remove(container)
  for idx, i in ipairs(container.items) do
    if i == self then
      table.remove(container.items, idx)
    end
  end
end

return Item
