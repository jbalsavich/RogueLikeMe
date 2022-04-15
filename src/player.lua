player = {}
player.x = 0
player.y = 0
player.width = 100;
player.height = 100;
player.speed = 5

function player:update(dt)
    if love.keyboard.isDown("right") then
        if player.x + player.width + player.speed >= love.graphics.getWidth() then
            player.x = player.x - player.speed
        end
        player.x = player.x + player.speed
    end
    if love.keyboard.isDown("left") then
        if player.x - player.speed < 0 then
            player.x = player.x + player.speed
        end
        player.x = player.x - player.speed
    end
    if love.keyboard.isDown("down") then
        if player.y + player.height + player.speed >= love.graphics.getHeight() then
            player.y = player.y - player.speed
        end
        player.y = player.y + player.speed
    end
    if love.keyboard.isDown("up") then
        if player.y - player.speed < 0 then
            player.y = player.y + player.speed
        end
        player.y = player.y - player.speed
    end
end

function player:draw()
    love.graphics.rectangle("fill", player.x, player.y, player.width, player.height)
end