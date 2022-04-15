function love.load()
    math.randomseed(os.time())

    require("src/startup/gameStart")
    gameStart()

    
end

function love.update(dt)
    updateAll(dt)
    if love.keyboard.isDown('escape') then
        love.event.push('quit')
    end
end

function love.draw()
    

    drawCamera()
end