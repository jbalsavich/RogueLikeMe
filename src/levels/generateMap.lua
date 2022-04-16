       
lvl = 1
darkTile = love.graphics.newImage("sprites/darkTile.png")
blueTile = love.graphics.newImage("sprites/blueTile.png")
spriteSize = 64
mapSize = lvl*2 + 5
generateMap = {}
function generateMap:draw()
    for i=0,mapSize do
        for j=0,mapSize do
            if i==0 or j==0 or i==mapSize or j==mapSize then
                love.graphics.draw(darkTile, spriteSize*i, spriteSize*j, 0, 2, 2)
            else
                love.graphics.draw(blueTile, spriteSize*i, spriteSize*j, 0, 2, 2)
            end
        end
    end
end

