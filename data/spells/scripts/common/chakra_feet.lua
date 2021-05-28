local combat = Combat()
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, false)

local condition = Condition(CONDITION_HASTE)
condition:setParameter(CONDITION_PARAM_TICKS, 33000)
condition:setFormula(0.4, -6, 0.4, -6)
combat:addCondition(condition)

function onCastSpell(creature, variant)
	local pos = creature:getPosition()
	pos:sendMagicEffect(300)
    
	return combat:execute(creature, variant)
end