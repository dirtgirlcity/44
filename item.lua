local itemClass = { }
itemClass.__index = itemClass

local function Item(spec)
--  local img = love.graphics.newImage(spec.image)
  --local w, h = img:getDimensions()
  local instance = {
    x = spec.x,
    y = spec.y,
    name = spec.name,
    --img = img,
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
end

return Item
