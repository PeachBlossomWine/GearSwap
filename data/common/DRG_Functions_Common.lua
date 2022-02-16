-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'WAR' then
        set_macro_page(2, 14)
    elseif player.sub_job == 'SAM' then
        set_macro_page(1, 14)
    else
        set_macro_page(3, 14)
    end
end

function job_post_precast(spell, spellMap, eventArgs)
	if spell.type == 'WeaponSkill' then
		local WSset = standardize_set(get_precast_set(spell, spellMap))
		local wsacc = check_ws_acc()

		--test
		if player.attack > 5000 then
			equip(sets.precast.WS[spell.english].PDL)
		end
		--test
		
		if (WSset.ear1 == "Moonshade Earring" or WSset.ear2 == "Moonshade Earring") then
			-- Replace Moonshade Earring if we're at cap TP
			if get_effective_player_tp(spell, WSset) > 3200 then
				if wsacc:contains('Acc') and not buffactive['Sneak Attack'] and sets.AccMaxTP then
					equip(sets.AccMaxTP[spell.english] or sets.AccMaxTP)
				elseif sets.MaxTP then
					equip(sets.MaxTP[spell.english] or sets.MaxTP)
				else
				end
			end
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
	if check_zerg_sp() then return true end
	if check_jump() then return true end
	if check_buff() then return true end
	return false
end

function job_filtered_action(spell, eventArgs)
	if spell.type == 'WeaponSkill' then
		local available_ws = S(windower.ffxi.get_abilities().weapon_skills)
		
		if available_ws:contains(32) then
			if spell.english == "Stardiver" then
				send_command('@input /ws "Savage Blade" '..spell.target.raw)
                cancel_spell()
				eventArgs.cancel = true
			end
		end
	end
end

function check_hasso()
	if player.sub_job == 'SAM' and not state.Buff['SJ Restriction'] and not (state.Stance.value == 'None' or state.Buff.Hasso or state.Buff.Seigan) and player.status == 'Engaged' and not silent_check_amnesia() then
		
		local abil_recasts = windower.ffxi.get_ability_recasts()
		local available_ws = S(windower.ffxi.get_abilities().weapon_skills)
		
		if state.Stance.value == 'Hasso' and abil_recasts[138] < latency and (available_ws:contains(112) or available_ws:contains(176)) then
			windower.chat.input('/ja "Hasso" <me>')
			tickdelay = os.clock() + 1.1
			return true
		elseif state.Stance.value == 'Seigan' and abil_recasts[139] < latency and (available_ws:contains(112) or available_ws:contains(176)) then
			windower.chat.input('/ja "Seigan" <me>')
			tickdelay = os.clock() + 1.1
			return true
		else
			return false
		end
	
	end
		
	return false
end

function check_jump()
    if state.AutoJumpMode.value and player.status == 'Engaged' and player.tp < 501 then

        local abil_recasts = windower.ffxi.get_ability_recasts()

        if abil_recasts[166] < latency then
            windower.chat.input('/ja "Spirit Jump" <t>')
            tickdelay = os.clock() + 1.1
            return true
        elseif abil_recasts[167] < latency then
            windower.chat.input('/ja "Soul Jump" <t>')
            tickdelay = os.clock() + 1.1
            return true
        elseif abil_recasts[158] < latency then
            windower.chat.input('/ja "Jump" <t>')
            tickdelay = os.clock() + 1.1
            return true
        elseif abil_recasts[159] < latency then
            windower.chat.input('/ja "High Jump" <t>')
            tickdelay = os.clock() + 1.1
            return true
		elseif abil_recasts[160] < latency and (player.hpp < 70 or state.AutoZergMode.value) then
            windower.chat.input('/ja "Super Jump" <t>')
            tickdelay = os.clock() + 1.1
            return true
        else
            return false
        end
    end
end

function check_buff()
	if state.AutoBuffMode.value ~= 'Off' and player.in_combat then
		
		local abil_recasts = windower.ffxi.get_ability_recasts()

		if not pet.isvalid and abil_recasts[163] < latency then
			windower.chat.input('/ja "Call Wyvern" <me>')
			tickdelay = os.clock() + 1.1
			return true
		elseif pet.isvalid and abil_recasts[70] < latency then
            windower.chat.input('/ja "Steady Wing" <me>')
            tickdelay = os.clock() + 1.1
            return true
        elseif pet.isvalid and abil_recasts[162] < latency and pet.hpp < 55 then
            windower.chat.input('/ja "Spirit Link" <me>')
            tickdelay = os.clock() + 1.1
            return true
	    elseif pet.isvalid and abil_recasts[239] < latency and (pet.hpp < 40 or player.hpp < 65) then
            windower.chat.input('/ja "Restoring Breath" <me>')
            tickdelay = os.clock() + 1.1
            return true
		elseif player.sub_job == 'DRK' and not state.Buff['SJ Restriction'] and not buffactive['Last Resort'] and abil_recasts[87] < latency then
			windower.chat.input('/ja "Last Resort" <me>')
			tickdelay = os.clock() + 1.1
			return true
		elseif player.sub_job == 'WAR' and not state.Buff['SJ Restriction'] and not buffactive.Berserk and abil_recasts[1] < latency then
			windower.chat.input('/ja "Berserk" <me>')
			tickdelay = os.clock() + 1.1
			return true
		elseif player.sub_job == 'WAR' and not state.Buff['SJ Restriction'] and not buffactive.Aggressor and abil_recasts[4] < latency then
			windower.chat.input('/ja "Aggressor" <me>')
			tickdelay = os.clock() + 1.1
			return true
		else
			return false
		end
	end
		
	return false
end

function check_zerg_sp()
    if state.AutoZergMode.value and player.status == 'Engaged' and player.in_combat then

        local abil_recasts = windower.ffxi.get_ability_recasts()

        if abil_recasts[165] < latency then
            windower.chat.input('/ja "Angon" <t>')
            tickdelay = os.clock() + 1.1
            return true
        elseif abil_recasts[58] < latency and player.target.name == 'Bumba' then
            windower.chat.input('/ja "Dragon Breaker" <t>')
            tickdelay = os.clock() + 1.1
            return true
        elseif abil_recasts[157] < latency and player.target.name == 'Bumba' then
            windower.chat.input('/ja "Ancient Circle" <me>')
            tickdelay = os.clock() + 1.1
            return true
		elseif (abil_recasts[254] < latency) and (abil_recasts[166] > latency and abil_recasts[167] > latency and abil_recasts[158] > latency and abil_recasts[159] > latency and abil_recasts[160] > latency) then
			windower.chat.input('/ja "Fly High" <me>')
            tickdelay = os.clock() + 1.1
            return true
        else
            return false
        end
    end
end