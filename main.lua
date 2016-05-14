local circle = love.graphics.newImage("assets/circle.png")
local cross = love.graphics.newImage("assets/cross.png")
local separator_hor = love.graphics.newImage("assets/separator_hor.png")
local separator_ver = love.graphics.newImage("assets/separator_ver.png")

local board = {
    { false, true, false },
    { true, false, true },
    { false, true, false }
}

function love.load()
    love.graphics.setBackgroundColor(255, 255, 255)
end
function love.draw()
    for i = 1, 3 do
        for j = 1, 3 do
            if board[i][j] == false then
                love.graphics.draw(circle, 128*(j-1)+16*(j-1), 128*(i-1)+16*(i-1))
            else
                love.graphics.draw(cross, 128*(j-1)+16*(j-1), 128*(i-1)+16*(i-1))
            end
        end
    end

    love.graphics.draw(separator_ver, 128, 0)
    love.graphics.draw(separator_ver, 272, 0)
    love.graphics.draw(separator_hor, 0, 128)
    love.graphics.draw(separator_hor, 0, 272)
end
function love.update()
end
