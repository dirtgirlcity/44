local stateClass = { }
stateClass.__index = stateClass

local levels = require('catalog')

local function State()
  local instance = {
    entities = { },
    width = 1920/4,
    height = 1080/4,
    phase = "intro1",
    phases = {
      "intro1",
      "intro2",
      "intro3",
      "play",
      "win",
      "lose"
    }
  }
  setmetatable(instance, stateClass)
  return instance
end

function stateClass:draw()
  if self.phase == "intro1" then
    love.graphics.print(levels[#levels].introTextPage1, 10, 50)
  end
  if self.phase == "intro2" then
    love.graphics.print(levels[#levels].introTextPage2, 10, 50)
  end
  if self.phase == "intro3" then
    love.graphics.print(levels[#levels].introTextPage3, 10, 50)
  end

  if self.phase == "win" then
    love.graphics.print(levels[#levels].winText, 40, 40)
  end
  if self.phase == "lose" then
    love.graphics.print(levels[#levels].loseText, 40, 40)
  end
end

function stateClass:mousepressed()
  if self.phase == "intro1" then
    self.phase = "intro2"
    return
  end
  if self.phase == "intro2" then
    self.phase = "intro3"
    return
  end
  if self.phase == "intro3" then
    self.phase = "play"
    return
  end
end

function stateClass:endGame(success)
  self.phase = success
end

return State()
