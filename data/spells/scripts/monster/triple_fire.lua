local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, 120)
combat:setFormula(COMBAT_FORMULA_DAMAGE, -8000, 0, -8000, 0)

function onCastSpell(creature, variant)
	local target = Creature(variant:getNumber())
	for i = 0, 2 do
		addEvent(function ()
			local pos = target:getPosition()
            pos = Position(pos.x, pos.y, pos.z)
			pos:sendMagicEffect(111)
			return combat:execute(creature, variant)
		end, i * 300)
	end
	return true
end