player = world:newBSGRectangleCollider(spriteSize, spriteSize, spriteSize/1.5, spriteSize/2.5, spriteSize/3.75)
player.x = 0
player.y = 0
player.width = love.graphics.getWidth()/15;
player.height = love.graphics.getWidth()/15;
player.dir = "down"
player.speed = (player.width/love.graphics.getWidth()) *75* spriteSize


player.health = 6


-- 0 = Normal Gameplay
player.state = 0

player:setCollisionClass("Player")
player:setFixedRotation(true)


function player:update(dt)

    local dirX = 0
    local dirY = 0

    if player.state == 0 then
        if love.keyboard.isDown("down") then
            player.dir = "down"
            dirY = 1
        end
        if love.keyboard.isDown("up") then
            player.dir = "up"
            dirY = -1
        end
        if love.keyboard.isDown("right") then
            player.dir = "right"
            dirX = 1
        end
        if love.keyboard.isDown("left") then
            player.dir = "left"
            dirX = -1
        end
        

        local vec = vector(dirX,dirY):normalized() * player.speed
        player:setLinearVelocity(vec.x,vec.y)

        
    end
end

function player:draw()

    local plLf = sprites.playerLeft
    local plRt = sprites.playerRight
    local plUp = sprites.playerUp
    local plDw = sprites.playerDown

    local px = player:getX()
    local py = player:getY()-20


    if player.dir == "right" then
        love.graphics.draw(plRt, px, py, 0,2*spriteSize/plDw:getWidth(),2*spriteSize/plDw:getHeight(),plRt:getWidth()/2, plRt:getHeight()/1.25)
    
    elseif player.dir == "left" then
        love.graphics.draw(plLf, px, py, 0,2*spriteSize/plDw:getWidth(),2*spriteSize/plDw:getHeight(),plLf:getWidth()/2, plLf:getHeight()/1.25)

    elseif player.dir == "down" then
        love.graphics.draw(plDw, px, py, 0,2*spriteSize/plDw:getWidth(),2*spriteSize/plDw:getHeight(),plDw:getWidth()/2, plDw:getHeight()/1.25)
    
    elseif player.dir == "up" then
        love.graphics.draw(plUp, px, py, 0,2*spriteSize/plDw:getWidth(),2*spriteSize/plDw:getHeight(),plUp:getWidth()/2, plUp:getHeight()/1.25)
        
    end
end

function player:checkDamage()
    if player:enter('Enemy') then
        local e = player:getEnterCollisionData('Enemy')
        player:hurt(0.5, e.collider:getX(), e.collider:getY())
    end
end

function player:hurt(damage, knockback, srcX, srcY)
    player.health = player.health - damage
    --player.state = 10 -- damaged
    player:setLinearVelocity((getFromToVector(srcX, srcY, player:getX(), player:getY()) * knockback):unpack())
    player.stunTimer = 0.075
end

--[[
    function love.draw(dt)
        string = "Distance: " .. distance .. "   |   " .. maxDistance .. "   |   " .. realRed
        love.graphics.draw(player.img, player.x, player.y,nil, .1)
        -- get distance between player and random area
        distance = math.sqrt(math.pow(player.x - randomArea.x, 2) + math.pow(player.y - randomArea.y, 2))
        --print(distance)
        maxDistance = math.sqrt(math.pow(love.graphics.getWidth(), 2) + math.pow(love.graphics.getHeight(), 2))
        distanceRatio = distance / maxDistance
        --draw the playerCoords in the top left corner
        --round realRed to the nearest integer
    
        love.graphics.print(ToInteger(backgroundcolor.r) .." ".. ToInteger(backgroundcolor.g) .." ".. ToInteger(backgroundcolor.b), 200, 10,-100,8)
    
        love.graphics.setBackgroundColor(ToInteger(backgroundcolor.r)/255,0,255) -- and here
    
end

function love.update(dt)
    backgroundcolor = {r= ToInteger(realRed), g= 0, b=255}
    -- change the playerCoords to the player's x and y
    --love.graphics.setBackgroundColor(255-(distance/love.graphics.getWidth()), 0, 1/(distance / maxDistance/2))
    --check if the player is in the random area
    realRed = math.floor(255 * distanceRatio)

]]