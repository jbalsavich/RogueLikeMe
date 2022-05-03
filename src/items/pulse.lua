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
    pulse.rad = 3
    pulse.speed = 400
    createLight(pulse.x,pulse.y,0,0.5,0.5,4,"projectile")
    pulse.lindex = #shader.projectiles

    --offset based on direction
    if  math.abs( fx ) > math.abs( fy ) then
        if fx > 0 then      --right
            pulse.x = pulse.x + 64
            pulse.y = pulse.y + 32
        else                --left
            pulse.x = pulse.x - 8
            pulse.y = pulse.y + 32
        end
    else
        if fy > 0 then      --down
            pulse.x = pulse.x + 32
            pulse.y = pulse.y + 6
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
        updateLight(self.lindex,self.x,self.y)

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
            table.remove(shader.placement,pulses[i].lindex)
            table.remove(pulses,i)
        end
        i = i-1
    end
end

function pulses:draw(layer)
    for _,a in ipairs(pulses) do
        love.graphics.draw(sprites.pulse, a.x,a.y,a.rot,2,2,sprites.pulse:getWidth(),sprites.pulse:getHeight())
    end
end
        
