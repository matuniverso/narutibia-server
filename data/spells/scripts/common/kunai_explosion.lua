local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, 24)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, true)

function onGetFormulaValues(player, level, magicLevel)
	local distanceSkill = player:getEffectiveSkillLevel(SKILL_DISTANCE)
	local min = (level / 5) + distanceSkill
	local max = (level / 5) + distanceSkill + 200
	return -min, -max
end

combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

function onCastSpell(creature, variant)
	local target = Creature(variant:getNumber())
	local pos = target:getPosition()
    pos = Position(pos.x + 1, pos.y + 1, pos.z)
	pos:sendMagicEffect(116)

	return combat:execute(creature, variant)
end