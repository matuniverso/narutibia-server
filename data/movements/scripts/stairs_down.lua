function onStepIn(creature, item, position, fromPosition)
    local toPosition = Position(position.x - 1, position.y, position.z + 1)

    creature:teleportTo(toPosition, true)
    creature:setDirection(2)
    return true
end