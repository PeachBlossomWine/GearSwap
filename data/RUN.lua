--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- __________.__                                ________                          __               .__.__  __      __  .__    .__           _____.__.__              
-- \______   |  |   ____ _____    ______ ____   \______ \   ____     ____   _____/  |_    ____   __| _|___/  |_  _/  |_|  |__ |__| ______ _/ ____|__|  |   ____      
--  |     ___|  | _/ __ \\__  \  /  ____/ __ \   |    |  \ /  _ \   /    \ /  _ \   __\ _/ __ \ / __ ||  \   __\ \   __|  |  \|  |/  ___/ \   __\|  |  | _/ __ \     
--  |    |   |  |_\  ___/ / __ \_\___ \\  ___/   |    `   (  <_> ) |   |  (  <_> |  |   \  ___// /_/ ||  ||  |    |  | |   Y  |  |\___ \   |  |  |  |  |_\  ___/     
--  |____|   |____/\___  (____  /____  >\___  > /_______  /\____/  |___|  /\____/|__|    \___  \____ ||__||__|    |__| |___|  |__/____  >  |__|  |__|____/\___  > /\ 
--                     \/     \/     \/     \/          \/              \/                   \/     \/                      \/        \/                      \/  \/ 
--
--	Please do not edit this file!							Please do not edit this file!							Please do not edit this file!
--
--	Editing this file will cause you to be unable to use Github Desktop to update!
--
--	Any changes you wish to make in this file you should be able to make by overloading. That is Re-Defining the same variables or functions in another file, by copying and
--	pasting them to a file that is loaded after the original file, all of my library files, and then job files are loaded first.
--	The last files to load are the ones unique to you. User-Globals, Charactername-Globals, Charactername_Job_Gear, in that order, so these changes will take precedence.
--
--	You may wish to "hook" into existing functions, to add functionality without losing access to updates or fixes I make, for example, instead of copying and editing
--	status_change(), you can instead use the function user_status_change() in the same manner, which is called by status_change() if it exists, most of the important 
--  gearswap functions work like this in my files, and if it's unique to a specific job, user_job_status_change() would be appropriate instead.
--
--  Variables and tables can be easily redefined just by defining them in one of the later loaded files: autofood = 'Miso Ramen' for example.
--  States can be redefined as well: state.HybridMode:options('Normal','PDT') though most of these are already redefined in the gear files for editing there.
--	Commands can be added easily with: user_self_command(commandArgs, eventArgs) or user_job_self_command(commandArgs, eventArgs)
--
--	If you're not sure where is appropriate to copy and paste variables, tables and functions to make changes or add them:
--		User-Globals.lua - 			This file loads with all characters, all jobs, so it's ideal for settings and rules you want to be the same no matter what.
--		Charactername-Globals.lua -	This file loads with one character, all jobs, so it's ideal for gear settings that are usable on all jobs, but unique to this character.
--		Charactername_Job_Gear.lua-	This file loads only on one character, one job, so it's ideal for things that are specific only to that job and character.
--
--
--	If you still need help, feel free to contact me on discord or ask in my chat for help: https://discord.gg/ug6xtvQ
--  !Please do NOT message me in game about anything third party related, though you're welcome to message me there and ask me to talk on another medium.
--
--  Please do not edit this file!							Please do not edit this file!							Please do not edit this file!
-- __________.__                                ________                          __               .__.__  __      __  .__    .__           _____.__.__              
-- \______   |  |   ____ _____    ______ ____   \______ \   ____     ____   _____/  |_    ____   __| _|___/  |_  _/  |_|  |__ |__| ______ _/ ____|__|  |   ____      
--  |     ___|  | _/ __ \\__  \  /  ____/ __ \   |    |  \ /  _ \   /    \ /  _ \   __\ _/ __ \ / __ ||  \   __\ \   __|  |  \|  |/  ___/ \   __\|  |  | _/ __ \     
--  |    |   |  |_\  ___/ / __ \_\___ \\  ___/   |    `   (  <_> ) |   |  (  <_> |  |   \  ___// /_/ ||  ||  |    |  | |   Y  |  |\___ \   |  |  |  |  |_\  ___/     
--  |____|   |____/\___  (____  /____  >\___  > /_______  /\____/  |___|  /\____/|__|    \___  \____ ||__||__|    |__| |___|  |__/____  >  |__|  |__|____/\___  > /\ 
--                     \/     \/     \/     \/          \/              \/                   \/     \/                      \/        \/                      \/  \/ 
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------
enmitydelay = os.clock()
flashflag = true
foilflag = true
blueflag = true

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	-- Default macro set/book
	if player.sub_job == 'BLU' then
		set_macro_page(3, 20)
	elseif player.sub_job == 'DRK' then
		set_macro_page(3, 20)
	elseif player.sub_job == 'PLD' then
		set_macro_page(3, 20)
	else
		set_macro_page(1, 20)
	end
end
-- Initialization function for this job file.
function get_sets()

	-- Load and initialize the include file.
	include('Sel-Include.lua')
end

-- Setup vars that are user-independent.
function job_setup()

	state.Buff['Aftermath: Lv.3'] = buffactive['Aftermath: Lv.3'] or false
	state.Buff['Valiance'] = buffactive['Valiance'] or false
	state.Buff['Vallation'] = buffactive['Vallation'] or false
	state.Buff['Embolden'] = buffactive['Embolden'] or false
    state.Buff.Hasso = buffactive.Hasso or false
    state.Buff.Seigan = buffactive.Seigan or false
	state.Stance = M{['description']='Stance','Hasso','Seigan','None'}
    state.Steps = M{['description']='Current Step', 'Quickstep','Box Step','Stutter Step'}
	
	autows = 'Dimidiation'
	autofood = 'Miso Ramen'
	original_autows = autows
	original_weapon = 'Epeolatry'
     
	update_melee_groups()
	init_job_states({"Capacity","AutoRuneMode","AutoTrustMode","AutoTankMode","AutoWSMode","AutoShadowMode","AutoFoodMode","AutoNukeMode","AutoStunMode","AutoDefenseMode",},{"AutoBuffMode","AutoSambaMode","Weapons","OffenseMode","WeaponskillMode","Stance","IdleMode","Passive","RuneElement","PhysicalDefenseMode","MagicalDefenseMode","ResistDefenseMode","TreasureMode",})
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------
-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
-- Set eventArgs.useMidcastGear to true if we want midcast gear equipped on precast.

function job_filter_precast(spell, spellMap, eventArgs)

	if spell.english == 'Valiance' then
		local abil_recasts = windower.ffxi.get_ability_recasts()
		if abil_recasts[113] > 0 and not state.Buff['Valiance'] and abil_recasts[23] < latency then
			eventArgs.cancel = true
			send_command('@input /ja "Vallation" <me>')
		end
	end
	
end

function job_precast(spell, spellMap, eventArgs)

	if spell.english == 'Vivacious Pulse' then
		equip(sets.precast.JA['Vivacious Pulse'][state.RuneElement.value])
		return
	end

	if spell.type == 'WeaponSkill' and state.AutoBuffMode.value ~= 'Off' and not state.Buff['SJ Restriction'] then
		local abil_recasts = windower.ffxi.get_ability_recasts()
		if player.sub_job == 'SAM' and abil_recasts[134] < latency then
			eventArgs.cancel = true
			windower.chat.input('/ja "Meditate" <me>')
			windower.chat.input:schedule(1,'/ws "'..spell.english..'" '..spell.target.raw..'')
			tickdelay = os.clock() + 1.25
			return
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
			local other_ws = S{'dimidiation','ground strike'}
			if other_ws:contains(spell.english:lower()) then
				windower.chat.input('/ws "Armor Break" '..spell.target.raw)
                cancel_spell()
				eventArgs.cancel = true
			 elseif spell.english == "Resolution" then
			 	windower.chat.input('/ws "Upheaval" '..spell.target.raw)
                cancel_spell()
				eventArgs.cancel = true
			end
		end
	end
end

-- Run after the default midcast() is done.
-- eventArgs is the same one used in job_midcast, in case information needs to be persisted.
function job_post_midcast(spell, spellMap, eventArgs)
    if spell.skill == 'Enhancing Magic' and state.Buff.Embolden and sets.buff.Embolden then
        equip(sets.buff.Embolden)
    end
end

str_rayke = string.char(131,140,131,67,131,78)
str_gambit = string.char(131,75,131,147,131,114,131,98,131,103)
str_seconds = string.char(149,98)
str_remaining = string.char(144,99,130,232)
str_end = string.char(143,73,130,237,130,232)
str_duration = string.char(142,157,145,177,142,158,138,212)
str_using = string.char(130,240,142,103,151,112,130,181,130,196)

function job_aftercast(spell)
	local abil_recasts = windower.ffxi.get_ability_recasts()
	if spell.english == 'Rayke' and not spell.interrupted then
		windower.send_command('input /p ' ..auto_translate('Rayke')..' '..str_rayke..str_duration..'46'..str_seconds..'; wait 16; input /p '..auto_translate('Rayke')..' '..str_rayke..str_remaining..'30'..str_seconds..'; wait 15; input /p '..auto_translate('Rayke')..' '..str_rayke..str_remaining..'15'..str_seconds..'; wait 15; input /p '..auto_translate('Rayke').. ' '..str_rayke..str_end..'!')
	elseif spell.english == 'Gambit' and not spell.interrupted then
		windower.send_command('input /p ' ..auto_translate('Gambit')..' '..str_gambit..str_duration..'96'..str_seconds..'; wait 36; input /p '..auto_translate('Gambit')..' '..str_gambit..'60'..str_seconds..'; wait 30; input /p '..auto_translate('Gambit')..' '..str_gambit..'30'..str_seconds..'; wait 30; input /p '..auto_translate('Gambit')..' '..str_gambit..str_end..'!')
	elseif spell.english == 'Steel Cyclone' and not spell.interrupted then
		windower.chat.input('/p '..str_using..' '..auto_translate('Steel Cyclone')..' -<t>- <scall17>')
	elseif spell.english == 'Freezebite' and not spell.interrupted then
		windower.send_command:schedule(1.2, 'mc autosc Freezebite')
	elseif spell.english == 'Frostbite' and not spell.interrupted then
		windower.send_command:schedule(1.2, 'mc autosc Frostbite')
	elseif spell.english == 'Upheaval' and not spell.interrupted then
		windower.send_command:schedule(1.2, 'mc autosc Upheaval')
		windower.chat.input('/p '..str_using..' '..auto_translate('Upheaval')..' -<t>-')
	end
	if spell.type == 'WeaponSkill' and not spell.interrupted then
		if spell.english == 'Armor Break' then
			windower.chat.input('/p '..str_using..' '..auto_translate('Armor Break').. ' -<t>-')
			windower.send_command('gs c set weapons '..original_weapon..'; gs c autows tp 1000;')	
			update_melee_groups()
		end
	end
end

function job_buff_change(buff, gain)
	update_melee_groups()
end

-------------------------------------------------------------------------------------------------------------------
-- Customization hooks for idle and melee sets, after they've been automatically constructed.
-------------------------------------------------------------------------------------------------------------------

-- Modify the default melee set after it was constructed.
function job_customize_melee_set(meleeSet)

	if buffactive['Battuta'] and sets.buff.Battuta then 
		meleeSet = set_combine(meleeSet, sets.buff.Battuta)
	end

    return meleeSet

end

function job_customize_defense_set(defenseSet)
    if state.ExtraDefenseMode.value ~= 'None' and state.DefenseMode.value ~= 'None' then
        defenseSet = set_combine(defenseSet, sets[state.ExtraDefenseMode.value])
    end

	if buffactive['Battuta'] and sets.buff.Battuta and player.status == 'Engaged' and state.DefenseMode.value == 'Physical' then 
		defenseSet = set_combine(defenseSet, sets.buff.Battuta)
	end
	
    return defenseSet
end

-- Modify the default idle set after it was constructed.
function job_customize_idle_set(idleSet)
    if player.mpp < 51 and (state.IdleMode.value == 'Normal' or state.IdleMode.value:contains('Sphere')) then
		if sets.latent_refresh then
			idleSet = set_combine(idleSet, sets.latent_refresh)
		end
		
		if (state.Weapons.value == 'None' or state.UnlockWeapons.value) and idleSet.main then
			local main_table = get_item_table(idleSet.main)

			if  main_table and (main_table.skill == 12 or main_table.skill == 4) and sets.latent_refresh_grip then
				idleSet = set_combine(idleSet, sets.latent_refresh_grip)
			end
		end
    end

    return idleSet
end

function job_update(cmdParams, eventArgs)
	update_melee_groups()
	
	if player.sub_job ~= 'SAM' and state.Stance.value ~= "None" then
		state.Stance:set("None")
	end
end

-------------------------------------------------------------------------------------------------------------------
-- General hooks for other events.
-------------------------------------------------------------------------------------------------------------------

-- Handle notifications of general user state change.
function job_state_change(stateField, newValue, oldValue)
    classes.CustomDefenseGroups:clear()
    classes.CustomDefenseGroups:append(state.ExtraDefenseMode.current)
    classes.CustomMeleeGroups:clear()
    classes.CustomMeleeGroups:append(state.ExtraDefenseMode.current)
end

-------------------------------------------------------------------------------------------------------------------
-- User code that supplements self-commands.
-------------------------------------------------------------------------------------------------------------------

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
			
			if state.HybridMode.value:contains('Tank','MEVA','Ongo') and buffactive['Souleater'] then
				send_command('cancel souleater')
			end
			
			if state.HybridMode.value:contains('Tank','MEVA','Ongo') and buffactive['Last Resort'] then
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

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

function weather_rune_match()
    weather_rune = buffactive[data.elements.rune_of[world.weather_element] or '']
    day_rune = buffactive[data.elements.rune_of[world.day_element] or '']
    
    if weather_rune or day_rune then
		return true
	else
		return false
	end
end

-- Get a count of the number of runes of a given type
function rune_count(rune)
    local count = 0
    local current_time = os.time()
    for _,entry in pairs(rune_timers) do
        if entry.rune == rune and entry.expires > current_time then
            count = count + 1
        end
    end
    return count
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

function check_flash_foil()
	local spell_recasts = windower.ffxi.get_spell_recasts()
	local now = os.clock()
	
	if state.AutoWSMode.value and player.tp > 1001 and player.in_combat and player.target.type == "MONSTER" and math.sqrt(player.target.distance) < 4 and not silent_check_amnesia() then
		windower.send_command:schedule(1.2, 'input /ws "' .. autows .. '" <t>')
		add_to_chat(262,'WS -> ' .. autows)
		tickdelay = os.clock() + 4.6
		return true
	elseif spell_recasts[112] < spell_latency and not silent_check_silence() and player.mp > res.spells[112].mp_cost then
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
	else
		return false
	end
end

function check_autotankfull()
	if (silent_check_amnesia() or not buffactive[state.RuneElement.value]) then return false end
	local abil_recasts = windower.ffxi.get_ability_recasts()

	-- if abil_recasts[113] < latency and not buffactive['Liement'] then
		-- windower.chat.input('/ja "Valiance" <me>')
		-- tickdelay = os.clock() + 5.5
		-- return true
	if abil_recasts[59] < latency then
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
	-- elseif abil_recasts[117] < latency and (buffactive['Valiance'] or buffactive['Vallation']) then
		-- windower.chat.input('/ja "Liement" <me>')
		-- windower.chat.input:schedule(1.6,'//cancel liement')
		-- tickdelay = os.clock() + 5.5
		-- return true
	else
		return false
	end
end

function update_melee_groups()
	if player.equipment.main then
		classes.CustomMeleeGroups:clear()
		
		if player.equipment.main == "Epeolatry" and state.Buff['Aftermath: Lv.3'] then
				classes.CustomMeleeGroups:append('AM')
		end
	end	
end

function check_hasso()
if player.sub_job == 'SAM' and player.status == 'Engaged' and not (state.Stance.value == 'None' or state.Buff.Hasso or state.Buff.Seigan or state.Buff['SJ Restriction'] or main_weapon_is_one_handed() or silent_check_amnesia()) then
		
		local abil_recasts = windower.ffxi.get_ability_recasts()
		
		if state.Stance.value == 'Hasso' and abil_recasts[138] < latency then
			windower.chat.input('/ja "Hasso" <me>')
			tickdelay = os.clock() + 1.1
			return true
		elseif state.Stance.value == 'Seigan' and abil_recasts[139] < latency then
			windower.chat.input('/ja "Seigan" <me>')
			tickdelay = os.clock() + 1.1
			return true
		end
	
	end
		
	return false
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
			
			if not buffactive['Swordplay'] and abil_recasts[24] < latency and state.HybridMode.value ~= 'Ongo' then
				windower.chat.input('/ja "Swordplay" <me>')
				tickdelay = os.clock() + 1.1
				return true
			elseif not (buffactive['SJ Restriction']) then
				if player.sub_job == 'WAR' and not buffactive['Aggressor'] and abil_recasts[4] < latency then
					windower.chat.input('/ja "Aggressor" <me>')
					tickdelay = os.clock() + 1.1
					return true
				elseif player.sub_job == 'DRK' and not buffactive['Last Resort'] and abil_recasts[87] < latency and not (state.HybridMode.value:contains('Ongo','MEVA','Tank')) then
					windower.chat.input('/ja "Last Resort" <me>')
					tickdelay = os.clock() + 1.1
					return true
				end
			else
				return false
			end
		end
	end
		
	return false
end

function check_buffup()
	if buffup ~= '' then
		local needsbuff = false
		for i in pairs(buff_spell_lists[buffup]) do
			if not buffactive[buff_spell_lists[buffup][i].Buff] and silent_can_use(buff_spell_lists[buffup][i].SpellID) then
				needsbuff = true
				break
			end
		end
	
		if not needsbuff then
			add_to_chat(217, 'All '..buffup..' buffs are up!')
			buffup = ''
			return false
		end
		
		local spell_recasts = windower.ffxi.get_spell_recasts()
		
		for i in pairs(buff_spell_lists[buffup]) do
			if not buffactive[buff_spell_lists[buffup][i].Buff] and silent_can_use(buff_spell_lists[buffup][i].SpellID) and spell_recasts[buff_spell_lists[buffup][i].SpellID] < spell_latency then
				windower.chat.input('/ma "'..buff_spell_lists[buffup][i].Name..'" <me>')
				tickdelay = os.clock() + 2
				return true
			end
		end
		
		return false
	else
		return false
	end
end

buff_spell_lists = {
	Auto = {--Options for When are: Always, Engaged, Idle, OutOfCombat, Combat
		-- {Name='Phalanx',	Buff='Phalanx',			SpellID=106,	When='Always'},
		-- {Name='Refresh',	Buff='Refresh',			SpellID=109,	When='Always'},
		-- {Name='Aquaveil',	Buff='Aquaveil',		SpellID=55,		When='Always'},
		-- {Name='Cocoon',		Buff='Defense Boost',	SpellID=547,	When='Always'},
	},

	Default = {
		{Name='Protect IV',	Buff='Protect',			SpellID=46, 	Reapply=false},
		{Name='Shell V',	Buff='Shell',			SpellID=52, 	Reapply=false},
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
	
	Rebuff = {
		{Name='Refresh',	Buff='Refresh',			SpellID=109,	Reapply=true},
		{Name='Phalanx',	Buff='Phalanx',			SpellID=106,	Reapply=true},
		{Name='Aquaveil',	Buff='Aquaveil',		SpellID=55,		Reapply=true},
		{Name='Crusade',	Buff='Enmity Boost',	SpellID=476,	Reapply=true},
		{Name='Protect IV',	Buff='Protect',			SpellID=46, 	Reapply=false},
		{Name='Shell V',	Buff='Shell',			SpellID=52, 	Reapply=false},
	},
}