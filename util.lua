local Item = require('item')
local util = { }

function util.loadItems(xBase, yBase)
  local items = { }
  local numRows = 3
  local numCols = 4
  for row = 1, numRows do
    for col = 1, numCols do
      local i = Item({
        x = xBase + col * 15,
        y = yBase + row * 20,
        name = "woop",
        price = 10
      })
      table.insert(items, i)
    end
  end
  return items
end

return util
