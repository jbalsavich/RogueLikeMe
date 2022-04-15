function love.load()
    math.randomseed(os.time())

    require("src/startup/gameStart")
    gameStart()

    
end

function love.update(dt)
    updateAll(dt)
end

function love.draw()
    

    drawCamera()
end