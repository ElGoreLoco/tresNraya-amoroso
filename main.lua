local circle = love.graphics.newImage("assets/circle.png")
local cross = love.graphics.newImage("assets/cross.png")

function love.load()
    love.graphics.setBackgroundColor(255, 255, 255)
end
function love.draw()
    love.graphics.draw(circle, 0, 0)
end
function love.update()
end
