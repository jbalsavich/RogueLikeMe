function destroyAll()
    colliderTableDestroy(walls)
    colliderTableDestroy(transitions)

    removeTable(loots)
    removeTable(effects)
    removeTable(npcs)

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