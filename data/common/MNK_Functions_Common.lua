-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	-- Default macro set/book
	if player.sub_job == 'WAR' then
		set_macro_page(1, 2)
	else
		set_macro_page(1, 2)
	end
end

function job_tick()
	if check_buff() then return true end
	if check_jump() then return true end
	return false
end

function job_filtered_action(spell, eventArgs)
	if spell.type == 'WeaponSkill' then
		local available_ws = S(windower.ffxi.get_abilities().weapon_skills)
		if available_ws:contains(176) then
            if spell.english == "Tornado Kick" then
				windower.chat.input('/ws "Shell Crusher" '..spell.target.raw)
				windower.send_command:schedule(1.2,'gs c set weapons Verethragna;')
                cancel_spell()
				eventArgs.cancel = true
            elseif spell.english == "Howling Fist" then
                send_command('@input /ws "Shell Crusher" '..spell.target.raw)
				windower.send_command:schedule(1.2,'gs c set weapons Verethragna;')
                cancel_spell()
				eventArgs.cancel = true
            elseif spell.english == "Victory Smite" then
                send_command('@input /ws "Shell Crusher" '..spell.target.raw)
				windower.send_command:schedule(1.2,'gs c set weapons Verethragna;')
                cancel_spell()
				eventArgs.cancel = true
			end
        end
	end
end

function check_buff()
	if state.AutoBuffMode.value ~= 'Off' and player.in_combat and player.status == 'Engaged' then
		local abil_recasts = windower.ffxi.get_ability_recasts()

		if player.hpp < 57 and abil_recasts[15] < latency then
			windower.chat.input('/ja "Chakra" <me>')
			tickdelay = os.clock() + 3.1
			return true
		elseif not (buffactive.Impetus or buffactive.Footwork) and abil_recasts[31] < latency then
			windower.chat.input('/ja "Impetus" <me>')
			tickdelay = os.clock() + 3.1
			return true
		elseif not (buffactive.Footwork or buffactive.Impetus) and abil_recasts[21] < latency then
			windower.chat.input('/ja "Footwork" <me>')	
			tickdelay = os.clock() + 3.1
			return true
		elseif not (buffactive.Aggressor or buffactive.Focus) and abil_recasts[13] < latency then
			windower.chat.input('/ja "Focus" <me>')
			tickdelay = os.clock() + 3.1
			return true
		elseif not buffactive.Dodge and abil_recasts[14] < latency then
			windower.chat.input('/ja "Dodge" <me>')
			tickdelay = os.clock() + 3.1
			return true
		elseif player.sub_job == 'WAR' and not state.Buff['SJ Restriction'] then
			if not (buffactive.Aggressor or buffactive.Focus) and abil_recasts[4] < latency then
				windower.chat.input('/ja "Aggressor" <me>')
				tickdelay = os.clock() + 3.1
				return true
			elseif not buffactive.Berserk and abil_recasts[1] < latency then
				windower.chat.input('/ja "Berserk" <me>')
				tickdelay = os.clock() + 3.1
				return true
			else
				return false
			end
		end
	end

	return false
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

--autows_list = {['Verethragna']="Victory Smite",['Godhands']='Howling Fist'}