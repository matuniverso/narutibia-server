local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, true)

function onGetFormulaValues(player, level, magicLevel)
	local min = (level * 70) + (magicLevel * 110)
	local max = min + 500
	return -min, -max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

function onCastSpell(creature, variant)
	local target = Creature(variant:getNumber())
	local pos = target:getPosition()
    pos = Position(pos.x + 1, pos.y + 1, pos.z)
	pos:sendMagicEffect(603)

	return combat:execute(creature, variant)
end