--when a player and an enemy are in the same area, stop the enemy for 1 second and move the player back to the last position slowly
function playerVsEnemy(player, enemy)
    if player.x + player.width >= enemy.x and player.x <= enemy.x + enemy.width and player.y + player.height >= enemy.y and player.y <= enemy.y + enemy.height then
        enemy.x = enemy.x - enemy.speed
        enemy.y = enemy.y - enemy.speed
        player.x = player.x - player.speed
        player.y = player.y - player.speed
        enemy.speed = 0
        player.speed = 0
        enemy.health = enemy.health - 1
        player.health = player.health - 1
        if enemy.health <= 0 then
           -- enemy.delete()
           -- player.levelUp()
        end
        if player.health <= 0 then
            player.x = 0
            player.y = 0
            player.health = 100
            player.speed = (player.width/love.graphics.getWidth()) * scale
        end
    end
end