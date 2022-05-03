function drawBeforeCamera()
    
end

function drawCamera()

    setWhite()


    shader:draw()
    ground:draw()
    pulses:draw()
    player:draw()
    enemies:draw()
    world:draw()
    love.graphics.setShader()


end

function drawAfterCamera()

end