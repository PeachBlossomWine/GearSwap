step_timer = 0

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'WAR' then
        set_macro_page(1, 13)
    elseif player.sub_job == 'SAM' then
	    set_macro_page(1, 13)
    else
        set_macro_page(1, 13)
    end
end

function job_filtered_action(spell, eventArgs)
	if spell.type == 'WeaponSkill' then
		local available_ws = S(windower.ffxi.get_abilities().weapon_skills)
		-- WS 1 is Combo, h2h equipped.
		if available_ws:contains(1) then
            if spell.english == "Pyrrhic Kleos" then
				windower.chat.input('/ws "Asuran Fists" '..spell.target.raw)
                cancel_spell()
				eventArgs.cancel = true
            elseif spell.english == "Rudra's Storm" then
                windower.chat.input('/ws "Asuran Fists" '..spell.target.raw)
                cancel_spell()
				eventArgs.cancel = true
            end
        end
	end
end

function job_precast(spell, spellMap, eventArgs)

	-- Flourish WS
	if spell.type == 'WeaponSkill' and state.AutoBuffMode.value ~= 'Off' and not silent_check_amnesia() then
		local abil_recasts = windower.ffxi.get_ability_recasts()
		if not under3FMs() and not state.Buff['Building Flourish'] and not state.Buff['Presto'] and abil_recasts[226] < latency and player.status == 'Engaged'  then
			eventArgs.cancel = true
			windower.chat.input('/ja "Climactic Flourish" <me>')
			windower.chat.input:schedule(1.6,'/ws "'..spell.english..'" '..spell.target.raw..'')
			tickdelay = os.clock() + 2.8
			return
		elseif not under3FMs() and not state.Buff['Climactic Flourish'] and not state.Buff['Presto'] and abil_recasts[222] < latency and player.status == 'Engaged' then
			eventArgs.cancel = true
			windower.chat.input('/ja "Building Flourish" <me>')
			windower.chat.input:schedule(1.6,'/ws "'..spell.english..'" '..spell.target.raw..'')
			tickdelay = os.clock() + 2.8
			return
		end
	end
	
end

--Steps only on presto with enough TP
function check_steps_presto()

	local abil_recasts = windower.ffxi.get_ability_recasts()

	if state.AutoBuffMode.value ~= 'off' and state.AutoPrestoMode.value and player.tp > 140 and not silent_check_amnesia() then
		--if (under3FMs() or state.MaintainStep.value == 'on') and (abil_recasts[236] < latency or state.Buff['Presto']) and abil_recasts[220] < latency and player.status == 'Engaged' then
		
		if (under3FMs() or os.clock() > step_timer) and (abil_recasts[236] < latency or state.Buff['Presto']) and abil_recasts[220] < latency and player.status == 'Engaged' then
			if player.tp > 140 and state.Buff['Presto'] then
				windower.add_to_chat('Already have Presto')
				windower.chat.input('/ja "'..state.MainStep.value..'" <t>')
				tickdelay = os.clock() + 3.5
				step_timer = os.clock() + 30
				return true
			elseif player.tp > 140 and abil_recasts[236] < latency then
				windower.add_to_chat('Using Presto JA')
				windower.chat.input('/ja "Presto" <me>')
				tickdelay = os.clock() + 3.5
				return true
			else
				return false
			end
		end
	end

end

function check_jump()
    if state.AutoJumpMode.value and player.status == 'Engaged' and player.sub_job == 'DRG' and not buffactive['SJ Restriction'] then
        local abil_recasts = windower.ffxi.get_ability_recasts()

		if player.hpp < 65 and abil_recasts[160] < latency then
			windower.chat.input('/ja "Super Jump" <t>')
            tickdelay = os.clock() + 1.1
            return true
		elseif player.tp < 901 and abil_recasts[158] < latency then
            windower.chat.input('/ja "Jump" <t>')
            tickdelay = os.clock() + 1.1
            return true
        elseif player.tp < 901 and abil_recasts[159] < latency then
            windower.chat.input('/ja "High Jump" <t>')
            tickdelay = os.clock() + 1.1
            return true
        else
            return false
        end
    end
end

function job_tick()
	if check_dance() then return true end
	if check_buff() then return true end
	if check_steps_presto() then return true end
	if check_jump() then return true end
	return false
end

--data.equipment.mythic_weapons = S{}