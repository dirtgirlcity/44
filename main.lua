local Info = require('info')
local Health = require('health')
local Menu = require('menu')
local Player = require('player')
local Recipe = require('recipe')
local Shelf = require ('shelf')
local State = require('state')
local Workbench = require('workbench')
local util = require('util')

function love.load()
  love.graphics.setBackgroundColor(0, 0, 0)
  love.window.setTitle("the price is right")

  state = State()
  local info = Info({
    x = 90,
    y = 230,
    w = 200,
    h = 30,
  })
  local health = Health({
    x = 40,
    y = 20,
    w = 100,
    h = 20
  })
  local menu = Menu({
    x = 350,
    y = 150,
    w = 80,
    h = 100,
  })
  local player = Player({
    x = 30,
    y = 80,
    w = 50,
    h = 110
  })
  local shelf = Shelf({
    x = 200,
    y = 20,
    w = 250,
    h = 200
  })
  local workbench = Workbench({
    x = 90,
    y = 180,
    w = 220,
    h = 40
  })

  table.insert(state.entities, shelf)
  local items = util.loadItems(shelf.x, shelf.y)
  for _, item in ipairs(items) do
    table.insert(state.entities, item)
  end
  table.insert(state.entities, menu)
  table.insert(state.entities, player)
  table.insert(state.entities, workbench)
  table.insert(state.entities, info)
  table.insert(state.entities, health)
end

function love.draw()
  local width, height = love.graphics.getDimensions()
  love.graphics.scale(width/state.width, height/state.height)
  for _, entity in ipairs(state.entities) do
    entity:draw()
  end
end
