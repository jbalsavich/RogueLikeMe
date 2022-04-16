Camera = require("libraries/plugins/hump-master/camera")
cam = Camera()

function cam:update(dt)

    camX = player.x
    camY = player.y

    cam:lookAt(camX,camY)
    cam.x, cam.y = cam:position()
end