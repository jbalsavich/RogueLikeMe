enemy = {}
enemy.x = love.graphics.getWidth() * .8
enemy.y = love.graphics.getHeight() * .8
enemy.width = love.graphics.getWidth()/15;
enemy.height = love.graphics.getWidth()/15;
enemy.speed = (enemy.width/love.graphics.getWidth()) * scale * 1.8
goLeft = true




function enemy:update(dt)
    --if love.keyboard.isDown("right") then
--[[
if goLeft then
        if enemy.x - enemy.speed <= 0 then
            goLeft = false
            enemy.x = enemy.x + enemy.speed
        end
        enemy.x = enemy.x - enemy.speed
    else
        if enemy.x + enemy.width + enemy.speed >= love.graphics.getWidth() then
            goLeft = true
            enemy.x = enemy.x - enemy.speed
        end
        enemy.x = enemy.x + enemy.speed
]]
    --if collision then enemy.speed = -enemy.speed end
    enemy.x = enemy.x + enemy.speed
    if enemy.x + enemy.width >= love.graphics.getWidth() then
        enemy.speed = -enemy.speed
    end
    if enemy.x <= 0 then
        enemy.speed = -enemy.speed
    end

    --end
    --[[if love.keyboard.isDown("left") then
        if enemy.x - enemy.speed < 0 then
            enemy.x = enemy.x + enemy.speed
        end
        enemy.x = enemy.x - enemy.speed
    --end
    --if love.keyboard.isDown("down") then
        if enemy.y + enemy.height + enemy.speed >= love.graphics.getHeight() then
            enemy.y = enemy.y - enemy.speed
        end
        enemy.y = enemy.y + enemy.speed
    --end
    --if love.keyboard.isDown("up") then
        if enemy.y - enemy.speed < 0 then
            enemy.y = enemy.y + enemy.speed
        end
        enemy.y = enemy.y - enemy.speed
    --end]]
end

function enemy:draw()
    local buns = love.graphics.newImage("sprites/enemyDown.png")
    love.graphics.draw(buns, enemy.x, enemy.y)
end


--[[
    function love.draw(dt)
        string = "Distance: " .. distance .. "   |   " .. maxDistance .. "   |   " .. realRed
        love.graphics.draw(enemy.img, enemy.x, enemy.y,nil, .1)
        -- get distance between enemy and random area
        distance = math.sqrt(math.pow(enemy.x - randomArea.x, 2) + math.pow(enemy.y - randomArea.y, 2))
        --print(distance)
        maxDistance = math.sqrt(math.pow(love.graphics.getWidth(), 2) + math.pow(love.graphics.getHeight(), 2))
        distanceRatio = distance / maxDistance
        --draw the enemyCoords in the top left corner
        --round realRed to the nearest integer
    
        love.graphics.print(ToInteger(backgroundcolor.r) .." ".. ToInteger(backgroundcolor.g) .." ".. ToInteger(backgroundcolor.b), 200, 10,-100,8)
    
        love.graphics.setBackgroundColor(ToInteger(backgroundcolor.r)/255,0,255) -- and here
    
end

function love.update(dt)
    backgroundcolor = {r= ToInteger(realRed), g= 0, b=255}
    -- change the enemyCoords to the enemy's x and y
    --love.graphics.setBackgroundColor(255-(distance/love.graphics.getWidth()), 0, 1/(distance / maxDistance/2))
    --check if the enemy is in the random area
    realRed = math.floor(255 * distanceRatio)

]]