local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setArea(createCombatArea(AREA_SQUARE2X2))

function onGetFormulaValues(player, level, magicLevel)
	local min = (level * 5) + (magicLevel * 5)
	local max = (level * 5) + (magicLevel * 5) + 1000
	return -min, -max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

function onCastSpell(creature, variant, isHotkey)
    local pos = creature:getPosition()
    pos = Position(pos.x + 2, pos.y + 2, pos.z)
    pos:sendMagicEffect(83)

    for i = 0, 1 do
        addEvent(function ()
            return combat:execute(creature, variant)
        end, i * 500)
    end
    return true
end