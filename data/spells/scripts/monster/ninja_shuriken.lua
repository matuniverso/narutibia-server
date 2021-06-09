local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, 21)
combat:setFormula(COMBAT_FORMULA_DAMAGE, -500, 0, -1000, 0)

function onCastSpell(creature, variant)
	return combat:execute(creature, variant)
end