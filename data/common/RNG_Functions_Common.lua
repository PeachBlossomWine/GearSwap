function select_default_macro_book()
    if player.sub_job == 'WAR' then
        set_macro_page(1, 11)
    elseif player.sub_job == 'NIN' then
		set_macro_page(2, 11)
    else
        set_macro_page(1, 11)
    end
end

function job_tick()
	if check_ammo() then return true end
	if check_buff() then return true end
	return false
end

function job_filtered_action(spell, eventArgs)
	if spell.type == 'WeaponSkill' then
		local available_ws = S(windower.ffxi.get_abilities().weapon_skills)
		-- Sword
        if available_ws:contains(32) then
			if spell.english == "Last Stand" then
				send_command('@input /ws "Savage Blade" '..spell.target.raw)
                cancel_spell()
				eventArgs.cancel = true
			end
		-- Crossbow
		elseif available_ws:contains(208) then
			if spell.english == "Last Stand" then
				windower.chat.input('/ws "Trueflight" '..spell.target.raw)
                cancel_spell()
				eventArgs.cancel = true
			end
		-- Bow
		elseif available_ws:contains(192) then
			if spell.english == "Last Stand" then
				windower.chat.input('/ws "Jishnu\'s Radiance" '..spell.target.raw)
                cancel_spell()
				eventArgs.cancel = true
			end
		end
	end
end

function job_buff_change(buff, gain)
	if buff:contains('Aftermath') then
		classes.CustomRangedGroups:clear()
		if player.equipment.range then
			if (player.equipment.range == 'Armageddon' and (buffactive['Aftermath: Lv.1'] or buffactive['Aftermath: Lv.2'] or buffactive['Aftermath: Lv.3']))
			or (player.equipment.range == 'Gandiva' and (buffactive['Aftermath: Lv.1'] or buffactive['Aftermath: Lv.2'] or buffactive['Aftermath: Lv.3'])) then
				classes.CustomRangedGroups:append('AM')
			end
		end
	end
end

function check_buff()
	if state.AutoBuffMode.value ~= 'Off' and player.in_combat and not silent_check_amnesia() and player.target.type == "MONSTER" then
		
		local abil_recasts = windower.ffxi.get_ability_recasts()
		local available_ws = S(windower.ffxi.get_abilities().weapon_skills)

		--Melee Savage Blade
		if player.equipment.range == 'Sparrowhawk +2' then
			if buffactive['Velocity Shot'] then
				windower.send_command('cancel Velocity Shot')
				tickdelay = os.clock() + 5.1
				return true
			elseif player.sub_job == 'WAR' and not buffactive['SJ Restriction'] and not buffactive.Berserk and abil_recasts[1] < latency then
				windower.chat.input('/ja "Berserk" <me>')
				tickdelay = os.clock() + 5.1
				return true
			elseif abil_recasts[121] < latency and count_available_ammo(player.equipment.ammo) < (ammostock+37) and not buffactive['Camouflage'] and not buffactive['Double Shot'] and not player.in_combat then
				windower.chat.input('/ja "Scavenge" <me>')
				tickdelay = os.clock() + 5.1
				return true
			else
				return false
			end
		-- Ranged guns
		else
			if abil_recasts[129] < latency and not buffactive['Velocity Shot'] then
				windower.chat.input('/ja "Velocity Shot" <me>')
				tickdelay = os.clock() + 5.1
				return true
			elseif player.sub_job == 'WAR' and not buffactive['SJ Restriction'] and not buffactive.Berserk and abil_recasts[1] < latency then
				windower.chat.input('/ja "Berserk" <me>')
				tickdelay = os.clock() + 5.1
				return true
			-- Armageddon
			elseif (player.equipment.range == 'Armageddon' and (buffactive['Aftermath: Lv.1'] or buffactive['Aftermath: Lv.2'] or buffactive['Aftermath: Lv.3'])) and abil_recasts[126] < latency and not buffactive['Double Shot'] then
				windower.chat.input('/ja "Double Shot" <me>')
				tickdelay = os.clock() + 5.1
				return true
			elseif player.equipment.range == 'Armageddon' and not (buffactive['Aftermath: Lv.1'] or buffactive['Aftermath: Lv.2'] or buffactive['Aftermath: Lv.3']) and (player.tp < 2130 and player.tp > 520) and abil_recasts[125] < latency and not buffactive['Barrage'] then
				windower.chat.input('/ja "Barrage" <me>')
				tickdelay = os.clock() + 5.1
				return true
			-- Other weapons
			elseif player.equipment.range ~= 'Armageddon' and abil_recasts[126] < latency and not buffactive['Double Shot'] then
				windower.chat.input('/ja "Double Shot" <me>')
				tickdelay = os.clock() + 5.1
				return true
			elseif player.equipment.range ~= 'Armageddon' and (player.tp < 2130 and player.tp > 520) and abil_recasts[125] < latency and not buffactive['Barrage'] then
				windower.chat.input('/ja "Barrage" <me>')
				tickdelay = os.clock() + 5.1
				return true
			-- Scavenge
			elseif abil_recasts[121] < latency and count_available_ammo(player.equipment.ammo) < (ammostock+37) and not buffactive['Camouflage'] and not buffactive['Double Shot'] and not player.in_combat then
				windower.chat.input('/ja "Scavenge" <me>')
				tickdelay = os.clock() + 5.1
				return true
			else
				return false
			end
		end
	end
end