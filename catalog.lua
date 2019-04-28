local Item = require('item')

local levels = {
  {
    level = 1,
    menuItems = {
      Item({
        name = "item",
        desc = "1",
        price = 1
      }),
      Item({
        name = "item",
        desc = "2",
        price = 2
      }),
      Item({
        name = "item",
        desc = "3",
        price = 3
      })
    },
    recipeItems = {
      Item({
        name = "item",
        desc = "1"
      }),
      Item({
        name = "item",
        desc = "4"
      })
    },
    rewardItems = {
      Item({
        name = "item",
        desc = "0"
      })
    },
    text = "adds 2 5"
  },
  {
    level = 2,
    menuItems = {
      Item({
        name = "item",
        desc = "a",
        price = 5
      }),
      Item({
        name = "item",
        desc = "b",
        price = 5
      }),
      Item({
        name = "item",
        desc = "c",
        price = 5
      })
    },
    recipeItems = {
      Item({
        name = "item",
        desc = "b"
      }),
      Item({
        name = "item",
        desc = "a"
      }),
      Item({
        name = "item",
        desc = "d"
      })
    },
    rewardItems = {
      Item({
        name = "item",
        desc = "11"
      })
    },
    text = "my name"
  }
}

return levels
