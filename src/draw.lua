function drawBeforeCamera()
    
end

function drawCamera()
    shader:draw()
    walls:draw()
    ground:draw()
    player:draw()
    enemy:draw()
    world:draw()
    love.graphics.setShader()


end

function drawAfterCamera()
    love.graphics.setShader()
end