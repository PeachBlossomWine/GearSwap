enmitydelay = os.clock()
flashflag = true
foilflag = true
blueflag = true

buff_spell_lists = {
	Auto = {--Options for When are: Always, Engaged, Idle, OutOfCombat, Combat
		--{Name='Crusade',	Buff='Enmity Boost',	SpellID=476,	When='Combat'},
		--{Name='Temper',		Buff='Multi Strikes',	SpellID=493,	When='Engaged'},
		{Name='Phalanx',	Buff='Phalanx',			SpellID=106,	When='Always'},
		{Name='Refresh',	Buff='Refresh',			SpellID=109,	When='Always'},
		{Name='Cocoon',		Buff='Defense Boost',	SpellID=547,	When='Always'},
	},

	Default = {
		{Name='Crusade',	Buff='Enmity Boost',	SpellID=476,	Reapply=false},
		{Name='Temper',		Buff='Multi Strikes',	SpellID=493,	Reapply=false},
		{Name='Haste',		Buff='Haste',			SpellID=57,		Reapply=false},
		{Name='Refresh',	Buff='Refresh',			SpellID=109,	Reapply=false},
		{Name='Aquaveil',	Buff='Aquaveil',		SpellID=55,		Reapply=false},
		{Name='Stoneskin',	Buff='Stoneskin',		SpellID=54,		Reapply=false},
		{Name='Blink',		Buff='Blink',			SpellID=53,		Reapply=false},
		{Name='Phalanx',	Buff='Phalanx',			SpellID=106,	Reapply=false},
		{Name='Regen IV',	Buff='Regen',			SpellID=477,	Reapply=false},
	},
}

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	-- Default macro set/book
	if player.sub_job == 'BLU' then
		set_macro_page(1, 20)
	elseif player.sub_job == 'DRK' then
		set_macro_page(1, 20)
	else
		set_macro_page(1, 20)
	end
end

function job_post_precast(spell, spellMap, eventArgs)

	if spell.type == 'WeaponSkill' then
		local WSset = standardize_set(get_precast_set(spell, spellMap))
		local wsacc = check_ws_acc()
		
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
	elseif spell.english == 'Lunge' or spell.english == 'Swipe' then
        if weather_rune_match() then
			if item_available('Hachirin-no-Obi') then
				equip({waist="Hachirin-no-Obi"})
			end
        end
		if spell.element and sets.element[spell.element] then
			equip(sets.element[spell.element])
		end
    end
	
	if spell.action_type == 'Magic' and (state.Buff['Vallation'] or state.Buff['Valiance']) then
		if spell.skill == 'Enhancing Magic' then
			equip(sets.precast.FC.ValianceVallationEnhancing)
		else
			equip(sets.precast.FC.ValianceVallation)
		end
	end
	
end

function job_filtered_action(spell, eventArgs)
	if spell.type == 'WeaponSkill' then
		local available_ws = S(windower.ffxi.get_abilities().weapon_skills)
		if available_ws:contains(80) then
			 if spell.english == "Dimidiation" then
				windower.chat.input('/ws "Armor Break" '..spell.target.raw)
                cancel_spell()
				eventArgs.cancel = true
			end
		end
	end
end

function job_tick()
	if check_buff() then return true end
	if state.AutoTankMode.value and player.in_combat and player.target.type == "MONSTER" and not moving then
		if check_flash_foil() then return true end
		windower.send_command('gs c SubJobEnmity')
		if state.AutoTankFull.value then
			if check_autotankfull() then return true end
		end
		tickdelay = os.clock() + 1.5
		return true
	end
	if check_hasso() then return true end
	if check_buffup() then return true end
	return false
end

-- Overwrite for main spells [auto tank]
function check_flash_foil()
	local spell_recasts = windower.ffxi.get_spell_recasts()
	local now = os.clock()
	
	if state.AutoWSMode.value and player.tp > 1001 and player.in_combat and player.target.type == "MONSTER" and math.sqrt(player.target.distance) < 4 and not silent_check_amnesia() then
		windower.send_command:schedule(1.2, 'input /ws "' .. autows .. '" <t>')
			if autows:lower() == 'freezebite' then
				windower.send_command:schedule(1.2, 'mc rngsc Freezebite')
			elseif autows:lower() == 'frostbite' then
				windower.send_command:schedule(1.2, 'mc rngsc Frostbite')
			end
		add_to_chat(262,'WS -> ' .. autows)
		tickdelay = os.clock() + 4.6
		return true
	elseif spell_recasts[112] <  spell_latency and not silent_check_silence() and player.mp > res.spells[112].mp_cost then
		if flashflag == true then
			flashflag = false
			enmitydelay = os.clock() + 4
		end
		if now > enmitydelay then
			windower.chat.input('/ma "Flash" <t>')
			tickdelay = os.clock() + 2.7
			flashflag = true
			return true
		end
	elseif spell_recasts[840] < spell_latency and not silent_check_silence() and player.mp > res.spells[840].mp_cost then
		if foilflag == true then
			foilflag = false
			enmitydelay = os.clock() + 4
		end
		if now > enmitydelay then
			windower.chat.input('/ma "Foil" <me>')
			tickdelay = os.clock() + 2.7
			foilflag = true
			return true
		end
	elseif not buffactive['Enmity Boost'] and spell_recasts[476] < spell_latency and not silent_check_silence() and player.mp > res.spells[476].mp_cost then
		windower.chat.input('/ma "Crusade" <me>')
		tickdelay = os.clock() + 2.7
		return true
	-- elseif state.AutoWSMode.value and player.tp > 1001 and player.in_combat and player.target.type == "MONSTER" and not silent_check_amnesia() then
		-- windower.send_command:schedule(1.2, 'input /ws "' .. autows .. '" <t>')
			-- if autows:lower() == 'freezebite' then
				-- windower.send_command:schedule(1.2, 'mc rngsc Freezebite')
			-- end
		-- add_to_chat(262,'WS -> ' .. autows)
		-- tickdelay = os.clock() + 4.5
		-- return true
	else
		return false
	end
end

function check_autotankfull()
	if (silent_check_amnesia() or not buffactive[state.RuneElement.value]) then return false end
	local abil_recasts = windower.ffxi.get_ability_recasts()

	if abil_recasts[113] < latency and not buffactive['Liement'] then
		windower.chat.input('/ja "Valiance" <me>')
		tickdelay = os.clock() + 5.5
		return true
	elseif abil_recasts[59] < latency then
		windower.chat.input('/ja "Pflug" <me>')
		tickdelay = os.clock() + 5.5
		return true
	elseif abil_recasts[120] < latency then
		windower.chat.input('/ja "Battuta" <me>')
		tickdelay = os.clock() + 5.5
		return true
	elseif abil_recasts[118] < latency then
		windower.chat.input('/ja "One for All" <me>')
		tickdelay = os.clock() + 5.5
		return true
	elseif abil_recasts[117] < latency and (buffactive['Valiance'] or buffactive['Vallation']) then
		windower.chat.input('/ja "Liement" <me>')
		windower.chat.input:schedule(1.6,'//cancel liement')
		tickdelay = os.clock() + 5.5
		return true
	-- elseif abil_recasts[119] < latency and player.target.type == "MONSTER" then
		-- windower.chat.input('/ja "Rayke" <t>')
		-- tickdelay = os.clock() + 5.5
		-- return true
	-- elseif abil_recasts[116] < latency and player.target.type == "MONSTER" then
		-- windower.chat.input('/ja "Gambit" <t>')
		-- tickdelay = os.clock() + 5.5
		--return true
	else
		return false
	end
end

function job_self_command(commandArgs, eventArgs)
	if commandArgs[1]:lower() == 'subjobenmity' then

		if player.target.type ~= "MONSTER" then
			add_to_chat(123,'Abort: You are not targeting a monster.')
			return
	
		elseif player.sub_job == 'BLU' and not state.Buff['SJ Restriction'] and not moving then
			local spell_recasts = windower.ffxi.get_spell_recasts()
		
			local now = os.clock()
			
			if spell_recasts[584] < spell_latency and player.mp > res.spells[584].mp_cost then
				windower.chat.input('/ma "Sheep Song" <t>')
			elseif spell_recasts[575] < spell_latency and player.mp > res.spells[575].mp_cost then
				if blueflag == true then
					blueflag = false
					enmitydelay = os.clock() + 2.5
				end
				if now > enmitydelay then
					windower.chat.input('/ma "Jettatura" <t>')
					tickdelay = os.clock() + 2
					blueflag = true
					return true
				end
			elseif spell_recasts[592] < spell_latency and player.mp > res.spells[592].mp_cost then
				if blueflag == true then
					blueflag = false
					enmitydelay = os.clock() + 2.5
				end
				if now > enmitydelay then
					windower.chat.input('/ma "Blank Gaze" <t>')
					tickdelay = os.clock() + 2
					blueflag = true
					return true
				end
			elseif spell_recasts[605] < spell_latency and player.mp > res.spells[605].mp_cost then
				if blueflag == true then
					blueflag = false
					enmitydelay = os.clock() + 2.5
				end
				if now > enmitydelay then
					windower.chat.input('/ma "Geist Wall" <t>')
					tickdelay = os.clock() + 2
					blueflag = true
					return true
				end
			elseif spell_recasts[537] < spell_latency and player.mp > res.spells[537].mp_cost then
				if blueflag == true then
					blueflag = false
					enmitydelay = os.clock() + 2.5
				end
				if now > enmitydelay then
					windower.chat.input('/ma "Stinking Gas" <t>')
					tickdelay = os.clock() + 2
					blueflag = true
					return true
				end
			elseif not check_auto_tank_ws() then
				if not state.AutoTankMode.value then add_to_chat(123,'All Enmity Blue Magic on cooldown.') end
			end
			-- 598 Soporific
		elseif player.sub_job == 'DRK' and not state.Buff['SJ Restriction'] and not moving then
			local abil_recasts = windower.ffxi.get_ability_recasts()
			local spell_recasts = windower.ffxi.get_spell_recasts()
			
			if state.HybridMode.value == 'Tank' and buffactive['Souleater'] then
				send_command('cancel souleater')
			end
			
			if state.HybridMode.value == 'Tank' and buffactive['Last Resort'] then
				send_command('cancel last resort')
			end
			
			if spell_recasts[252] < spell_latency and not silent_check_silence() and player.mp > res.spells[252].mp_cost then
				windower.chat.input('/ma "Stun" <t>')
			-- elseif abil_recasts[88] < latency then
				-- if not state.AutoTankMode.value then
					-- windower.chat.input('/ja "Weapon Bash" <t>')
				-- end
			elseif not check_auto_tank_ws() then
				if not state.AutoTankMode.value then add_to_chat(123,'All Enmity Dark Knight abillities on cooldown.') end
			end
		elseif player.sub_job == 'BLM' and not state.Buff['SJ Restriction'] then
			local spell_recasts = windower.ffxi.get_spell_recasts()
			
			if spell_recasts[252] < spell_latency and not silent_check_silence() and player.mp > res.spells[252].mp_cost then
				windower.chat.input('/ma "Stun" <t>')
			elseif not check_auto_tank_ws() then
				if not state.AutoTankMode.value then add_to_chat(123,'All Enmity BLM spells on cooldown.') end
			end
		elseif player.sub_job == 'WAR' and not state.Buff['SJ Restriction'] and not silent_check_amnesia() then
			local abil_recasts = windower.ffxi.get_ability_recasts()
			
			if (state.HybridMode.value ~= 'Tank' or state.HybridMode.value ~= 'DTLite' or state.DefenseMode.value ~= 'None')  and buffactive['Berserk'] then
				send_command('cancel berserk')
			end
			
			if abil_recasts[5] < latency then
				windower.chat.input('/ja "Provoke" <t>')
			elseif abil_recasts[2] < latency then
				windower.chat.input('/ja "Warcry" <me>')
			elseif abil_recasts[3] < latency then
				windower.chat.input('/ja "Defender" <me>')
			elseif abil_recasts[4] < latency then
				windower.chat.input('/ja "Aggressor" <me>')
			elseif abil_recasts[1] < latency then
				windower.chat.input('/ja "Berserk" <me>')
			elseif not check_auto_tank_ws() then
				if not state.AutoTankMode.value then add_to_chat(123,'All Enmity Warrior Job Abilities on cooldown.') end
			end
			
		elseif player.sub_job == 'DNC' and not state.Buff['SJ Restriction'] and not silent_check_amnesia() then
			local abil_recasts = windower.ffxi.get_ability_recasts()
			local under3FMs = not buffactive['Finishing Move 3'] and not buffactive['Finishing Move 4'] and not buffactive['Finishing Move 5']
        
			if under3FMs then
				if abil_recasts[220] < latency then
				send_command('@input /ja "'..state.CurrentStep.value..'" <t>')
				state.CurrentStep:cycle()
				return
				end
			elseif abil_recasts[221] < latency then
				windower.chat.input('/ja "Animated Flourish" <t>')
				return
			elseif abil_recasts[220] < latency and not buffactive['Finishing Move 5'] then
				send_command('@input /ja "'..state.CurrentStep.value..'" <t>')
				state.CurrentStep:cycle()
				return
			elseif not check_auto_tank_ws() then
				if not state.AutoTankMode.value then add_to_chat(123,'Dancer job abilities not needed.') end
			end
		end
	end
end

function check_buff()
	if state.AutoBuffMode.value ~= 'Off' and not data.areas.cities:contains(world.area) then
		local spell_recasts = windower.ffxi.get_spell_recasts()
		for i in pairs(buff_spell_lists[state.AutoBuffMode.Value]) do
			if not buffactive[buff_spell_lists[state.AutoBuffMode.Value][i].Buff] and (buff_spell_lists[state.AutoBuffMode.Value][i].When == 'Always' or (buff_spell_lists[state.AutoBuffMode.Value][i].When == 'Combat' and (player.in_combat or being_attacked)) or (buff_spell_lists[state.AutoBuffMode.Value][i].When == 'Engaged' and player.status == 'Engaged') or (buff_spell_lists[state.AutoBuffMode.Value][i].When == 'Idle' and player.status == 'Idle') or (buff_spell_lists[state.AutoBuffMode.Value][i].When == 'OutOfCombat' and not (player.in_combat or being_attacked))) and spell_recasts[buff_spell_lists[state.AutoBuffMode.Value][i].SpellID] < spell_latency and silent_can_use(buff_spell_lists[state.AutoBuffMode.Value][i].SpellID) and player.mp > res.spells[buff_spell_lists[state.AutoBuffMode.Value][i].SpellID].mp_cost and not silent_check_silence() then
				windower.chat.input('/ma "'..buff_spell_lists[state.AutoBuffMode.Value][i].Name..'" <me>')
				tickdelay = os.clock() + 2
				return true
			end
		end
		
		if player.in_combat and not silent_check_amnesia() then
			local abil_recasts = windower.ffxi.get_ability_recasts()
			
			if not buffactive['Swordplay'] and abil_recasts[24] < latency then
				windower.chat.input('/ja "Swordplay" <me>')
				tickdelay = os.clock() + 1.1
				return true
			elseif player.sub_job == 'WAR' and not buffactive.Aggressor and abil_recasts[4] < latency and not state.Buff['SJ Restriction'] then
				windower.chat.input('/ja "Aggressor" <me>')
				tickdelay = os.clock() + 1.1
				return true
			else
				return false
			end
		end
	end
		
	return false
end