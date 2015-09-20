function Purge( keys )
	local caster = keys.caster
    local target = keys.target
    local ability = keys.ability

    target:Purge(true, true, true, true, true)
end