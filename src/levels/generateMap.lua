       
lvl = 5

spriteSize = 64
tpY = 0
tpX = 0
mapSize = 3*lvl + 3
generateMap = {}
tpY = math.random(1,mapSize-1)
tpX = math.random(1,mapSize-1)

rng = math.random(1,100)

function generateMap()
    for i=0,mapSize do
        for j=0,mapSize do
            rng = math.random(1,100)
            if i==0 or j==0 or i==mapSize or j==mapSize then
                if i%3 == 0 and j%3 == 0 then
                    spawnWallLamp(spriteSize*i, spriteSize*j, spriteSize, spriteSize)
                else
                    spawnWall(spriteSize*i, spriteSize*j, spriteSize, spriteSize)
                end
            else if rng%75 == 0 then
                spawnLantern(spriteSize*i, spriteSize*j, spriteSize, spriteSize)
            else
                spawnGround(spriteSize*i, spriteSize*j, spriteSize, spriteSize)
            end
        end
    end
    end
end

