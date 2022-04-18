function requireAll()
    require("src/startup/collisionClasses")
    createCollisionClasses()

    require("src/startup/resources")

    require("src/player")
    require("src/update")
    require("src/draw")

    require("src/enemies/enemy")
    require("src/utils/playerVsEnemy")

    require("src/levels/generateMap")

    require("src/utils/cam")
    require("src/utils/destroyAll")
end