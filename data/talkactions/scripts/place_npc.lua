function onSay(player, words, param)
	if not player:getGroup():getAccess() then
		return true
	end

	if player:getAccountType() < ACCOUNT_TYPE_GOD then
		return false
	end

	local position = player:getPosition()
	local npc = Game.createNpc(param, position)
	local capitalized = param:sub(1,1):upper() .. param:sub(2)
	if not npc then
		player:sendCancelMessage("The npc " .. capitalized .. " does not exist.")
		position:sendMagicEffect(3)
        return false
	end

    npc:setMasterPos(position)
    position:sendMagicEffect(360)
	return false
end
