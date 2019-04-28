local shelfClass = { }
shelfClass.__index = shelfClass

local util = require('util')

local function Shelf(spec)
  local instance = {
    name = spec.name,
    x = spec.x,
    y = spec.y,
    w = spec.w,
    h = spec.h,
    r = 4,
    c = 3,
    items = util.loadItems(10)
  }
  setmetatable(instance, shelfClass)
  util.organizeItems(instance)
  return instance
end

function shelfClass:draw()
  love.graphics.setColor(0, 50, 0)
  love.graphics.rectangle( 'fill', self.x, self.y, self.w, self.h )
  for _, item in ipairs(self.items) do
    item:draw()
  end
end

function shelfClass:mousepressed(x, y)
  for _, item in ipairs(self.items) do
    local isTouched = item:isTouched(x, y)
    if isTouched then
      self:move(item)
    end
  end
end

function shelfClass:move(item)
  if state.workbench:hasSpace() then
    item:remove(self)
    item:insert(state.workbench)
    item:setLastContainer(self)
  end
end

function shelfClass:hasSpace()
  return #self.items < (self.r*self.c)
end

return Shelf
