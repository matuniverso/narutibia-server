local monster = "Invocation"
local maxSummon = 1

function onCastSpell(creature, variant)
	local monsterType = MonsterType(monster)
	if not monsterType or not monsterType:isSummonable() or #creature:getSummons() >= maxSummon then
		return false
	end

    local pos = creature:getPosition()
	local summon = Game.createMonster(monster, pos, true)
	if not summon then
		return false
	end

	pos = summon:getPosition()
	pos = Position(pos.x + 1, pos.y, pos.z)
	pos:sendMagicEffect(154)
	creature:addSummon(summon)
	return true
end