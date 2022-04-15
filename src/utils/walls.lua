--make a function so that you cannot leave the map
function check_walls(x,y)
    if x < 0 or x > map.width or y < 0 or y > map.height then
        return true
    end
    return false
end