local workbenchClass = { }
workbenchClass.__index = workbenchClass

local function Workbench(spec)
  local instance = {
    x = spec.x,
    y = spec.y,
    w = spec.w,
    h = spec.h
  }
  setmetatable(instance, workbenchClass)
  return instance
end

function workbenchClass:draw()
  love.graphics.setColor(50, 0, 0)
  love.graphics.rectangle( 'fill', self.x, self.y, self.w, self.h )
end

return Workbench
