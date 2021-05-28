function onSay(player, words, param)
	if not player:getGroup():getAccess() then
		return true
	end

	local creature = Creature(param)
	if not creature then
		player:sendCancelMessage("A creature with that name could not be found.")
		player:getPosition():sendMagicEffect(3)
		return false
	end

	local oldPosition = creature:getPosition()
	local newPosition = creature:getClosestFreePosition(player:getPosition(), false)
	if not Tile(newPosition) then
		player:sendCancelMessage("You can not teleport " .. creature:getName() .. " here.")
		player:getPosition():sendMagicEffect(3)
		return false
	elseif creature:teleportTo(newPosition) then
		if not creature:isInGhostMode() then
			oldPosition:sendMagicEffect(13)
			newPosition:sendMagicEffect(13)
		end
	end
	return false
end
