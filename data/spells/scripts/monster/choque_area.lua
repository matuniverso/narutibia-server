local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setArea(createCombatArea(AREA_SQUARE2X2))
combat:setFormula(COMBAT_FORMULA_DAMAGE, -1000, 0, -2000, 0)

function onCastSpell(creature, variant)
    local pos = creature:getPosition()
    pos = Position(pos.x + 1, pos.y + 1, pos.z)
    pos:sendMagicEffect(97)

    return combat:execute(creature, variant)
end