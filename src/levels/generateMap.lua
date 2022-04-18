       
lvl = 4
darkTile = love.graphics.newImage("sprites/darkTile.png")
blueTile = love.graphics.newImage("sprites/blueTile.png")
teleporter = love.graphics.newImage("sprites/teleporter.png")
spriteSize = 64
teliY = 0
teliX = 0
mapSize = lvl + 5
generateMap = {}
teliY = math.random(1,mapSize-1)
teliX = math.random(1,mapSize-1)
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
    love.graphics.draw(teleporter, spriteSize*teliX, spriteSize*teliY, 0, 2, 2)
end

