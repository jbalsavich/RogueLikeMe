local shader_code = [[
#define NUM_LIGHTS 32
struct Light {
    vec2 position;
    vec3 diffuse;
    float power;
};
extern Light lights[NUM_LIGHTS];
extern int num_lights;
extern vec2 screen;
const float constant = 1.0;
const float linear = 0.09;
const float quadratic = 0.032;
vec4 effect(vec4 color, Image image, vec2 uvs, vec2 screen_coords){
    vec4 pixel = Texel(image, uvs);
    vec2 norm_screen = screen_coords / screen;
    vec3 diffuse = vec3(0);
    for (int i = 0; i < num_lights; i++) {
        Light light = lights[i];
        vec2 norm_pos = light.position / screen;
        

        //sfhdkfsd
        float distance = length(norm_pos - norm_screen) * screen.x / light.power;
        float attenuation = 1.0 / (constant + linear * distance + quadratic * (distance * distance));
        
        diffuse += light.diffuse * attenuation;
    }
    diffuse = clamp(diffuse, 0.0, 1.0);
    return pixel * vec4(diffuse, 1.0);
}
]]

local shader = nil
local image  = nil

function love.load()
    require("cam")
    require("gameStart")
    gameStart()

    px = love.graphics.getWidth()/2
    py = love.graphics.getHeight()/2
    speed = 256
    lvl = 8
    r = 1
    g = 1
    b = 1
    shader = love.graphics.newShader(shader_code)
    image = love.graphics.newImage("dungeonCrawler.png")
end

function love.update(dt)
    cam:update(dt)
    if love.keyboard.isDown("s") then
        py = py + speed * dt
    end
    if love.keyboard.isDown("w") then
        py = py - speed * dt
    end
    if love.keyboard.isDown("d") then
        px = px + speed * dt
    end
    if love.keyboard.isDown("a") then
        px = px - speed * dt
    end

    
end

function love.keypressed(key)
    if key == 'r' then
        r = 1-r
    end
    if key == 'g' then
        g = 1-g
    end
    if key == 'b' then
        b = 1-b
    end

    if key == 'up' then
        lvl = lvl+8
    end
    if key == 'down' then
        lvl = lvl-8
    end
end

function love.draw()
    love.graphics.setShader(shader)

    shader:send("screen", {
        love.graphics.getWidth(),
        love.graphics.getHeight()
    })

    shader:send("num_lights", 15)
    local tileSize = 64

    do
        local name = "lights[" .. 0 .."]"
        shader:send(name .. ".position", {tileSize*2,tileSize*4.5})
        shader:send(name .. ".diffuse", {1.0, 1.0, 1.0})
        shader:send(name .. ".power", 8)
    end
    
    --lights
    shader:send("lights[1].position", {tileSize*2,tileSize*7.5})
    shader:send("lights[1].diffuse",{1.0, 1.0, 1.0})
    shader:send("lights[1].power", 8)

    shader:send("lights[2].position", {tileSize*9.5,tileSize*3.5})
    shader:send("lights[2].diffuse",{1.0, 1.0, 1.0})
    shader:send("lights[2].power", 8)

    shader:send("lights[3].position", {tileSize*11,tileSize*3.5})
    shader:send("lights[3].diffuse",{1.0, 1.0, 1.0})
    shader:send("lights[3].power", 8)

    shader:send("lights[4].position", {tileSize*9,tileSize*5.5})
    shader:send("lights[4].diffuse",{1.0, 1.0, 1.0})
    shader:send("lights[4].power", 8)

    shader:send("lights[5].position", {tileSize*11,tileSize*5.5})
    shader:send("lights[5].diffuse",{1.0, 1.0, 1.0})
    shader:send("lights[5].power", 8)

    shader:send("lights[6].position", {tileSize*9,tileSize*7.5})
    shader:send("lights[6].diffuse",{1.0, 1.0, 1.0})
    shader:send("lights[6].power", 8)

    shader:send("lights[7].position", {tileSize*2.5,tileSize*10.5})
    shader:send("lights[7].diffuse",{1.0, 1.0, 1.0})
    shader:send("lights[7].power", 8)

    shader:send("lights[8].position", {tileSize*8.5,tileSize*10.5})
    shader:send("lights[8].diffuse",{1.0, 1.0, 1.0})
    shader:send("lights[8].power", 8)

    shader:send("lights[9].position", {tileSize*11.5,tileSize*11.5})
    shader:send("lights[9].diffuse",{1.0, 1.0, 1.0})
    shader:send("lights[9].power", 8)


    --spiders
    shader:send("lights[10].position", {tileSize*3.5,tileSize*4.5})
    shader:send("lights[10].diffuse",{1.0, 0.0, 0.0})
    shader:send("lights[10].power", 2)

    shader:send("lights[11].position", {tileSize*5.5,tileSize*5.25})
    shader:send("lights[11].diffuse",{1.0, 0.0, 0.0})
    shader:send("lights[11].power", 2)

    shader:send("lights[12].position", {tileSize*11.5,tileSize*2.5})
    shader:send("lights[12].diffuse",{1.0, 0.0, 0.0})
    shader:send("lights[12].power", 2)

    shader:send("lights[13].position", {tileSize*11.5,tileSize*3.5})
    shader:send("lights[13].diffuse",{1.0, 0.0, 0.0})
    shader:send("lights[13].power", 2)

    shader:send("lights[14].position", {px,py})
    shader:send("lights[14].diffuse",{r, g, b})
    shader:send("lights[14].power", lvl)



    love.graphics.draw(image, 0, 0)
    love.graphics.circle('fill',px,py,4)

    love.graphics.setShader()
end