walls = {}
ground = {}

function spawnWall(x, y, width, height)
    
    local wall = world:newRectangleCollider(x, y, width, height, {collision_class = "Wall"})
    wall:setType('static')
    wall.width = width
    wall.height = height
    wall.sprite = sprites.darkTile

    table.insert(walls,wall)
end

function spawnWallLamp(x,y,width,height)
    local wall = world:newRectangleCollider(x, y, width, height, {collision_class = "Wall"})
    wall:setType('static')
    wall.width = width
    wall.height = height
    wall.sprite = sprites.wallLamp
    createLight(x,y,1,0.5,0,4)

    table.insert(walls,wall)

end

function spawnGround(x, y, width, height)
    local floor = {}
    floor.x = x
    floor.y = y
    floor.width = width
    floor.height = height
    floor.sprite = sprites.blueTile
    table.insert(ground,floor)
end

function spawnLantern(x,y,width,height)
    local floor = {}
    floor.x = x
    floor.y = y
    floor.width = width
    floor.height = height
    floor.sprite = sprites.cushion
    createLight(x,y-32,1,0.8,0,6)
    table.insert(ground,floor)
end

function ground:draw()
    for _,w in ipairs(walls) do
        if w.sprite then
            love.graphics.draw(w.sprite, w:getX()-w.width/2, w:getY()-w.height/2, 0, w.width/32, w.height/32)
        end
    end

    for _,f in ipairs(ground) do
        if f.sprite then
            love.graphics.draw(f.sprite, f.x, f.y, 0, spriteSize/32,spriteSize/32)
        end
        if f.sprite == sprites.cushion then
            love.graphics.draw(sprites.ballOfLight,f.x,f.y-32,0,spriteSize/32,spriteSize/32)
        end
    end
    createLight(tpX*spriteSize,tpY*spriteSize,0,1,1,4)
    love.graphics.draw(sprites.teleporter, spriteSize*tpX, spriteSize*tpY, 0, 2, 2)
end