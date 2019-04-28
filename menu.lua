local menuClass = { }
menuClass.__index = menuClass

local levels = require('catalog')
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
    items = util.loadItems(3)
  }
  setmetatable(instance, menuClass)
  util.organizeItems(instance)
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
  for _, item in ipairs(self.items) do
    local isClicked = item:isClicked(x, y)
    if isClicked then
      self:move(item)
    end
  end
end

function menuClass:move(item)
  if state.workbench:hasSpace() then
    state.health:sacrifice(item.price)
    item:remove(self)
    item:insert(state.workbench)
    item:setLastContainer(self)
  end
end

function menuClass:hasSpace()
  return #self.items < (self.r*self.c)
end

function menuClass:loadItems(level)
  self.items = levels[level].menuItems
end

return Menu
