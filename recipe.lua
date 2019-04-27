local recipeClass = { }
recipeClass.__index = recipeClass

local function Recipe(spec)
  local instance = {
    x = spec.x,
    y = spec.y,
    w = spec.w,
    h = spec.h
  }
  setmetatable(instance, recipeClass)
  return instance
end

function recipeClass:draw()
  love.graphics.setColor(100, 100, 100)
  love.graphics.rectangle ( 'fill', self.x, self.y, self.w, self.h )
end

return Recipe
