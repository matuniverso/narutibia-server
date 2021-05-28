local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setArea(createCombatArea(AREA_3TILES))

function onGetFormulaValues(player, level, magicLevel)
    local min = (level * 2) + (magicLevel * 10)
    local max = (level * 2) + (magicLevel * 10) + 1000
    return -min, -max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

function onCastSpell(creature, variant, isHotkey)
    local direction = creature:getDirection()
    local pos = creature:getPosition()

    if direction == 0 then
        pos = Position(pos.x + 1, pos.y - 1, pos.z)
        pos:sendMagicEffect(476)
    elseif direction == 1 then
        pos = Position(pos.x + 2, pos.y + 1, pos.z)
        pos:sendMagicEffect(478)
    elseif direction == 2 then
        pos = Position(pos.x + 1, pos.y + 2, pos.z)
        pos:sendMagicEffect(477)
    elseif direction == 3 then
        pos = Position(pos.x - 1, pos.y + 1, pos.z)
        pos:sendMagicEffect(479)
    end

    return combat:execute(creature, variant)
end
