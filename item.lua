local itemClass = { }
itemClass.__index = itemClass

local util = require('util')

local function Item(spec)
  --local img = love.graphics.newImage(spec.image)
  --local w, h = img:getDimensions()
  local instance = {
    name = spec.name,
    x = spec.x,
    y = spec.y,
    desc = spec.desc,
    --img = img,
    price = spec.price,
    w = 10,
    h = 10,
    currentPosition = spec.currentPosition,
    lastPosition = spec.lastPosition
  }
  setmetatable(instance, itemClass)
  return instance
end

function itemClass:draw()
  love.graphics.setColor(50, 50, 50)
  love.graphics.rectangle( 'fill', self.x, self.y, self.w, self.h )
end

function itemClass:isTouched(x, y)
  if ( x >= self.x and x <= self.x + self.w )
    and ( y > self.y and y < self.y + self.h ) then
    print("you got me!")
    print("x: ", x)
    print("y: ", y)
    return true
  else
    return false
  end
end

function itemClass:move()
  if self.currentPosition.name == "workbench" then
    --self.currentPosition = self.lastPosition
    self:insert(self.lastPosition.name)
    self:remove(self.currentPosition.name)
  end
  if self.currentPosition.name == "menu" or self.currentPosition.name == "shelf" then
    --self.lastPosition = self.currentPosition
    self:insert("workbench")
    self:remove(self.lastPosition.name)
  end
end

function itemClass:insert(where)
  for _, entity in ipairs(state.entities) do
    if entity.name == where then
      table.insert(entity.items, self)
      util.organizeItems(entity)
      return
    end
  end
end

function itemClass:remove(where)
  for _, entity in ipairs(state.entities) do
    if entity.name == where then
      for idx, i in ipairs(entity.items) do
        if i == self then
          table.remove(entity.items, idx, i)
        end
      end
    end
  end
end

return Item
