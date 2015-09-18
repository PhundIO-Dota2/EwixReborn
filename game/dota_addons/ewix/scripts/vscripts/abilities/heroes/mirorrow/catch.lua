function Catch( keys )
	local caster = keys.caster
    local target = keys.target
    local ability = keys.ability

    local catch_duration = ability:GetLevelSpecialValueFor("catch_duration", ability:GetLevel() - 1)

    particle = ParticleManager:CreateParticle("particles/units/heroes/hero_batrider/batrider_flaming_lasso.vpcf", PATTACH_CUSTOMORIGIN, caster)

    ParticleManager:SetParticleControlEnt(particle, 0, caster, PATTACH_POINT_FOLLOW, "attach_attack1", caster:GetAbsOrigin() + Vector(0,0,16), true)
    ParticleManager:SetParticleControlEnt(particle, 1, target, PATTACH_POINT_FOLLOW, "attach_hitloc", target:GetAbsOrigin() + Vector(0,0,16), true)
    --ParticleManager:SetParticleControlEnt(particle, 2, caster, PATTACH_ABSORIGIN_FOLLOW, "attach_hitloc", Vector(10,0,0), true)

	ability:ApplyDataDrivenModifier(caster, target, "mirorrow_catch_catched", {Duration = catch_duration})

	Timers:CreateTimer(catch_duration, function ()
		ParticleManager:DestroyParticle(particle, false)
	end)
end

function Pulling( keys )
	local caster = keys.caster
    local target = keys.target
    local ability = keys.ability

    local caster_position = caster:GetAbsOrigin()
    local target_position = target:GetAbsOrigin()

    if (caster_position - caster_position):Length() > 30 then return end

    local angle =math.atan2(target_position.y - caster_position.y, target_position.x - caster_position.x)

    target_position.x = target_position.x - (math.cos(angle) * 32)
	target_position.y = target_position.y - (math.sin(angle) * 32)

	FindClearSpaceForUnit(target, target_position, false)
end