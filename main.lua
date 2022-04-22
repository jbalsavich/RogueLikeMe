function love.load()
    math.randomseed(os.time())

    colliderToggle = true

    require("src/startup/gameStart")
    gameStart()
    --sti  = require 'src/libraries/sti'
    --gameMap = sti("maps/TopFloor.lua")

    --loadShader()
    generateMap()

    
end


function ToInteger(number)
    return math.floor(tonumber(number) or error("Could not cast '" .. tostring(number) .. "' to number.'"))
end

distance = 0
backgroundcolor = {r=0, g=0, b=0}
function love.update(dt)
    playerVsEnemy()
    maxDistance = math.sqrt(math.pow(love.graphics.getWidth(), 2) + math.pow(love.graphics.getHeight(), 2))
    distanceRatio = distance / maxDistance
    realRed = math.floor(255 * distanceRatio)
    --backgroundcolor = {r= ToInteger(realRed), g= 0, b=255}
    distance = math.sqrt(math.pow(player.x - 0, 2) + math.pow(player.y - 0, 2))
    love.graphics.setBackgroundColor(ToInteger(backgroundcolor.r), ToInteger(backgroundcolor.g), ToInteger(backgroundcolor.b))
    updateAll(dt)
    if love.keyboard.isDown('escape') then
        love.event.push('quit')
    end
end

function love.draw()
    --gameMap:draw()
    drawBeforeCamera()

    cam:attach()
        drawCamera()
    cam:detach()

    drawAfterCamera()
end

function setBackgroundColor(r,g,b)
    backgroundcolor = {r=r, g=g, b=b}
end

function love.keypressed(key)
    if key == 'r' then
        rd = 1-rd
    end
    if key == 'g' then
        gr = 1-gr
    end
    if key == 'b' then
        bl = 1-bl
    end

    if key == 'up' then
        lightlvl = lvl+8
    end
    if key == 'down' then
        lightlvl = lvl-8
    end
end