function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local storages = {909090, 909091}

    if player:getStorageValue(storages[2]) == 1 then
        player:sendTextMessage(MESSAGE_INFO_DESCR, "You have already taken.")
        return false
    end

	if player:getStorageValue(storages[1]) == 1 then
        player:sendTextMessage(MESSAGE_INFO_DESCR, 'You have collected Gensai\'s Sword.')
        player:setStorageValue(storages[2], 1)
	else
		player:sendTextMessage(MESSAGE_INFO_DESCR, "You have no permission.")
	end
	return true
end
