local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, true)

function onGetFormulaValues(player, level, magicLevel)
	local min = (level * 100) + (magicLevel * 120)
	local max = min + 500
	return -min, -max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

function onCastSpell(creature, variant)
	local target = Creature(variant:getNumber())
	local pos = target:getPosition()
    pos = Position(pos.x + 2, pos.y, pos.z)
	pos:sendMagicEffect(486)

	return combat:execute(creature, variant)
end