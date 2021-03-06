function onSay(player, words, param)
	if not player:getGroup():getAccess() then
		return true
	end

	if player:getAccountType() < ACCOUNT_TYPE_GOD then
		return false
	end

	local isGhost = not player:isInGhostMode()

	player:setGhostMode(isGhost)
	if isGhost then
		player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "You are now invisible.")
	else
		player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "You are visible again.")
	end
	return false
end
