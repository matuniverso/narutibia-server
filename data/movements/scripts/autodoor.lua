function onStepIn(creature, item, position, fromPosition)
    if creature:isMonster() then
        return false
    end

    local area = {
        from = Position(position.x - 2, position.y - 2, position.z),
        to = Position(position.x + 2, position.y + 2, position.z),
    }

    for i = area.from,  area.to do
        if Tile(pos):getId() == 17352 then
            pos:transform(17354)
            -- addEvent(function ()
            --     pos:transform(17360)
            -- end, 300
        elseif Tile(pos):getId() == 17353 then
            pos:transform(17355)
            -- addEvent(function ()
            --     pos:transform(17361)
            -- end, 300)
        end
    end
    return true
end

function onStepOut(creature, item, position, fromPosition)
    if creature:isMonster() then
        return false
    end


    print('sai')
    return true
end