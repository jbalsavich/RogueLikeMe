shader_code = [[
#define NUM_LIGHTS 64
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
        

        float distance = length(norm_pos - norm_screen) * screen.x / light.power;
        float attenuation = 1.0 / (constant + linear * distance + quadratic * (distance * distance));
        
        diffuse += light.diffuse * attenuation;
    }
    diffuse = clamp(diffuse, 0.0, 1.0);
    return pixel * vec4(diffuse, 1.0);
}
]]



function gameStart()
    math.randomseed(os.time())

    love.graphics.setDefaultFilter("nearest","nearest")

    setWindowSize(false,770,770)
    setScale()

    vector = require "libraries/plugins/hump/vector"

    local windfield = require "libraries/plugins/windfield"    
    world = windfield.newWorld(0,0,false)
    shader = {}
    shader.lighting = love.graphics.newShader(shader_code)
    shader.placement = {}
    shader.projectiles = {}

    require("src/startup/require")
    requireAll()
end

function setWindowSize(full,width,height)
    if full then
        love.window.setFullscreen(true)
        windowWidth = love.graphics.getWidth()
        windowHeight = love.graphics.getHeight()
    else
        if width == nil or height == nil then
            windowWidth = 1920
            windowHeight = 1080
        else
            windowWidth = width
            windowHeight = height
        end
        love.window.setMode(windowWidth,windowHeight,flags)
    end
end

function setScale(input)
    scale = (7.5 / 100) * windowHeight

    if input == "zone" then 
        scale = (6.25 / 1200) * windowHeight
    end

end



