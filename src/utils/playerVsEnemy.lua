--if player collides with enemy, player loses health and is sent back to start
function playerVsEnemy()
    if player.x + player.width >= enemy.x and player.x <= enemy.x + enemy.width and player.y + player.height >= enemy.y and player.y <= enemy.y + enemy.height then
        player.health = player.health - 1
        love.window.setTitle("THE GAME ( " .. player.health .. " )")
        if(player.health <= 0) then
            --set the background color to red
            setBackgroundColor(255,0,0)
            
        end
        
        -- get a vector of the distance between player and enemy
        distanceVector = {x = enemy.x - player.x, y = enemy.y - player.y}
        -- reverse the vector
        distanceVector = {x = -distanceVector.x, y = -distanceVector.y}
        -- send the player in the opposite direction
        if(distanceVector.x > 0 and distanceVector.x >= player.width) then
            player.x = (player.x + player.width + (distanceVector.x+player.width))
        else
            if(distanceVector.x < player.width) then
                
            end
            player.x = (player.x - player.width - (distanceVector.x))
        end
        if(distanceVector.y > 0) then
            player.y = (player.y + player.height*2 + distanceVector.y)
        else
            player.y = (player.y - player.height*2 - distanceVector.y)
        end
        
    end
end