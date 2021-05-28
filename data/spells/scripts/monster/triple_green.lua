local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, 65)
combat:setFormula(COMBAT_FORMULA_DAMAGE, -1000, 0, -2000, 0)

function onCastSpell(creature, variant)
	local target = Creature(variant:getNumber())
	for i = 0, 2 do
		addEvent(function ()
			local pos = target:getPosition()
            pos = Position(pos.x + 1, pos.y + 1, pos.z)
			pos:sendMagicEffect(517)
			return combat:execute(creature, variant)
		end, i * 300)
	end
	return true
end