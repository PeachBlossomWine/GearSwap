-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'WAR' then
        set_macro_page(1, 12)
    else
        set_macro_page(1, 12)
    end
end

function job_precast(spell, spellMap, eventArgs)

	if spell.type == 'WeaponSkill' and state.AutoBuffMode.value ~= 'Off' then
		local abil_recasts = windower.ffxi.get_ability_recasts()
		if player.tp > 1850 and abil_recasts[140] < latency and not silent_check_amnesia() then
			eventArgs.cancel = true
			windower.chat.input('/ja "Sekkanoki" <me>')
			windower.chat.input:schedule(1,'/ws "'..spell.english..'" '..spell.target.raw..'')
			tickdelay = os.clock() + 1.25
			return
		elseif abil_recasts[134] < latency and not silent_check_amnesia() then
			eventArgs.cancel = true
			windower.chat.input('/ja "Meditate" <me>')
			windower.chat.input:schedule(1,'/ws "'..spell.english..'" '..spell.target.raw..'')
			tickdelay = os.clock() + 1.25
			return
		elseif player.tp < 1500 and not buffactive['Sekkanoki'] and abil_recasts[54] < latency and not silent_check_amnesia() then
			eventArgs.cancel = true
			windower.chat.input('/ja "Hagakure" <me>')
			windower.chat.input:schedule(1,'/ws "'..spell.english..'" '..spell.target.raw..'')
			tickdelay = os.clock() + 1.25
			return
		end
	elseif spell.type == 'WeaponSkill' and spell.name == 'Tachi: Ageha' then
		windower.send_command:schedule(1.5,'gs c autows Tachi: Fudo')
	end

end

function job_filtered_action(spell, eventArgs)
	if spell.type == 'WeaponSkill' then
		local available_ws = S(windower.ffxi.get_abilities().weapon_skills)
		-- WS 112 is Double Thrust, meaning a Spear is equipped.
		if available_ws:contains(112) then
            if spell.english == "Tachi: Fudo" then
				windower.chat.input('/ws "Impulse Drive" '..spell.target.raw)
                cancel_spell()
				eventArgs.cancel = true
            elseif spell.english == "Tachi: Shoha" then
                send_command('@input /ws "Sonic Thrust" '..spell.target.raw)
                cancel_spell()
				eventArgs.cancel = true
            elseif spell.english == "Tachi: Rana" then
                send_command('@input /ws "Penta Thrust" '..spell.target.raw)
                cancel_spell()
				eventArgs.cancel = true
            elseif spell.english == "Tachi: Hobaku" then
                send_command('@input /ws "Leg Sweep" '..spell.target.raw)
                cancel_spell()
				eventArgs.cancel = true
            end
		-- Club
		elseif available_ws:contains(160) then
			 if spell.english == "Tachi: Fudo" then
				windower.chat.input('/ws "Judgement" '..spell.target.raw)
                cancel_spell()
				eventArgs.cancel = true
			end
        end
	end
end

function job_post_precast(spell, spellMap, eventArgs)

	if spell.type == 'WeaponSkill' then

		local WSset = standardize_set(get_precast_set(spell, spellMap))
		local wsacc = check_ws_acc()
		
		if (WSset.ear1 == "Moonshade Earring" or WSset.ear2 == "Moonshade Earring") then
			-- Replace Moonshade Earring if we're at cap TP
			if get_effective_player_tp(spell, WSset) > 3200 then
				if spell.skill == 25 then
					if wsacc:contains('Acc') and sets.RangedAccMaxTP then
						equip(sets.RangedAccMaxTP)
					elseif sets.RangedMaxTP then
						equip(sets.RangedMaxTP)
					else
					end
				else
					if wsacc:contains('Acc') and not buffactive['Sneak Attack'] and sets.AccMaxTP then
						local AccMaxTPset = standardize_set(sets.AccMaxTP)

						if (AccMaxTPset.ear1:startswith("Lugra Earring") or AccMaxTPset.ear2:startswith("Lugra Earring")) and not classes.DuskToDawn and sets.AccDayMaxTPWSEars then
							equip(sets.AccDayMaxTPWSEars[spell.english] or sets.AccDayMaxTPWSEars)
						else
							equip(sets.AccMaxTP[spell.english] or sets.AccMaxTP)
						end
					elseif sets.MaxTP then
						local MaxTPset = standardize_set(sets.MaxTP)
						if (MaxTPset.ear1:startswith("Lugra Earring") or MaxTPset.ear2:startswith("Lugra Earring")) and not classes.DuskToDawn and sets.DayMaxTPWSEars then
							equip(sets.DayMaxTPWSEars[spell.english] or sets.DayMaxTPWSEars)
						else
							equip(sets.MaxTP[spell.english] or sets.MaxTP)
						end
					else
					end
				end
			else
				if wsacc:contains('Acc') and not buffactive['Sneak Attack'] and (WSset.ear1:startswith("Lugra Earring") or WSset.ear2:startswith("Lugra Earring")) and not classes.DuskToDawn and sets.AccDayWSEars then
					equip(sets.AccDayWSEars[spell.english] or sets.AccDayWSEars)
				elseif (WSset.ear1:startswith("Lugra Earring") or WSset.ear2:startswith("Lugra Earring")) and not classes.DuskToDawn and sets.DayWSEars then
					equip(sets.DayWSEars[spell.english] or sets.DayWSEars)
				end
			end
		elseif (WSset.ear1:startswith("Lugra Earring") or WSset.ear2:startswith("Lugra Earring")) and not classes.DuskToDawn then
			if wsacc:contains('Acc') and not buffactive['Sneak Attack'] and sets.AccDayWSEars then
				equip(sets.AccDayWSEars[spell.english] or sets.AccDayWSEars)
			elseif sets.DayWSEars then
				equip(sets.DayWSEars[spell.english] or sets.DayWSEars)
			end
		end
		
        if state.Buff.Sekkanoki then
            equip(sets.buff.Sekkanoki)
        end
        if state.Buff.Sengikori then
            equip(sets.buff.Sengikori)
        end
	elseif spell.type == 'JobAbility' then
		if spell.english:endswith('Jump') then
			if sets.precast.JA[spell.english] then
				if sets.precast.JA[spell.english][state.OffenseMode.value] then
					equip(sets.precast.JA[spell.english][state.OffenseMode.value])
				end
			end
		end
	end
end

function job_tick()
	if check_hasso() then return true end
	if check_jump() then return true end
	if check_buff() then return true end
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

function check_buff()
	if state.AutoBuffMode.value ~= 'Off' and player.in_combat and not silent_check_amnesia() then
		
		local abil_recasts = windower.ffxi.get_ability_recasts()

		if player.sub_job == 'WAR' and not state.Buff['SJ Restriction'] and not buffactive.Aggressor and abil_recasts[4] < latency then
			windower.chat.input('/ja "Aggressor" <me>')
			tickdelay = os.clock() + 1.1
			return true
		-- elseif player.sub_job == 'WAR' and not buffactive.Berserk and abil_recasts[1] < latency then
			-- windower.chat.input('/ja "Berserk" <me>')
			-- tickdelay = os.clock() + 1.1
			-- return true

		else
			return false
		end
	end
		
	return false
end

function check_hasso()
	if not (state.Stance.value == 'None' or state.Buff.Hasso or state.Buff.Seigan) and player.status == 'Engaged' and not silent_check_amnesia() then
		
		local abil_recasts = windower.ffxi.get_ability_recasts()
		local available_ws = S(windower.ffxi.get_abilities().weapon_skills)
		
		if state.Stance.value == 'Hasso' and abil_recasts[138] < latency and (available_ws:contains(112) or available_ws:contains(144)) then
			windower.chat.input('/ja "Hasso" <me>')
			tickdelay = os.clock() + 1.1
			return true
		elseif state.Stance.value == 'Seigan' and abil_recasts[139] < latency and (available_ws:contains(112) or available_ws:contains(144)) then
			windower.chat.input('/ja "Seigan" <me>')
			tickdelay = os.clock() + 1.1
			return true
		else
			return false
		end
	end

	return false
end
