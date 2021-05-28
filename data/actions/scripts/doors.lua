function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local itemId = item:getId()
	if table.contains(doors, itemId) then
		local doorCreatures = Tile(toPosition):getCreatures()
		if #doorCreatures > 0 then
			for _, doorCreature in pairs(doorCreatures) do
                local position = doorCreature:getPosition()
                position:getNextPosition(doorCreature:getDirection(), 1)
                position = doorCreature:getClosestFreePosition(position, false)
				player:teleportTo(position, true)
			end
		end

		item:transform(table.find(doors, itemId))
		return true
    elseif doors[itemId] then
        item:transform(doors[itemId])
        player:teleportTo(toPosition, true)
        return true
	end
	return false
end