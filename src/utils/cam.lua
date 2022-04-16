Camera = require("libraries/plugins/hump/camera")
cam = Camera()

function cam:update(dt)

    local camX, camY = player:getPosition()

    local w = love.graphics.getWidth() / scale
    local h = love.graphics.getHeight() / scale

    local mapW = mapSize * spriteSize
    local mapH = mapSize * spriteSize

    -- Left border
    if camX < w/2 then
        camX = w/2
    end

    -- Right border
    if camY < h/2 then
        camY = h/2
    end

    -- Right border
    if camX > (mapW - w/2) then
        camX = (mapW - w/2)
    end
    -- Bottom border
    if camY > (mapH - h/2) then
        camY = (mapH - h/2)
    end

    cam:lookAt(camX,camY)
    cam.x, cam.y = cam:position()
end