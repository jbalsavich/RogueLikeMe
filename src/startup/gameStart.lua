function gameStart()
    math.randomseed(os.time())

    love.graphics.setDefaultFilter("nearest","nearest")


    setWindowSize(true,1360,840)
    setScale()

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

