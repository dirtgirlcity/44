local recipeClass = { }
recipeClass.__index = recipeClass

local levels = require('catalog')
local util = require('util')

local function Recipe(spec)
  local instance = {
    name = spec.name,
    x = spec.x,
    y = spec.y,
    w = spec.w,
    h = spec.h,
    level = spec.level,
    text = levels[spec.level].text,
    items = levels[spec.level].recipeItems
  }
  setmetatable(instance, recipeClass)
  return instance
end

function recipeClass:draw()
  love.graphics.setColor(100, 100, 100)
  love.graphics.rectangle ( 'fill', self.x, self.y, self.w, self.h )
  love.graphics.setColor(0, 0, 0)
  love.graphics.print(self.text, self.x, self.y)
end

function recipeClass:mousepressed(x, y)
  local isCommitClick = self:commitClick(x, y)
  if isCommitClick then
    local complete = self:isComplete()
    if complete then
      self:nextLevel()
    end
  end
end

function recipeClass:commitClick(x, y)
  return (x >= self.x and x <= self.x + self.w and y >= self.y and y <= self.y + self.h)
end

function recipeClass:isComplete()
  return util.isEqual(util.getItemKeys(self.items), util.getItemKeys(state.workbench.items))
end

function recipeClass:nextLevel()
  self:rewardToShelf()
  self.level = self.level + 1
  state.workbench:clear()
  self:setText()
  self:loadMenu()
end

function recipeClass:setText()
  self.text = levels[self.level].text
end

function recipeClass:loadMenu()
  state.menu:loadItems(self.level)
  util.organizeItems(state.menu)
end

function recipeClass:rewardToShelf()
  table.insert(state.shelf.items, levels[self.level].rewardItems[1])
  util.organizeItems(state.shelf)
end

return Recipe
