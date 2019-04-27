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
  state.menu = Menu({
    name = "menu",
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
  state.shelf = Shelf({
    name = "shelf",
    x = 300,
    y = 20,
    w = 100,
    h = 100
  })
  state.workbench = Workbench({
    name = "workbench",
    x = 90,
    y = 180,
    w = 220,
    h = 40
  })

  table.insert(state.entities, state.shelf)
  table.insert(state.entities, state.menu)
  table.insert(state.entities, player)
  table.insert(state.entities, state.workbench)
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

function love.mousepressed(x, y)
  local gx, gy = util.translateCoordinates(x, y)
  for _, entity in ipairs(state.entities) do
    if entity.items ~= nil and next(entity.items) ~= nil then
      entity:mousepressed(gx, gy)
    end
  end
end
