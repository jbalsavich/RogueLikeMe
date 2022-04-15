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
        player.x = player.x - player.speed
    end
    if love.keyboard.isDown("down") then
        player.y = player.y + player.speed
    end
    if love.keyboard.isDown("up") then
        player.y = player.y - player.speed
    end
end

function player:draw()
    love.graphics.rectangle("fill", player.x, player.y, player.width, player.height)
end