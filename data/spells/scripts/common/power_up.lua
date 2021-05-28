local seconds = 30

local combat = Combat()
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, false)

local condition = Condition(CONDITION_ATTRIBUTES)
condition:setParameter(CONDITION_PARAM_SUBID, 10)
condition:setParameter(CONDITION_PARAM_TICKS, seconds * 1000)
condition:setParameter(CONDITION_PARAM_SKILL_MELEE, 10)
condition:setParameter(CONDITION_PARAM_SKILL_DISTANCE, 10)
condition:setParameter(CONDITION_PARAM_SKILL_SHIELD, 10)
condition:setParameter(CONDITION_PARAM_STAT_MAGICPOINTS, 10)
condition:setParameter(CONDITION_PARAM_BUFF_SPELL, true)
combat:addCondition(condition)

function onCastSpell(creature, variant)
    if not creature:isPlayer() or creature:getCondition(CONDITION_ATTRIBUTES, CONDITIONID_COMBAT, 10) then
        creature:sendCancelMessage("You have to wait "..seconds.." seconds to use it again.")
        return false
    end

    for i = 0, seconds do
        addEvent(function ()
            local pos = creature:getPosition()
            pos:sendMagicEffect(574)
        end, i * 1000)
    end
    return combat:execute(creature, variant)
end
