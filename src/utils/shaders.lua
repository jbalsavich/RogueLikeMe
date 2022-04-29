

lightlvl = 8
rd = 1
gr = 1
bl = 0.5


function shader:draw()
    love.graphics.setShader(shader.lighting)

    local px,py = player:getPosition()

    shader.lighting:send("screen", {
        love.graphics.getWidth(),
        love.graphics.getHeight()
    })

    shader.lighting:send("num_lights", 16)
    image = love.graphics.newImage("maps/dungeonCrawler.png")
    local tileSize = spriteSize

    
    for i=0, 15,1 do
        local name = "lights[" .. i .."]"
        shader.lighting:send(name .. ".position", {2*tileSize*i,2*tileSize*i})
        shader.lighting:send(name .. ".diffuse", {1.0, 1.0, 1.0})
        shader.lighting:send(name .. ".power", 8)
        i = i+1
    end
    
    --[[
    shader.lighting:send("lights[1].position", {tileSize*2,tileSize*7.5})
    shader.lighting:send("lights[1].diffuse",{1.0, 1.0, 1.0})
    shader.lighting:send("lights[1].power", 8)

    shader.lighting:send("lights[2].position", {tileSize*9.5,tileSize*3.5})
    shader.lighting:send("lights[2].diffuse",{1.0, 1.0, 1.0})
    shader.lighting:send("lights[2].power", 8)

    shader.lighting:send("lights[3].position", {tileSize*11,tileSize*3.5})
    shader.lighting:send("lights[3].diffuse",{1.0, 1.0, 1.0})
    shader.lighting:send("lights[3].power", 8)

    shader.lighting:send("lights[4].position", {tileSize*9,tileSize*5.5})
    shader.lighting:send("lights[4].diffuse",{1.0, 1.0, 1.0})
    shader.lighting:send("lights[4].power", 8)

    shader.lighting:send("lights[5].position", {tileSize*11,tileSize*5.5})
    shader.lighting:send("lights[5].diffuse",{1.0, 1.0, 1.0})
    shader.lighting:send("lights[5].power", 8)

    shader.lighting:send("lights[6].position", {tileSize*9,tileSize*7.5})
    shader.lighting:send("lights[6].diffuse",{1.0, 1.0, 1.0})
    shader.lighting:send("lights[6].power", 8)

    shader.lighting:send("lights[7].position", {tileSize*2.5,tileSize*10.5})
    shader.lighting:send("lights[7].diffuse",{1.0, 1.0, 1.0})
    shader.lighting:send("lights[7].power", 8)

    shader.lighting:send("lights[8].position", {tileSize*8.5,tileSize*10.5})
    shader.lighting:send("lights[8].diffuse",{1.0, 1.0, 1.0})
    shader.lighting:send("lights[8].power", 8)

    shader.lighting:send("lights[9].position", {tileSize*11.5,tileSize*11.5})
    shader.lighting:send("lights[9].diffuse",{1.0, 1.0, 1.0})
    shader.lighting:send("lights[9].power", 8)]]

    shader.lighting:send("lights[14].position", {love.graphics.getWidth()/2,love.graphics.getHeight()/2})
    shader.lighting:send("lights[14].diffuse",{rd, gr, bl})
    shader.lighting:send("lights[14].power", lightlvl)

end