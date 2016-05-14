local circle = love.graphics.newImage("assets/circle.png")
local cross = love.graphics.newImage("assets/cross.png")
local separator_hor = love.graphics.newImage("assets/separator_hor.png")
local separator_ver = love.graphics.newImage("assets/separator_ver.png")

local board = {
    { false, true, false },
    { true, false, true },
    { false, true, false }
}

local circle_position =  {{{},{},{}},{{},{},{}},{{},{},{}}}
local cross_position = {{{},{},{}},{{},{},{}},{{},{},{}}}
local ver_separator_position = {{},{}}
local hor_separator_position = {{},{}}

function love.load()
    love.graphics.setBackgroundColor(255, 255, 255)

    -- Calculate object positions
    --- Circle and cross
    for i = 1, 3 do         -- y
        for j = 1, 3 do     -- x
            circle_position[i][j][1] = 128*(j-1)+16*(j-1)
            circle_position[i][j][2] = 128*(i-1)+16*(i-1)
            cross_position[i][j][1] = 128*(j-1)+16*(j-1)
            cross_position[i][j][2] = 128*(i-1)+16*(i-1)
        end
    end
    --- Vertical separator
    for i = 1, 2 do
        ver_separator_position[i][1] = 128*i+16*(i-1)
        ver_separator_position[i][2] = 0
    end
    --- Horizontal separator
    for i = 1, 2 do
        hor_separator_position[i][1] = 0
        hor_separator_position[i][2] = 128*i+16*(i-1)
    end
end
function love.draw()
    -- Circles and crosses
    for i = 1, 3 do
        for j = 1, 3 do
            if board[i][j] == false then
                love.graphics.draw(circle, circle_position[i][j][1], circle_position[i][j][2])
            else
                love.graphics.draw(cross, cross_position[i][j][1], cross_position[i][j][2])
            end
        end
    end
    -- Vertical separators
    for i = 1, 2 do
        love.graphics.draw(separator_ver, ver_separator_position[i][1], ver_separator_position[i][2])
    end
    -- Horizontal separators
    for i = 1, 2 do
        love.graphics.draw(separator_hor, hor_separator_position[i][1], hor_separator_position[i][2])
    end
end
function love.update()
end
