function drawBeforeCamera()
    --shader:draw()
end

function drawCamera()
    walls:draw()
    ground:draw()
    player:draw()
    enemy:draw()
    world:draw()
    love.graphics.setShader()
end

function drawAfterCamera()
    
end