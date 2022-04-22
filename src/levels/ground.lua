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

function spawnGround(x, y, width, height)
    local floor = {}
    floor.x = x
    floor.y = y
    floor.width = width
    floor.height = height
    floor.sprite = sprites.blueTile
    table.insert(ground,floor)
end

function walls:draw()
    for _,w in ipairs(walls) do
        if w.sprite then
            love.graphics.draw(w.sprite, w:getX()-w.width/2, w:getY()-w.height/2, 0, w.width/32, w.height/32)
        end
    end
end

function ground:draw(x, y, width, height)
    for _,f in ipairs(ground) do
        if f.sprite then
            love.graphics.draw(f.sprite, f.x, f.y, 0, spriteSize/32,spriteSize/32)
        end
    end
end