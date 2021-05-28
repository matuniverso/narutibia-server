function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local storage = 35001
	local playerCap = player:getFreeCapacity()
	local itemWeight = 0
	local items = {14163, 13603, 13604, 13605, 13606, 12716, 12736}
	
	for _, v in pairs(items) do
		itemWeight = itemWeight + ItemType(v):getWeight()
	end

	if player:getStorageValue(storage) < 1 then
		if playerCap >= itemWeight then
			for _, i in pairs(items) do
				player:addItem(i, 1)
			end
			player:sendTextMessage(MESSAGE_INFO_DESCR, 'Você recebeu seus equipamentos iniciais.')
			player:setStorageValue(storage, 1)
		else
			player:sendTextMessage(MESSAGE_INFO_DESCR, 'Você não possui cap suficiente.')
		end
	else
		player:sendTextMessage(MESSAGE_INFO_DESCR, "Está vazio.")
	end
	return true
end
