pulses = {}

function spawnPulse(x,y)
    local pulse = {}
    pulse.x = x
    pulse.y = y
    pulse.timer = 4
    pulse.dead = false
    local dir = getFromToVector(x,y,player:getX(),player:getY()) * 1.2
    local fx,fy = dir:unpack()
    --pulse.dir = dir
    --pulse.dirVec = getDirectionVector(dir)
    pulse.rad = 8
    pulse.speed = 400
    createLight(pulse.x,pulse.y,0.5,1,1,8,"projectile")
    pulse.lindex = 1

    --offset based on direction
    if  math.abs( fx ) > math.abs( fy ) then
        if fx > 0 then      --right
            pulse.x = pulse.x + 32
            pulse.y = pulse.y
        else                --left
            pulse.x = pulse.x - 8
            pulse.y = pulse.y
        end
    else
        if fy > 0 then      --down
            pulse.x = pulse.x
            pulse.y = pulse.y + 32
        else                --up
            pulse.y = pulse.y - 8
        end
    end

    pulse.rot = math.tan((player:getY()-pulse.y)/(player:getX()-pulse.x))

    function pulse:update(dt)
        self.timer = self.timer - dt
        if self.timer < 0 then
            self.dead = true
        end

        self.x = self.x + (fx * self.speed * dt)
        self.y = self.y + (fy * self.speed * dt)
        updateLight(self.lindex,self.x-32,self.y-32,nil,nil,nil,nil,"projectile")

        local walls = world:queryCircleArea(self.x,self.y,self.rad,{'Wall'})
        if #walls > 0 then self.dead = true end

        local hitPlayer = world:queryCircleArea(self.x,self.y,self.rad,{'Player'})
        if #hitPlayer > 0 then 
            player:hurt(1,300,self.x,self.y)
            self.dead = true
        end

    end

    table.insert(pulses,pulse)
end

function pulses:update(dt)
    for _,b in ipairs(pulses) do
        b:update(dt)
    end

    local i = #pulses
    while i > 0 do
        if pulses[i].dead then
            table.remove(shader.projectiles,pulses[i].lindex)
            table.remove(pulses,i)
        end
        i = i-1
    end
end

function pulses:draw(layer)
    for _,a in ipairs(pulses) do
        love.graphics.draw(sprites.pulse, a.x,a.y,nil,4,4,sprites.pulse:getWidth()/2,sprites.pulse:getHeight()/2)
    end
end
        
