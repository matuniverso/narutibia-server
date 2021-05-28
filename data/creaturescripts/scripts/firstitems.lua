local items = {
    14163, -- Backpack
    12736, -- Shuriken
    12716, -- Kunai
}

function onLogin(player)
	if player:getLastLoginSaved() == 0 then
        local pos = player:getPosition()
        pos:sendMagicEffect(360)

		for i = 1, #items do
			player:addItem(items[i], 1)
		end
	end
	return true
end
