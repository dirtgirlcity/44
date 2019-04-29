local playerClass = { }
playerClass.__index = playerClass

local function Player(spec)
  local instance = {
    x = spec.x,
    y = spec.y,
    w = spec.w,
    h = spec.h
  }
  setmetatable(instance, playerClass)
  return instance
end

function playerClass:draw()
  self:age()
  love.graphics.rectangle( 'fill', self.x, self.y, self.w, self.h )
end

function playerClass:age()
  if state.health.pts > 90 then
    love.graphics.setColor(0, 10, 50)
  end
  if state.health.pts <= 90 and state.health.pts > 80 then
    love.graphics.setColor(0, 20, 60)
  end
  if state.health.pts <= 80 and state.health.pts > 70 then
    love.graphics.setColor(0, 30, 70)
  end
  if state.health.pts <= 70 and state.health.pts > 60 then
    love.graphics.setColor(0, 40, 80)
  end
  if state.health.pts <= 60 and state.health.pts > 50 then
    love.graphics.setColor(0, 50, 90)
  end
  if state.health.pts <= 50 and state.health.pts > 40 then
    love.graphics.setColor(0, 60, 100)
  end
  if state.health.pts <= 40 and state.health.pts > 30 then
    love.graphics.setColor(0, 70, 110)
  end
  if state.health.pts <= 30 and state.health.pts > 20 then
    love.graphics.setColor(0, 80, 120)
  end
  if state.health.pts <= 20 and state.health.pts > 10 then
    love.graphics.setColor(0, 90, 130)
  end
  if state.health.pts <= 10 and state.health.pts > 0 then
    love.graphics.setColor(0, 100, 140)
  end
end

return Player
