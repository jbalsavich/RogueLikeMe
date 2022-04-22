
shade = {}

lightlvl = 8
rd = 1
gr = 1
bl = 1



function shade:draw()
    love.graphics.setShader(shader)

    local px,py = player:getPosition()

    shader:send("screen", {
        love.graphics.getWidth(),
        love.graphics.getHeight()
    })

    shader:send("num_lights", 15)
    local tileSize = spriteSize

    do
        local name = "lights[" .. 0 .."]"
        shader:send(name .. ".position", {tileSize*2,tileSize*4.5})
        shader:send(name .. ".diffuse", {1.0, 1.0, 1.0})
        shader:send(name .. ".power", 8)
    end
    
    --lights
    shader:send("lights[1].position", {tileSize*2,tileSize*7.5})
    shader:send("lights[1].diffuse",{1.0, 1.0, 1.0})
    shader:send("lights[1].power", 8)

    shader:send("lights[2].position", {tileSize*9.5,tileSize*3.5})
    shader:send("lights[2].diffuse",{1.0, 1.0, 1.0})
    shader:send("lights[2].power", 8)

    shader:send("lights[3].position", {tileSize*11,tileSize*3.5})
    shader:send("lights[3].diffuse",{1.0, 1.0, 1.0})
    shader:send("lights[3].power", 8)

    shader:send("lights[4].position", {tileSize*9,tileSize*5.5})
    shader:send("lights[4].diffuse",{1.0, 1.0, 1.0})
    shader:send("lights[4].power", 8)

    shader:send("lights[5].position", {tileSize*11,tileSize*5.5})
    shader:send("lights[5].diffuse",{1.0, 1.0, 1.0})
    shader:send("lights[5].power", 8)

    shader:send("lights[6].position", {tileSize*9,tileSize*7.5})
    shader:send("lights[6].diffuse",{1.0, 1.0, 1.0})
    shader:send("lights[6].power", 8)

    shader:send("lights[7].position", {tileSize*2.5,tileSize*10.5})
    shader:send("lights[7].diffuse",{1.0, 1.0, 1.0})
    shader:send("lights[7].power", 8)

    shader:send("lights[8].position", {tileSize*8.5,tileSize*10.5})
    shader:send("lights[8].diffuse",{1.0, 1.0, 1.0})
    shader:send("lights[8].power", 8)

    shader:send("lights[9].position", {tileSize*11.5,tileSize*11.5})
    shader:send("lights[9].diffuse",{1.0, 1.0, 1.0})
    shader:send("lights[9].power", 8)


    --spiders
    shader:send("lights[10].position", {tileSize*3.5,tileSize*4.5})
    shader:send("lights[10].diffuse",{1.0, 0.0, 0.0})
    shader:send("lights[10].power", 2)

    shader:send("lights[11].position", {tileSize*5.5,tileSize*5.25})
    shader:send("lights[11].diffuse",{1.0, 0.0, 0.0})
    shader:send("lights[11].power", 2)

    shader:send("lights[12].position", {tileSize*11.5,tileSize*2.5})
    shader:send("lights[12].diffuse",{1.0, 0.0, 0.0})
    shader:send("lights[12].power", 2)

    shader:send("lights[13].position", {tileSize*11.5,tileSize*3.5})
    shader:send("lights[13].diffuse",{1.0, 0.0, 0.0})
    shader:send("lights[13].power", 2)

    shader:send("lights[14].position", {px,py})
    shader:send("lights[14].diffuse",{rd, gr, bl})
    shader:send("lights[14].power", lightlvl)

end