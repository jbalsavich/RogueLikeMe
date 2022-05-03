function updateAll(dt)
    player:update(dt)
    world:update(dt)
    pulses:update(dt)
    enemies:update(dt)
    enemies:destroyDead()

    cam:update(dt)

end