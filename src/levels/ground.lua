walls = {}
ground = {}

function spawnWall(x, y, width, height)
    
    local wall = world:newRectangleCollider(x, y, width, height, {collision_class = "Wall"})
    wall:setType('static')
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
            love.graphics.draw(w.sprite, w:getX()-32, w:getY()-32, 0, 2, 2)
        end
    end
end

function ground:draw(x, y, width, height)
    for _,f in ipairs(ground) do
        if f.sprite then
            love.graphics.draw(f.sprite, f.x, f.y, 0, 2, 2)
        end
    end
end