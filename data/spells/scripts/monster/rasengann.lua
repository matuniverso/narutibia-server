local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setFormula(COMBAT_FORMULA_DAMAGE, -400, 0, -800, 0)

function onCastSpell(creature, variant)
	local target = Creature(variant:getNumber())
	local pos = target:getPosition()
    pos = Position(pos.x + 1, pos.y + 1, pos.z)
	pos:sendMagicEffect(202)

	return combat:execute(creature, variant)
end