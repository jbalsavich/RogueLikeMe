local function bunnyInit(enemy,x,y,args)
    enemy.physics = world:newBSGRectangleCollider(spriteSize*x,spriteSize*y, spriteSize*.6, spriteSize*1.4, spriteSize/4.5)
    enemy.physics:setCollisionClass('Enemy')
    enemy.physics:setFixedRotation(true)
    enemy.physics:setMass(1)
    enemy.physics:setLinearDamping(2)
    enemy.physics.parent = enemy

    enemy.sprite = sprites.bunnyDown
    
    enemy.health = 6
    enemy.speed = 0
    enemy.maxSpeed = 400
    enemy.magnitude = 800
    enemy.dir = vector(0,1)
    enemy.viewDistance = spriteSize*7
    enemy.closeness = spriteSize*4

    enemy.stunTimer = 0
    enemy.dizzyTimer = 0
    enemy.coolDown = 0


    function enemy:hit(damage, dit, stun, dizziness)
        self.health = self.health - damage
        self.physics:applyLinearImpulse((dir:normalized()*300):unpack())
        self.stunTimer = stun
        self.flashTimer = 0.15
        if damage == 0 then self.flashTimer = 0 end
        self.dizzyTimer = dizziness or 0
    end

    function enemy:update(dt)
        if self.stunTimer > 0 then
            self.stunTimer = self.stunTimer - dt
        end
        if self.stunTimer < 0 then
            self.stunTimer = 0
            self.physics:setLinearVelocity(0,0)
        end
        if self.coolDown > 0 then
            self.coolDown = self.coolDown - dt
        end
        if self.coolDown < 0 then
            self.coolDown = 0
            self.physics:setLinearVelocity(0,0)
        end
        if self.dizzyTimer > 0 then
            self.dizzyTimer = self.dizzyTimer - dt
        end
        if self.dizzyTimer < 0 then
            self.dizzyTimer = 0
        end

        if self.stunTimer == 0 and self.dizzyTimer == 0 then
            local px, py = player:getPosition()
            local ex, ey = self.physics:getPosition()

            if distanceBetween(px,py,ex,ey) < self.viewDistance and distanceBetween(px,py,ex,ey) > self.closeness then
                self.dir = vector(px - ex, py - ey):normalized() * self.magnitude
                if distanceBetween(0,0,self.physics:getLinearVelocity()) < self.maxSpeed then
                    self.physics:applyForce(self.dir:unpack())
                end
            end

            

            self:usePulse()

            if self.health <= 0 then
                self.dead = true
                self:die()
            end
            
        else
            
        end
    end

    function enemy:draw()
        setWhite()
        local ex,ey = self.physics:getPosition()
        local px,py = player:getPosition()
        local facing = getFromToVector(ex,ey,px,py) * 1.2
        local faceX,faceY = facing:unpack()
        local plDw = sprites.bunnyDown
        local plRt = sprites.bunnyRight
        
        if self.flashTimer > 0  then
            love.graphics.setColor(.8,.5,.5,1)
        end
        if  math.abs( faceX ) > math.abs( faceY ) then
            if faceX > 0 then
                love.graphics.draw(sprites.bunnyRight,ex,ey+20,0,2*spriteSize/plDw:getWidth(),2*spriteSize/plDw:getHeight(),plRt:getWidth()/2, plRt:getHeight()/1.25)
            else
                love.graphics.draw(sprites.bunnyLeft,ex,ey+20,0,2*spriteSize/plDw:getWidth(),2*spriteSize/plDw:getHeight(),plRt:getWidth()/2, plRt:getHeight()/1.25)
            end
        else
            if faceY > 0 then
                love.graphics.draw(sprites.bunnyDown,ex,ey+20,0,2*spriteSize/plDw:getWidth(),2*spriteSize/plDw:getHeight(),plRt:getWidth()/2, plRt:getHeight()/1.25)
            else
                love.graphics.draw(sprites.bunnyUp,ex,ey+20,0,2*spriteSize/plDw:getWidth(),2*spriteSize/plDw:getHeight(),plRt:getWidth()/2, plRt:getHeight()/1.25)
            end
        end
        setWhite()
    end
        
    function enemy:die()
        local ex,ey = self.physics:getPosition()
        local args = {}
        args.form = self.form
    end

    function enemy:usePulse()
        local ex,ey = self.physics:getPosition()
        if self.coolDown == 0 then
            self.coolDown = 1.5
            spawnPulse(ex,ey)
        end

    end
    
    return enemy

end

return bunnyInit
