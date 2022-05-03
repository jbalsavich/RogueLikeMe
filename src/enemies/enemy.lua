enemies = {}

function spawnEnemy(x,y,type,args)
    
    local enemy = {}

    enemy.type = type
    enemy.dead = false
    enemy.stamp = "enemy"
    enemy.health = 6
    enemy.flashTimer = 0

    local init
    if type == "bunny" then
        init = require("src/enemies/bunny")
        
    end

    enemy = init(enemy,x,y,args)

    function enemy:genericUpdate(dt)
        if self.flashTimer > 0 then
            self.flashTimer = self.flashTimer - dt
            if self.flashTimer < 0 then
                self.flashTimer = 0
            end
        end
    end

    table.insert(enemies,enemy)
end

function enemies:update(dt)
    --update all enemies
    for i,e in ipairs(self) do
        e:update(dt)
        e:genericUpdate(dt)
    end
    --remove dead enemies
    for i=#enemies,1,-1 do 
        if enemies[i].dead then
            if enemies[i].physics ~= nil then
                enemies[i].physics:destroy()
            end
            table.remove(enemies,i)
        end
    end

end

function enemies:draw()
    for i,e in ipairs(self) do
        e:draw()
    end
end

function enemies:destroyDead()
    local i = #enemies
    while i>0 do
        if enemies[i].dead then 
            if enemies[i].physics then
                enemies[i].physics:destroy()
            end
            table.remove(enemies,i)
        end
        i=i-1
    end
end