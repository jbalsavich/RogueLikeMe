       
lvl = 5

spriteSize = 64
tpY = 0
tpX = 0
mapSize = lvl + 5
generateMap = {}
tpY = math.random(1,mapSize-1)
tpX = math.random(1,mapSize-1)
function generateMap:draw()
    for i=0,mapSize do
        for j=0,mapSize do
            if i==0 or j==0 or i==mapSize or j==mapSize then
                love.graphics.draw(sprites.darkTile, spriteSize*i, spriteSize*j, 0, 2, 2)
            else
                love.graphics.draw(sprites.blueTile, spriteSize*i, spriteSize*j, 0, 2, 2)
            end
        end
    end
    love.graphics.draw(sprites.teleporter, spriteSize*tpX, spriteSize*tpY, 0, 2, 2)
end

