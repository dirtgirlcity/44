local util = { }

function util.loadItems(num)
  local items = { }
  local Item = require('item')

  for i = 1, num do
    local item = Item({
      name = "item",
      desc =  tostring(i)
    })
    table.insert(items, item)
  end

  return items
end

function util.getItemKeys(items)
  local keys = { }
  for _, item in ipairs(items) do
    table.insert(keys, item.desc)
  end
  return keys
end

function util.isEqual(table1, table2)
  if #table1 ~= #table2 then return false end

  -- shallow copy, will only work for less than 100 items
  local tbl1 = { unpack(table1) }
  local tbl2 = { unpack(table2) }
  table.sort(tbl1)
  table.sort(tbl2)

  for i = 1, #tbl1 do
    if tbl1[i] ~= tbl2[i] then return false end
  end
  return true
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
