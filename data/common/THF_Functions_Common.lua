function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'WAR' then
        set_macro_page(1, 6)
    else
        set_macro_page(1, 6)
    end
end

function job_filtered_action(spell, eventArgs)
	if spell.type == 'WeaponSkill' then
		local available_ws = S(windower.ffxi.get_abilities().weapon_skills)
		-- WS 112 is Double Thrust, meaning a Spear is equipped.
		if available_ws:contains(32) then
            if spell.english == "Rudra's Storm" then
				windower.chat.input('/ws "Savage Blade" '..spell.target.raw)
                cancel_spell()
				eventArgs.cancel = true
            end
		elseif available_ws:contains(1) then
            if spell.english == "Rudra's Storm" then
				windower.chat.input('/ws "Asuran Fists" '..spell.target.raw)
                cancel_spell()
				eventArgs.cancel = true
            end
        end
	end
end

function job_tick()
	if check_auto_buff() then return true end
	return false
end

function check_auto_buff()
	if state.AutoBuffMode.value ~= 'Off' and player.in_combat and player.status == 'Engaged' then
		
		local abil_recasts = windower.ffxi.get_ability_recasts()

		if not buffactive['Conspirator'] and abil_recasts[40] < latency then
			windower.chat.input('/ja "Conspirator" <me>')
			tickdelay = os.clock() + 3.1
			return true
		elseif not buffactive['Bully'] and abil_recasts[240] < latency and player.target.type == "MONSTER" then
			windower.chat.input('/ja "Bully" <t>')
			tickdelay = os.clock() + 3.1
			return true
		elseif player.sub_job == 'DRK' and not state.Buff['SJ Restriction'] and not buffactive['Last Resort'] and abil_recasts[87] < latency then
			windower.chat.input('/ja "Last Resort" <me>')
			tickdelay = os.clock() + 3.1
			return true
		elseif player.sub_job == 'WAR' and not state.Buff['SJ Restriction'] and not buffactive.Berserk and abil_recasts[1] < latency then
			windower.chat.input('/ja "Berserk" <me>')
			tickdelay = os.clock() + 3.1
			return true
		elseif player.sub_job == 'WAR' and not state.Buff['SJ Restriction'] and not buffactive.Aggressor and abil_recasts[4] < latency then
			windower.chat.input('/ja "Aggressor" <me>')
			tickdelay = os.clock() + 3.1
			return true
		end
		
		return false
	end
end