

lightlvl = 8
rd = 1
gr = 0.90
bl = 0.7

function createLight(xpos,ypos,r,g,b,power,t)
    local l = {}
    l.x = xpos + love.graphics.getWidth()/2 + spriteSize/2
    l.y = ypos + love.graphics.getHeight()/2 + spriteSize/2
    l.r = r
    l.g = g
    l.b = b
    l.p = power
    l.type = t
    if t == "projectile" then 
        table.insert(shader.projectiles,l)
    else
        table.insert(shader.placement,l)
    end

end

function updateLight(index,xpos,ypos,r,g,b,power,t)
    if t == "projectile" and index~=nil then
        if xpos~=nil then shader.projectiles[index].x = xpos + love.graphics.getWidth()/2 + spriteSize/2 end
        if ypos~=nil then shader.projectiles[index].y = ypos + love.graphics.getHeight()/2 + spriteSize/2 end
        if r~=nil then shader.projectiles[index].r = r end
        if g~=nil then shader.projectiles[index].g = g end
        if b~=nil then shader.projectiles[index].b = b end
        if power~=nil then shader.projectiles[index].p = power end
        if t~=nil then shader.projectiles[index].type = t end
    elseif index~=nil then
        if xpos~=nil then shader.placement[index].x = xpos + 6.5*spriteSize end
        if ypos~=nil then shader.placement[index].y = ypos + 6.5*spriteSize end
        if r~=nil then shader.placement[index].r = r end
        if g~=nil then shader.placement[index].g = g end
        if b~=nil then shader.placement[index].b = b end
        if power~=nil then shader.placement[index].p = power end
        if t~=nil then shader.placement[index].type = t end
    end
end

function initLights()
    createLight(400,400,1,0,0,20)
    createLight(600,400,1,.5,0,20)
    createLight(800,400,1,1,0,20)
    createLight(1000,400,0,1,0,20)
    createLight(400,800,0,1,1,20)
    createLight(600,800,0,0,1,20)
    createLight(800,800,1,0,1,20)
    createLight(1000,800,1,1,1,20)
end

function sendLights()
    local i = 0
    local px,py = player:getPosition()

    for i=0, 63,1 do
        local name = "lights[" .. i .."]"
        shader.lighting:send(name .. ".power", 0)
    end

    
    for _,l in ipairs(shader.projectiles) do
        local name = "lights[" .. i .."]"
        if i < 64  then
            shader.lighting:send(name .. ".position", {l.x-px, l.y-py})
            shader.lighting:send(name .. ".diffuse", {l.r,l.g,l.b})
            shader.lighting:send(name .. ".power", l.p)
            i=i+1
        end
    end
    i=#shader.projectiles+1
    for i,l in ipairs(shader.placement) do
        local name = "lights[" .. i .."]"
        if i < 64  then
            shader.lighting:send(name .. ".position", {l.x-px, l.y-py})
            shader.lighting:send(name .. ".diffuse", {l.r,l.g,l.b})
            shader.lighting:send(name .. ".power", l.p)
            i=i+1
        end
    end
end

function shader:update(dt)

end

function shader:draw()
    love.graphics.setShader(shader.lighting)

    local px,py = player:getPosition()

    shader.lighting:send("screen", {
        love.graphics.getWidth(),
        love.graphics.getHeight()
    })

    shader.lighting:send("num_lights", 64)
    local tileSize = spriteSize

    sendLights()

    --[[for i=0, 31,1 do
        local name = "lights[" .. i .."]"
        shader.lighting:send(name .. ".position", {2*tileSize*(i%5 + 3.5)-px, tileSize*(i - (i%5) +5)/2.5-py})
        shader.lighting:send(name .. ".diffuse", {1.0, 1.0, 1.0})
        shader.lighting:send(name .. ".power", 4)
    end]]

    shader.lighting:send("lights[14].position", {love.graphics.getWidth()/2,love.graphics.getHeight()/2})
    shader.lighting:send("lights[14].diffuse",{rd, gr, bl})
    shader.lighting:send("lights[14].power", lightlvl)

end