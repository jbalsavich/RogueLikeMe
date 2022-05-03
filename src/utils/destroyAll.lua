function destroyAll()
    colliderTableDestroy(walls)
    colliderTableDestroy(ground)

    for i=#enemies,1,-1 do
        if enemies[i].physics ~= nil then
            enemies[i].physics:destroy()
        end
    end
end

function colliderTableDestroy(tableList)
    local i = #tableList
    while i > 0 do
        if tableList[i] ~= nil then
            tableList[i]:destroy()
        end
        table.remove(tableList,i)
        i = i-1
    end
end

function removeTable(tableList)
    local i = #tableList
    while i > 0 do
        table.remove(tableList, i)
        i = i-1
    end
end