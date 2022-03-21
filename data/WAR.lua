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

-- Initialization function for this job file.
function get_sets()
    -- Load and initialize the include file.
    include('Sel-Include.lua')
end

    -- Setup vars that are user-independent.
function job_setup()

	state.Buff['Brazen Rush'] = buffactive['Brazen Rush'] or false
	state.Buff["Warrior's Charge"] = buffactive["Warrior's Charge"] or false
	state.Buff['Mighty Strikes'] = buffactive['Mighty Strikes']  or false
	state.Buff.Retaliation = buffactive['Retaliation'] or false
	state.Buff.Restraint = buffactive['Restraint'] or false
    state.Buff['Aftermath'] = buffactive['Aftermath'] or false
	state.Buff['Aftermath: Lv.3'] = buffactive['Aftermath: Lv.3'] or false
    state.Buff.Hasso = buffactive.Hasso or false
    state.Buff.Seigan = buffactive.Seigan or false
	state.Stance = M{['description']='Stance','Hasso','Seigan','None'}

	autows = "Ukko's Fury"
	autofood = 'Soy Ramen'
	
	init_job_states({"Capacity","AutoRuneMode","AutoTrustMode","AutoWSMode","AutoShadowMode","AutoFoodMode","AutoStunMode","AutoDefenseMode",},{"AutoBuffMode","AutoSambaMode","Weapons","OffenseMode","WeaponskillMode","Stance","IdleMode","Passive","RuneElement","TreasureMode",})
end
	
-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------
-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
-- Set eventArgs.useMidcastGear to true if we want midcast gear equipped on precast.
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
		--GAXE
		elseif available_ws:contains(80) then
			if spell.english == "Savage Blade" then
				windower.chat.input('/ws "Armor Break" '..spell.target.raw)
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

-- Modify the default melee set after it was constructed.
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
        
        -- Killer handling
		if buffactive['Killer Instinct'] then
			if player.target and player.target.hpp > 25 then
				equip(sets.precast.WS[spell.english].KI)
			else
				equip(sets.precast.WS[spell.english].KI.SubtleBlow)
			end
		elseif player.target and player.target.hpp < 25 then
			equip(sets.precast.WS[spell.english].SubtleBlow)
		end
        
        if buffactive['Ancient Circle'] or buffactive['Warding Circle'] or buffactive['Holy Circle'] or buffactive['Arcane Circle'] then
            if player.target then
				equip(sets.precast.WS[spell.english].KI)
			end
        end
		
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

-- Called by the 'update' self-command.
function job_update(cmdParams, eventArgs)
    update_melee_groups()
	
	if player.sub_job ~= 'SAM' and state.Stance.value ~= "None" then
		state.Stance:set("None")
	end
end

function job_aftercast(spell, spellMap, eventArgs)
	if not spell.interrupted then
		if spell.english == 'Warcry' then
			lastwarcry = player.name
		elseif spell.english == 'Armor Break' then
			windower.send_command('gs c set weapons Naegling;')
		end
		if state.AutoTPReductionMode.value and spell.type == 'WeaponSkill' then
			windower.add_to_chat(6, 'Auto TP Reduction')
			local self_vector = windower.ffxi.get_mob_by_id(player.id)
			local angle = (math.atan2((player.target.y - self_vector.y), (player.target.x - self_vector.x))*180/math.pi)*-1
			windower.ffxi.turn((getAngle()+180):radian()+math.pi)
			windower.ffxi.turn:schedule(3.9,((angle):radian()))
		end
	end
end

function job_buff_change(buff, gain)
	if buff == 'Warcry' then
		if gain and windower.ffxi.get_ability_recasts()[2] > 297 then
			lastwarcry = player.name
		else
			lastwarcry = ''
		end
	end
	update_melee_groups()
end

function update_melee_groups()
    if player then
		classes.CustomMeleeGroups:clear()
		
		if data.areas.adoulin:contains(world.area) and buffactive.Ionis then
			classes.CustomMeleeGroups:append('Adoulin')
		end
		
		if state.Buff['Brazen Rush'] or state.Buff["Warrior's Charge"] then
			classes.CustomMeleeGroups:append('Charge')
		end
		
		if state.Buff['Mighty Strikes'] then
			classes.CustomMeleeGroups:append('Mighty')
		end
		
		if (player.equipment.main == "Conqueror" and buffactive['Aftermath: Lv.3']) or ((player.equipment.main == "Bravura" or player.equipment.main == "Ragnarok") and state.Buff['Aftermath']) then
				classes.CustomMeleeGroups:append('AM')
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