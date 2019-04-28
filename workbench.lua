local workbenchClass = { }
workbenchClass.__index = workbenchClass

local function Workbench(spec)
  local instance = {
    name = spec.name,
    x = spec.x,
    y = spec.y,
    w = spec.w,
    h = spec.h,
    r = 1,
    c = 4,
    items = { }
  }
  setmetatable(instance, workbenchClass)
  return instance
end

function workbenchClass:draw()
  love.graphics.setColor(50, 0, 0)
  love.graphics.rectangle( 'fill', self.x, self.y, self.w, self.h )
  for _, item in ipairs(self.items) do
    item:draw()
  end
end

function workbenchClass:mousepressed(x, y)
  for _, item in ipairs(self.items) do
    local isClicked = item:isClicked(x, y)
    if isClicked then
      self:move(item)
    end
  end
end

function workbenchClass:move(item)
  if item.lastContainer:hasSpace() then
    item:remove(self)
    state.health:restore(item.price)
    item:insert(item.lastContainer)
    item:setLastContainer(nil)
  end
end

function workbenchClass:hasSpace()
  return #self.items < (self.r*self.c)
end

function workbenchClass:clear()
  self.items = { }
end

return Workbench
