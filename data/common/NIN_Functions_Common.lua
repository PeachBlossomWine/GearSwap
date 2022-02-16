
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'WAR' then
        set_macro_page(1, 13)
    else
        set_macro_page(1, 13)
    end
end

buff_spell_lists = {
	Auto = {	
		--{Name='Migawari: Ichi',Buff='Migawari',SpellID=510,When='Combat'},

	},
	
	Default = {
		{Name='Myoshu: Ichi',Buff='Subtle Blow Plus',SpellID=507,Reapply=false},
		{Name='Kakka: Ichi',Buff='Store TP',SpellID=509,Reapply=false},
	},
}

function job_self_command(commandArgs, eventArgs)
	if commandArgs[1]:lower() == 'elemental' then
		handle_elemental(commandArgs)
		eventArgs.handled = true

	elseif commandArgs[1] == 'SubJobEnmity' and not state.Buff['SJ Restriction'] then

		if player.target.type ~= "MONSTER" then
			add_to_chat(123,'Abort: You are not targeting a monster.')
			return

		elseif player.sub_job == 'RUN' then
			local spell_recasts = windower.ffxi.get_spell_recasts()

			if spell_recasts[112] < spell_latency then
				send_command('input /ma "Flash" <t>')
				return
			end
		
			local abil_recasts = windower.ffxi.get_ability_recasts()
			
			if abil_recasts[24] < latency and not silent_check_amnesia() then
				send_command('input /ja "Swordplay" <me>')
			end
			
		elseif player.sub_job == 'BLU' and not moving then
			local spell_recasts = windower.ffxi.get_spell_recasts()
					
			if spell_recasts[584] < spell_latency then
				windower.chat.input('/ma "Sheep Song" <t>')
			elseif spell_recasts[605] < spell_latency then
				windower.chat.input('/ma "Geist Wall" <t>')
			elseif spell_recasts[575] < spell_latency then
				windower.chat.input('/ma "Jettatura" <t>')
			elseif spell_recasts[537] < spell_latency then
				windower.chat.input('/ma "Stinking Gas" <t>')
			elseif spell_recasts[592] < spell_latency then
				windower.chat.input('/ma "Blank Gaze" <t>')
			elseif not check_auto_tank_ws() then
				if not state.AutoTankMode.value then add_to_chat(123,'All Enmity Blue Magic on cooldown.') end
			end

		elseif player.sub_job == 'DRK' then
			local abil_recasts = windower.ffxi.get_ability_recasts()
			local spell_recasts = windower.ffxi.get_spell_recasts()
			
			if (state.HybridMode.value ~= 'Normal' or state.DefenseMode.value ~= 'None')  and buffactive['Souleater'] then
				send_command('cancel souleater')
			end
			
			if (state.HybridMode.value ~= 'Normal' or state.DefenseMode.value ~= 'None')  and buffactive['Last Resort'] then
				send_command('cancel last resort')
			end
			
			if spell_recasts[252] < spell_latency and not silent_check_silence() then
				windower.chat.input('/ma "Stun" <t>')
			elseif not check_auto_tank_ws() then
				if not state.AutoTankMode.value then add_to_chat(123,'All Enmity Dark Knight abillities on cooldown.') end
			end

		elseif player.sub_job == 'WAR' then
			local abil_recasts = windower.ffxi.get_ability_recasts()
			
			if state.HybridMode.value:contains('DD') then
				if buffactive['Defender'] then send_command('cancel defender') end
			elseif state.HybridMode.value ~= 'Normal' and not state.HybridMode.value:contains('DD') then
				if buffactive['Berserk'] then send_command('cancel berserk') end
			end
			
			if abil_recasts[5] < latency and not silent_check_amnesia() then
				send_command('input /ja "Provoke" <t>')
			elseif abil_recasts[4] < latency and not silent_check_amnesia() then
				send_command('input /ja "Aggressor" <me>')
			elseif abil_recasts[1] < latency and not silent_check_amnesia() then
				send_command('input /ja "Berserk" <me>')
			elseif not check_auto_tank_ws() then
				if not state.AutoTankMode.value then add_to_chat(123,'All Enmity Warrior Job Abilities on cooldown.') end
			end
			
		elseif player.sub_job == 'DNC' and not silent_check_amnesia() then
			local abil_recasts = windower.ffxi.get_ability_recasts()
			local under3FMs = not buffactive['Finishing Move 3'] and not buffactive['Finishing Move 4'] and not buffactive['Finishing Move 5']
        
			if under3FMs then
				if abil_recasts[220] < latency then
				send_command('@input /ja "'..state.CurrentStep.value..'" <t>')
				return
				end
			elseif abil_recasts[221] < latency then
				send_command('input /ja "Animated Flourish" <t>')
				return
			elseif abil_recasts[220] < latency and not buffactive['Finishing Move 5'] then
				send_command('@input /ja "'..state.CurrentStep.value..'" <t>')
				return
			elseif not check_auto_tank_ws() then
				if not state.AutoTankMode.value then add_to_chat(123,'Dancer job abilities not needed.') end
			end
		end

	end
end

function user_job_filtered_action(spell, eventArgs)
	if spell.type == 'WeaponSkill' then
		local available_ws = S(windower.ffxi.get_abilities().weapon_skills)
		local named_ones = S{	'Volte Cleaver','Volte Fistfighter','Volte Incanter','Volte Priest','Volte Duelist',
								'Volte Vagabond','Volte Crusader','Volte Reaper','Volte Trainer','Volte Conductor',
								'Volte Sniper','Volte Mononofu','Volte Shinobi','Volte Highwind','Volte Controler',
								'Volte Joiner','Volte Sailor','Volte Manipulator','Volte Twirler','Volte Erudite',
								'Volte Communer','Volte Illusionist'}

		if available_ws:contains(32) then
			if spell.english == "Blade: Metsu" then
				send_command('@input /ws "Savage Blade" '..spell.target.raw)
                cancel_spell()
				eventArgs.cancel = true
			elseif spell.english == "Blade: Ten" then
				send_command('@input /ws "Savage Blade" '..spell.target.raw)
                cancel_spell()
				eventArgs.cancel = true
			elseif spell.english == "Blade: Chi" then
				send_command('@input /ws "Savage Blade" '..spell.target.raw)
                cancel_spell()
				eventArgs.cancel = true
			-- Proc WS Sword
			elseif spell.english == "Combo" then
				windower.chat.input('/ws "Seraph Blade" '..spell.target.raw)
                cancel_spell()
				eventArgs.cancel = true
			elseif spell.english == "Raging Axe" then
				windower.chat.input('/ws "Red Lotus Blade" '..spell.target.raw)
                cancel_spell()
				eventArgs.cancel = true
			end
		--Dynamis W3 exclusive override
		elseif available_ws:contains(128) then
			if spell.english == "Fast Blade" and named_ones:contains(player.target.name) then 
				windower.add_to_chat('Named One: ' ..player.target.name)
				send_command('@input /ws "Blade: Ten" '..spell.target.raw)
				cancel_spell()
				eventArgs.cancel = true
			elseif spell.english == "Fast Blade" and not named_ones:contains(player.target.name) then 
				windower.add_to_chat('Regular: ' ..player.target.name)
				send_command('@input /ws "Blade: Chi" '..spell.target.raw)
				cancel_spell()
				eventArgs.cancel = true
			-- Proc WS Katana
			elseif spell.english == "Combo" then
				windower.chat.input('/ws "Blade: Ei" '..spell.target.raw)
                cancel_spell()
				eventArgs.cancel = true
			-- If AutoWS is Metsu, and equipped Kikoku
			elseif spell.english == "Blade: Metsu" and available_ws:contains(137) then
				send_command('@input /ws "Blade: Metsu" '..spell.target.raw)
				cancel_spell()
				eventArgs.cancel = true
			-- If AutoWS is Metsu, and equipped other katana
			elseif spell.english == "Blade: Metsu" and not available_ws:contains(137) then
				send_command('@input /ws "Blade: Ten" '..spell.target.raw)
				cancel_spell()
				eventArgs.cancel = true
			end
		-- GS
		elseif available_ws:contains(48) then
			if spell.english == "Combo" then
				send_command('@input /ws "Freezebite" '..spell.target.raw)
                cancel_spell()
				eventArgs.cancel = true
            end
		-- Polearm
		elseif available_ws:contains(112) then
			if spell.english == "Combo" then
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
		-- Scythe
		elseif available_ws:contains(96) then
			if spell.english == "Combo" then
				windower.chat.input('/ws "Shadow of Death" '..spell.target.raw)
                cancel_spell()
				eventArgs.cancel = true
			end
		-- Club
		elseif available_ws:contains(160) then
			if spell.english == "Combo" then
				windower.chat.input('/ws "Seraph Strike" '..spell.target.raw)
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

function job_customize_melee_set(meleeSet)

	if state.Buff.Yonin then 
		if state.DefenseMode.value == 'None' or state.DefenseMode.value == 'Evasion' then
			meleeSet = set_combine(meleeSet, sets.buff.Yonin)
		end
	elseif state.Buff.Innin then
		if (state.OffenseMode.value == 'Normal' or state.OffenseMode.value == 'Fodder') and state.DefenseMode.value == 'None' then
			meleeSet = set_combine(meleeSet, sets.buff.Innin)
		end
    end
	
	if state.Buff.Migawari then
        meleeSet = set_combine(meleeSet, sets.buff.Migawari)
    end
	
	if world.area:contains('Abyssea') or data.areas.proc:contains(world.area) then
		meleeSet = set_combine(meleeSet, {ammo="Staunch Tathlum +1"})--, neck="Combatant's Torque"})
	end

    return meleeSet
end

function check_buff()
	if state.AutoBuffMode.value ~= 'Off' and not data.areas.cities:contains(world.area) then
		local spell_recasts = windower.ffxi.get_spell_recasts()
		for i in pairs(buff_spell_lists[state.AutoBuffMode.Value]) do
			if not buffactive[buff_spell_lists[state.AutoBuffMode.Value][i].Buff] and (buff_spell_lists[state.AutoBuffMode.Value][i].When == 'Always' or (buff_spell_lists[state.AutoBuffMode.Value][i].When == 'Combat' and (player.in_combat or being_attacked)) or (buff_spell_lists[state.AutoBuffMode.Value][i].When == 'Engaged' and player.status == 'Engaged') or (buff_spell_lists[state.AutoBuffMode.Value][i].When == 'Idle' and player.status == 'Idle') or (buff_spell_lists[state.AutoBuffMode.Value][i].When == 'OutOfCombat' and not (player.in_combat or being_attacked))) and spell_recasts[buff_spell_lists[state.AutoBuffMode.Value][i].SpellID] < spell_latency and silent_can_use(buff_spell_lists[state.AutoBuffMode.Value][i].SpellID) then
				windower.chat.input('/ma "'..buff_spell_lists[state.AutoBuffMode.Value][i].Name..'" <me>')
				tickdelay = os.clock() + 2
				return true
			end
		end
		
		if player.in_combat and not state.Buff['SJ Restriction'] then
			local abil_recasts = windower.ffxi.get_ability_recasts()

			if player.sub_job == 'WAR' and not buffactive.Berserk and abil_recasts[1] < latency and not silent_check_amnesia() then
				windower.chat.input('/ja "Berserk" <me>')
				tickdelay = os.clock() + 1.1
				return true
			elseif player.sub_job == 'WAR' and not buffactive.Aggressor and abil_recasts[4] < latency and not silent_check_amnesia() then
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
