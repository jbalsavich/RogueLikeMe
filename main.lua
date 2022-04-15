function love.load()
    math.randomseed(os.time())

    require("src/startup/gameStart")
    gameStart()

    
end


function ToInteger(number)
    return math.floor(tonumber(number) or error("Could not cast '" .. tostring(number) .. "' to number.'"))
end

distance = 0
function love.update(dt)

    maxDistance = math.sqrt(math.pow(love.graphics.getWidth(), 2) + math.pow(love.graphics.getHeight(), 2))
    distanceRatio = distance / maxDistance
    realRed = math.floor(255 * distanceRatio)
    backgroundcolor = {r= ToInteger(realRed), g= 0, b=255}
    distance = math.sqrt(math.pow(player.x - 0, 2) + math.pow(player.y - 0, 2))
    love.graphics.setBackgroundColor(ToInteger(backgroundcolor.r)/255,0,255)
    updateAll(dt)
    if love.keyboard.isDown('escape') then
        love.event.push('quit')
    end
end

function love.draw()
    

    drawCamera()
end