function onSay(player, words, param)
	if not player:getGroup():getAccess() then
		return true
	end

	if player:getAccountType() < ACCOUNT_TYPE_GOD then
		return false
	end

	local position = player:getPosition()
	local monster = Game.createMonster(param, position)
	if monster then
		player:addSummon(monster)
		position:sendMagicEffect(300)
	else
		player:sendCancelMessage("There is not enough room.")
		position:sendMagicEffect(3)
	end
	return false
end
