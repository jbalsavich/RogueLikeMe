function gameStart()
    math.randomseed(os.time())
    love.graphics.setDefaultFilter('nearest', 'nearest')

    require("src/startup/require)
    requireAll()
end