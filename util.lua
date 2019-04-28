local util = { }

function util.loadItems(num)
  local items = { }
  local Item = require('item')

  for i = 1, num do
    local item = Item({
      name = "item",
      desc =  tostring(i),
      price = 10,
    })
    table.insert(items, item)
  end

  return items
end

function util.organizeItems(container)
  local xBase, yBase, numRows, numCols, items

  xBase = container.x
  yBase = container.y
  numRows = container.r
  numCols = container.c
  items = container.items

  for row = 1, numRows do
    for col = 1, numCols do
      for idx, i in ipairs(items) do
        if idx == ((row-1) * numCols) + col then
          i.x = xBase + col * 15
          i.y = yBase + row * 20
        end
      end
    end
  end
end

function util.translateCoordinates(x, y)
  local ww, hw = love.graphics.getDimensions()
  local wg = state.width
  local hg = state.height
  local gx = x * (wg/ww)
  local gy = y * (hg/hw)
  return gx, gy
end

return util
