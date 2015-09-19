function Mirror( keys )
	local caster = keys.caster
    local target = keys.target
    local ability = keys.ability

    local player = caster:GetPlayerID()

    local unit_name = target:GetUnitName()
    local origin = target:GetAbsOrigin() + RandomVector(100)

    local threshold = ability:GetLevelSpecialValueFor( "level_threshold", ability:GetLevel() - 1 )
    local duration = ability:GetLevelSpecialValueFor( "illusion_duration", ability:GetLevel() - 1 )

    if target:GetLevel() > threshold then return false end

    local illusion = CreateUnitByName(unit_name, origin, true, caster, nil, caster:GetTeamNumber())
    illusion:SetOwner(caster)
    illusion:SetControllableByPlayer(player, true)

    illusion:AddNewModifier(illusion, nil, "modifier_kill", {duration = 240})
end