local circle = love.graphics.newImage("assets/circle.png")
local cross = love.graphics.newImage("assets/cross.png")
local hor_separator = love.graphics.newImage("assets/hor_separator.png")
local ver_separator = love.graphics.newImage("assets/ver_separator.png")

local board = {
    { 0, 0, 0 },
    { 0, 0, 0 },
    { 0, 0, 0 }
}

local circle_cross_position =  {{{},{},{}},{{},{},{}},{{},{},{}}}
local ver_separator_position = {{},{}}
local hor_separator_position = {{},{}}

function love.load()
    love.graphics.setBackgroundColor(255, 255, 255)

    -- Calculate object positions
    --- Circle and cross
    for i = 1, 3 do         -- y
        for j = 1, 3 do     -- x
            circle_cross_position[i][j][1] = 128*(j-1)+16*(j-1)
            circle_cross_position[i][j][2] = 128*(i-1)+16*(i-1)
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
            if board[i][j] == 1 then
                love.graphics.draw(circle, circle_cross_position[i][j][1], circle_cross_position[i][j][2])
            elseif board[i][j] == 2 then
                love.graphics.draw(cross, circle_cross_position[i][j][1], circle_cross_position[i][j][2])
            end
        end
    end
    -- Vertical separators
    for i = 1, 2 do
        love.graphics.draw(ver_separator, ver_separator_position[i][1], ver_separator_position[i][2])
    end
    -- Horizontal separators
    for i = 1, 2 do
        love.graphics.draw(hor_separator, hor_separator_position[i][1], hor_separator_position[i][2])
    end
end
function love.update()
end
function love.mousereleased(x, y, button)
    done = false
    for i = 1, 3 do
        i = 4-i
        for j = 1, 3 do
            j = 4-j
            if x >= circle_cross_position[i][j][1] and y >= circle_cross_position[i][j][2] then
                if board[i][j] == 0 and button < 3 then
                    board[i][j] = button
                end
                done = true
            end
            if done then break end
        end
        if done then break end
    end
end
function love.keyreleased(key)
    if key == "r" then
        board = {
            { 0, 0, 0 },
            { 0, 0, 0 },
            { 0, 0, 0 }
        }
    end
end
