local seconds = 8

local combat = Combat()
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, false)

local condition = Condition(CONDITION_ATTRIBUTES)
condition:setParameter(CONDITION_PARAM_TICKS, seconds * 1000)
condition:setParameter(CONDITION_PARAM_BUFF_SPELL, true)
condition:setParameter(CONDITION_PARAM_SUBID, 10)
combat:addCondition(condition)

function onCastSpell(creature, variant)
    if not creature:isMonster() or creature:getCondition(CONDITION_ATTRIBUTES, CONDITIONID_COMBAT, 10) then
        return false
    end

    for i = 0, seconds do
        addEvent(function ()
            local pos = creature:getPosition()
            pos:sendMagicEffect(570)
        end, i * 1000)
    end
    return combat:execute(creature, variant)
end
