function onSay(player, words, param)
	if not player:getGroup():getAccess() then
		return true
	end

	if player:getAccountType() < ACCOUNT_TYPE_GOD then
		return false
	end

	local position = player:getPosition()
	local monster = Game.createMonster(param, position)
	local capitalized = param:sub(1,1):upper() .. param:sub(2)
	if not monster then
		player:sendCancelMessage("The monster " .. capitalized .. " does not exist.")
		position:sendMagicEffect(3)
        return false
	end

    position:sendMagicEffect(360)
	return false
end
