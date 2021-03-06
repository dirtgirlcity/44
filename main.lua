local Info = require('info')
local Health = require('health')
local Menu = require('menu')
local Player = require('player')
local Recipe = require('recipe')
local Shelf = require ('shelf')
local Workbench = require('workbench')

local state = require('state')

function love.load()
  love.graphics.setBackgroundColor(0, 0, 0)
  love.window.setTitle("the price is right")

  state.info = Info({
    x = 90,
    y = 230,
    w = 200,
    h = 40,
  })
  state.health = Health({
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
  state.player = Player({
    x = 30,
    y = 80,
    w = 50,
    h = 110
  })
  state.recipe = Recipe({
    name = "recipe",
    x = 100,
    y = 240,
    w = 180,
    h = 20,
    level = 1
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
  table.insert(state.entities, state.player)
  table.insert(state.entities, state.workbench)
  table.insert(state.entities, state.health)
  table.insert(state.entities, state.info)
  table.insert(state.entities, state.recipe)
end

function love.draw()
  local width, height = love.graphics.getDimensions()
  love.graphics.scale(width/state.width, height/state.height)
  if state.phase ~= "play" then
    state:draw()
  else
    for _, entity in ipairs(state.entities) do
      entity:draw()
    end
  end
end

function love.mousepressed(x, y)
  local ww, hw = love.graphics.getDimensions()
  local wg = state.width
  local hg = state.height
  local gx = x * (wg/ww)
  local gy = y * (hg/hw)

  if state.phase ~= "play" then
    state:mousepressed(gx, gy)
  else
    for _, entity in ipairs(state.entities) do
      if entity.items ~= nil and next(entity.items) ~= nil then
        entity:mousepressed(gx, gy)
      end
    end
  end
end
