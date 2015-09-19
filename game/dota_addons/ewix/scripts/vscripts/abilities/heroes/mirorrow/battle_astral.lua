function HideCaster( event )
    event.caster:AddNoDraw()
end

function ShowCaster( event )
    event.caster:RemoveNoDraw()
end

function Damage( keys )
	local caster = keys.caster
    local target = keys.target
    local ability = keys.ability

    local agility_coef = ability:GetLevelSpecialValueFor("agility_coef", ability:GetLevel() - 1)

    local damageTable = {
	    victim = target,
	    attacker = caster,
	    damage = agility_coef * caster:GetAgility(),
	    damage_type = DAMAGE_TYPE_PURE,
	}
	ApplyDamage(damageTable)
end

function Heal( keys )
	local caster = keys.caster
    local ability = keys.ability

    local agility_coef = ability:GetLevelSpecialValueFor("agility_coef", ability:GetLevel() - 1)
    local duration = ability:GetDuration()

    caster:Heal((agility_coef * caster:GetAgility()) / duration * 0.3, caster) 
end