local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, 135)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, true)

function onGetFormulaValues(player, level, magicLevel)
	local min = (level * 150) + (magicLevel * 150)
	local max = min + 1000
	return -min, -max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

function onCastSpell(creature, variant)
	local target = Creature(variant:getNumber())
	local pos = target:getPosition()
    pos = Position(pos.x + 7, pos.y, pos.z)
	pos:sendMagicEffect(599)

	return combat:execute(creature, variant)
end