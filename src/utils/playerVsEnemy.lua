--if player collides with enemy, player loses health and is sent back to start
function playerVsEnemy()
    if player.x + player.width >= enemy.x and player.x <= enemy.x + enemy.width and player.y + player.height >= enemy.y and player.y <= enemy.y + enemy.height then
        player.health = player.health - 1
        love.window.setTitle("THE GAME ( " .. player.health .. " )")
        if(player.health <= 0) then
            --set the background color to red
            setBackgroundColor(255,0,0)
            
        end
<<<<<<< HEAD
        
=======
        --enemy.speed = -enemy.speed;
>>>>>>> 9a974ab9195013ff3ceb21daa89dea4cd7297dd8
        -- get a vector of the distance between player and enemy
        distanceVector = {x = enemy.x - player.x, y = enemy.y - player.y}
        -- reverse the vector
        distanceVector = {x = -distanceVector.x, y = -distanceVector.y}
        -- send the player in the opposite direction
        if(distanceVector.x > 0) then
            player.x = (player.x + player.width + player.speed)
            enemy.x = (enemy.x - enemy.width - enemy.speed)
        else
            player.x = (player.x - player.width - player.speed)
            enemy.x = (enemy.x + enemy.width + enemy.speed)
        end
        if(distanceVector.y > 0) then
            player.y = (player.y + player.height + player.speed)
            enemy.y = (enemy.y - enemy.height - enemy.speed)
        else
            player.y = (player.y - player.height - player.speed)
            enemy.y = (enemy.y + enemy.height + enemy.speed)
        end
    end
end