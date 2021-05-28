function onSay(player, words, param)
	if not player:getGroup():getAccess() then
		return true
	end

    local steps = tonumber(param)
    if not steps then
		steps = 1
	end

    local position = player:getPosition()
    position:getNextPosition(player:getDirection(), steps)
    position = player:getClosestFreePosition(position, false)

	if Tile(position) then
		player:teleportTo(position, false)
	else
		player:sendCancelMessage("You cannot teleport there.")
		player:getPosition():sendMagicEffect(3)
	end
	return false
end
