local workbenchClass = { }
workbenchClass.__index = workbenchClass

local util = require('util')

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
    local isTouched = item:isTouched(x, y)
    if isTouched then
      self:move(item)
    end
  end
end

function workbenchClass:move(item)
  item:remove(self)
  --item:insert(state.workbench)
  util.organizeItems(self)
end

return Workbench
