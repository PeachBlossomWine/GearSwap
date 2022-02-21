-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'SAM' then
        set_macro_page(1, 1)
    elseif player.sub_job == 'NIN' then
        set_macro_page(1, 1)
    else
        set_macro_page(1, 1)
    end
end

function job_customize_melee_set(meleeSet)

	if not state.OffenseMode.value:contains('Acc') and state.HybridMode.value == 'Normal' and buffactive['Retaliation'] then
		meleeSet = set_combine(meleeSet, sets.buff.Retaliation)
	end
	
	if not state.OffenseMode.value:contains('Acc') and state.HybridMode.value == 'Normal' and buffactive['Restraint'] then
		meleeSet = set_combine(meleeSet, sets.buff.Restraint)
	end
	
	if world.area:contains('Abyssea') or data.areas.proc:contains(world.area) then
		meleeSet = set_combine(meleeSet, {neck="Combatant's Torque"})
	end
	
    return meleeSet
end

-- Run after the general precast() is done.
function job_post_precast(spell, spellMap, eventArgs)
	if spell.type == 'WeaponSkill' then

		local WSset = standardize_set(get_precast_set(spell, spellMap))
		local wsacc = check_ws_acc()
		
		--test
		-- if player.attack > 5000 then
			-- equip(sets.precast.WS[spell.english].PDL)
		-- end
		--test

		
		if (WSset.ear1 == "Moonshade Earring" or WSset.ear2 == "Moonshade Earring") then
			-- Replace Moonshade Earring if we're at cap TP
			if get_effective_player_tp(spell, WSset) > 3200 then
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
		
		if wsacc:contains('Acc') and not buffactive['Sneak Attack'] then
			if state.Buff.Charge and state.Buff['Mighty Strikes'] and sets.ACCWSMightyCharge then
				equip(sets.ACCWSMightyCharge)
			elseif state.Buff.Charge and sets.ACCWSCharge then
				equip(sets.ACCWSCharge)
			elseif state.Buff['Mighty Strikes'] and sets.ACCWSMighty then
				equip(sets.AccWSMighty)
			end
		else
			if state.Buff.Charge and state.Buff['Mighty Strikes'] and sets.WSMightyCharge then
				equip(sets.WSMightyCharge)
			elseif state.Buff.Charge and sets.WSCharge then
				equip(sets.WSCharge)
			elseif state.Buff['Mighty Strikes'] and sets.WSMighty then
				equip(sets.WSMighty)
			end
		end

	end

end

function job_tick()
	if check_hasso() then return true end
	if check_buff() then return true end
	if check_jump() then return true end
	if check_zerg_sp() then return true end
	if check_steps_subjob() then return true end
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

function job_filtered_action(spell, eventArgs)
	if spell.type == 'WeaponSkill' then
		local available_ws = S(windower.ffxi.get_abilities().weapon_skills)
		-- WS 48 - GS is equipped.
		if available_ws:contains(48) then
            if spell.english == "Upheaval" then
				windower.chat.input('/ws "Resolution" '..spell.target.raw)
                cancel_spell()
				eventArgs.cancel = true
            elseif spell.english == "Ukko's Fury" then
                send_command('@input /ws "Ground Strike" '..spell.target.raw)
                cancel_spell()
				eventArgs.cancel = true
			elseif spell.english == "Combo" then
				send_command('@input /ws "Freezebite" '..spell.target.raw)
                cancel_spell()
				eventArgs.cancel = true
            end
		-- Polearm
		elseif available_ws:contains(112) then
			if spell.english == "Upheaval" then
				windower.chat.input('/ws "Impulse Drive" '..spell.target.raw)
                cancel_spell()
				eventArgs.cancel = true
			elseif spell.english == "Ukko's Fury" then
				windower.chat.input('/ws "Sonic Thrust" '..spell.target.raw)
                cancel_spell()
				eventArgs.cancel = true	
			elseif spell.english == "Combo" then
				windower.chat.input('/ws "Raiden Thrust" '..spell.target.raw)
                cancel_spell()
				eventArgs.cancel = true
			end	
		-- Dagger
		elseif available_ws:contains(16) then
			if spell.english == "Combo" then
				windower.chat.input('/ws "Energy Drain" '..spell.target.raw)
                cancel_spell()
				eventArgs.cancel = true
			elseif spell.english == "Raging Axe" then
				windower.chat.input('/ws "Cyclone" '..spell.target.raw)
                cancel_spell()
				eventArgs.cancel = true
			end
		-- GK
		elseif available_ws:contains(144) then
			if spell.english == "Combo" then
				windower.chat.input('/ws "Tachi: Koki" '..spell.target.raw)
                cancel_spell()
				eventArgs.cancel = true
			elseif spell.english == "Raging Axe" then
				windower.chat.input('/ws "Tachi: Jinpu" '..spell.target.raw)
                cancel_spell()
				eventArgs.cancel = true
			end
		-- Sword
        elseif available_ws:contains(32) then
			if spell.english == "Combo" then
				windower.chat.input('/ws "Seraph Blade" '..spell.target.raw)
                cancel_spell()
				eventArgs.cancel = true
			elseif spell.english == "Raging Axe" then
				windower.chat.input('/ws "Red Lotus Blade" '..spell.target.raw)
                cancel_spell()
				eventArgs.cancel = true
			elseif spell.english == "Upheaval" then
				send_command('@input /ws "Savage Blade" '..spell.target.raw)
                cancel_spell()
				eventArgs.cancel = true
			end
		-- Scythe
		elseif available_ws:contains(96) then
			if spell.english == "Combo" then
				windower.chat.input('/ws "Shadow of Death" '..spell.target.raw)
                cancel_spell()
				eventArgs.cancel = true
			end
		-- Katana
		elseif available_ws:contains(128) then
			if spell.english == "Combo" then
				windower.chat.input('/ws "Blade: Ei" '..spell.target.raw)
                cancel_spell()
				eventArgs.cancel = true
			end
		-- Club
		elseif available_ws:contains(160) then
			if spell.english == "Combo" then
				windower.chat.input('/ws "Seraph Strike" '..spell.target.raw)
                cancel_spell()
				eventArgs.cancel = true
			elseif spell.english == "Upheaval" then
				windower.chat.input('/ws "Judgment" '..spell.target.raw)
                cancel_spell()
				eventArgs.cancel = true
			end
		-- Staff
		elseif available_ws:contains(176) then
			if spell.english == "Combo" then
				windower.chat.input('/ws "Sunburst" '..spell.target.raw)
                cancel_spell()
				eventArgs.cancel = true
			elseif spell.english == "Raging Axe" then
				windower.chat.input('/ws "Earth Crusher" '..spell.target.raw)
                cancel_spell()
				eventArgs.cancel = true
			end
		end
	end
end

function job_precast(spell, spellMap, eventArgs)
	if spell.type == 'WeaponSkill' and state.AutoBuffMode.value ~= 'Off' then
		local abil_recasts = windower.ffxi.get_ability_recasts()
		if player.tp < 2250 and not buffactive['Blood Rage'] and not buffactive['Warcry'] and abil_recasts[2] < latency then
			eventArgs.cancel = true
			windower.chat.input('/ja "Warcry" <me>')
			windower.chat.input:schedule(1,'/ws "'..spell.english..'" '..spell.target.raw..'')
			tickdelay = os.clock() + 1.25
			return
		elseif player.sub_job == 'SAM' and not buffactive['SJ Restriction'] and player.tp > 1850 and abil_recasts[140] < latency then
			eventArgs.cancel = true
			windower.chat.input('/ja "Sekkanoki" <me>')
			windower.chat.input:schedule(1,'/ws "'..spell.english..'" '..spell.target.raw..'')
			tickdelay = os.clock() + 1.25
			return
		elseif player.sub_job == 'SAM' and not buffactive['SJ Restriction'] and abil_recasts[134] < latency then
			eventArgs.cancel = true
			windower.chat.input('/ja "Meditate" <me>')
			windower.chat.input:schedule(1,'/ws "'..spell.english..'" '..spell.target.raw..'')
			tickdelay = os.clock() + 1.25
			return
		end
	end
end

function check_zerg_sp()
	if state.AutoZergMode.value and player.status == 'Engaged' and player.in_combat then
		
		local abil_recasts = windower.ffxi.get_ability_recasts()

		if not buffactive['Brazen Rush'] and abil_recasts[254] < latency then
			windower.chat.input('/ja "Brazen Rush" <me>')
			tickdelay = os.clock() + 1.1
			return true		
		elseif not buffactive['Mighty Strikes'] and abil_recasts[0] < latency then
			windower.chat.input('/ja "Mighty Strikes" <me>')
			tickdelay = os.clock() + 1.1
			return true
		else
			return false
		end
	end
		
	return false
end

function check_buff()
	if state.AutoBuffMode.value ~= 'Off' and player.in_combat and player.status == 'Engaged' then
		
		local abil_recasts = windower.ffxi.get_ability_recasts()

		if not buffactive.Restraint and abil_recasts[9] < latency and not state.AutoZergMode.value then
			windower.chat.input('/ja "Restraint" <me>')
			tickdelay = os.clock() + 1.1
			return true
		elseif not buffactive.Berserk and abil_recasts[1] < latency then
			windower.chat.input('/ja "Berserk" <me>')
			tickdelay = os.clock() + 1.1
			return true
		elseif not buffactive.Aggressor and abil_recasts[4] < latency and not state.AutoZergMode.value then
			windower.chat.input('/ja "Aggressor" <me>')
			tickdelay = os.clock() + 1.1
			return true
		elseif abil_recasts[7] < latency and state.AutoTomahawkMode.value then
			windower.chat.input('/ja "Tomahawk" <t>')
			tickdelay = os.clock() + 1.1
			return true
		else
			return false
		end
	end
		
	return false
end

function check_hasso()
	if player.sub_job == 'SAM' and not buffactive['SJ Restriction'] and not (state.Stance.value == 'None' or state.Buff.Hasso or state.Buff.Seigan) and player.status == 'Engaged' and not silent_check_amnesia() then
		
		local abil_recasts = windower.ffxi.get_ability_recasts()
		local available_ws = S(windower.ffxi.get_abilities().weapon_skills)
		
		if state.Stance.value == 'Hasso' and abil_recasts[138] < latency and (available_ws:contains(112) or available_ws:contains(176) or available_ws:contains(48) or available_ws:contains(96) or available_ws:contains(80)) then
			windower.chat.input('/ja "Hasso" <me>')
			tickdelay = os.clock() + 1.1
			return true
		elseif state.Stance.value == 'Seigan' and abil_recasts[139] < latency and (available_ws:contains(112) or available_ws:contains(176) or available_ws:contains(48) or available_ws:contains(96) or available_ws:contains(80)) then
			windower.chat.input('/ja "Seigan" <me>')
			tickdelay = os.clock() + 1.1
			return true
		else
			return false
		end
	end

	return false
end

