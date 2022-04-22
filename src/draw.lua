function drawBeforeCamera()
    
end

function drawCamera()
    walls:draw()
    ground:draw()
    player:draw()
    enemy:draw()
    world:draw()
    shade:draw()
end

function drawAfterCamera()
    love.graphics.setShader()
end