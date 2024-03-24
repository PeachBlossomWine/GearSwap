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
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Initialization function for this job.
function get_sets()
    -- Load and initialize the include file.
    include('Sel-Include.lua')
end

function job_setup()

	state.Buff['Mana Wall'] = buffactive['Mana Wall'] or false
	state.Buff['Manafont'] = buffactive['Manafont'] or false
	state.Buff['Manawell'] = buffactive['Manawell'] or false

    LowTierNukes = S{'Stone', 'Water', 'Aero', 'Fire', 'Blizzard', 'Thunder',
        'Stone II', 'Water II', 'Aero II', 'Fire II', 'Blizzard II', 'Thunder II',
        'Stonega', 'Waterga', 'Aeroga', 'Firaga', 'Blizzaga', 'Thundaga'}
		
    AutoManawellSpells = S{'Impact'}
	AutoElementalSealSpells = S{'Shock','Rasp','Choke','Frost','Burn','Drown'}
	AutoManawellOccultSpells = S{'Impact','Meteor','Thundaja','Blizzaja','Firaja','Thunder VI','Blizzard VI',}

	state.DeathMode = M{['description'] = 'Death Mode', 'Off', 'Single', 'Lock'}
	state.AutoManawell = M(true, 'Auto Manawell Mode')
	state.RecoverMode = M('35%', '60%', 'Always', 'Never')
	state.AutoConvert = M(false, 'Auto Convert Mode')

	autows = 'Myrkr'
	autofood = 'Pear Crepe'
	
	init_job_states({"Capacity","AutoRuneMode","AutoTrustMode","AutoNukeMode","AutoManawell","AutoWSMode","AutoShadowMode","AutoFoodMode","AutoStunMode","AutoDefenseMode"},{"AutoBuffMode","Weapons","OffenseMode","WeaponskillMode","IdleMode","Passive","RuneElement","RecoverMode","ElementalMode","CastingMode","TreasureMode",})
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------
-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
-- Set eventArgs.useMidcastGear to true if we want midcast gear equipped on precast.

function job_filtered_action(spell, eventArgs)

end

function job_pretarget(spell, spellMap, eventArgs)
	if spell.action_type == 'Magic' then
		if state.AutoManawell.value and (AutoManawellSpells:contains(spell.english) or (state.CastingMode.value == 'OccultAcumen' and AutoManawellOccultSpells:contains(spell.english) and actual_cost(spell) > player.mp)) then
			local abil_recasts = windower.ffxi.get_ability_recasts()

			if abil_recasts[35] < latency and not buffactive['amnesia'] then
				eventArgs.cancel = true
				cancel_spell()
				send_command('@input /ja "Manawell" <me>;wait 1;input /ma '..spell.english..' '..spell.target.raw..'')
				return
			end
		elseif AutoElementalSealSpells:contains(spell.english) and actual_cost(spell) < player.mp then
			local abil_recasts = windower.ffxi.get_ability_recasts()
			if abil_recasts[38] < latency and not buffactive['amnesia'] then
				eventArgs.cancel = true
				cancel_spell()
				send_command('@input /ja "Elemental Seal" <me>;wait 1;input /ma '..spell.english..' '..spell.target.raw..'')
				return
			end
		end
	end
end

function job_precast(spell, spellMap, eventArgs)

	if spell.action_type == 'Magic' then
        if state.DeathMode.value ~= 'Off' then
            classes.CustomClass = 'Death'		
        elseif state.CastingMode.value == 'Proc' then
            classes.CustomClass = 'Proc'
        elseif state.CastingMode.value == 'OccultAcumen' then
            classes.CustomClass = 'OccultAcumen'
        end

	end
end

function job_post_precast(spell, spellMap, eventArgs)

	if spell.action_type == 'Magic' and state.DeathMode.value ~= 'Off' then
		equip(sets.precast.FC.Death)
	elseif spell.type == 'WeaponSkill' then
		local WSset = standardize_set(get_precast_set(spell, spellMap))
		
		if (WSset.ear1 == "Moonshade Earring" or WSset.ear2 == "Moonshade Earring") then
			-- Replace Moonshade Earring if we're at cap TP
			if sets.MaxTP and get_effective_player_tp(spell, WSset) > 3200 then
				equip(sets.MaxTP[spell.english] or sets.MaxTP)
			end
		end
	end
end

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
function job_midcast(spell, action, spellMap, eventArgs)

end

function job_post_midcast(spell, spellMap, eventArgs)
	if spell.action_type == 'Magic' then
		if state.DeathMode.value ~= 'Off' and spell.english ~= 'Death' then
			if sets.midcast[spell.english] and sets.midcast[spell.english].Death then
				equip(sets.midcast[spell.english].Death)
			elseif sets.midcast[spellMap] and sets.midcast[spellMap].Death then
				equip(sets.midcast[spellMap].Death)
			elseif sets.midcast[spell.skill] and sets.midcast[spell.skill].Death then
				equip(sets.midcast[spell.skill].Death)
			else
				equip(sets.precast.FC.Death)
			end

		elseif is_nuke(spell, spellMap) then
			if state.MagicBurstMode.value ~= 'Off' then
				if state.CastingMode.value:contains('Proc') then
					equip(sets.midcast['Elemental Magic'].Proc)
				elseif state.CastingMode.value:contains('Resistant') and sets.ResistantMagicBurst then
					equip(sets.ResistantMagicBurst)
				elseif spell.english:contains('ja') then
					equip(sets.MagicEffectDurationBurst)
				else
					equip(sets.MagicBurst)
				end
			end

			if player.hpp < 75 and player.tp < 1000 and state.CastingMode.value == 'Fodder' then
				if item_available("Sorcerer's Ring") then
					sets.SorcRing = {ring1="Sorcerer's Ring"}
					equip(sets.SorcRing)
				end
			end
			
			if spell.element == world.weather_element or spell.element == world.day_element then
			end
			
			if spell.element and sets.element[spell.element] then
				equip(sets.element[spell.element])
			end
			
			if state.RecoverMode.value ~= 'Never' and not (state.Buff['Manafont'] or state.Buff['Manawell']) and (state.RecoverMode.value == 'Always' or tonumber(state.RecoverMode.value:sub(1, -2)) > player.mpp) then
				if state.MagicBurstMode.value ~= 'Off' then
					if state.CastingMode.value:contains('Resistant') and sets.ResistantRecoverBurst then
						equip(sets.ResistantRecoverBurst)
					elseif state.CastingMode.value:contains('Proc') then
						equip(sets.midcast['Elemental Magic'].Proc)
					elseif sets.RecoverBurst then
						equip(sets.RecoverBurst)
					elseif sets.RecoverMP then
						equip(sets.RecoverMP)
					end
				elseif sets.RecoverMP then
					equip(sets.RecoverMP)
				end
			end
		end

		if state.Buff['Mana Wall'] and ((state.IdleMode.value:contains('DT') or state.IdleMode.value:contains('Tank')) and (player.in_combat or being_attacked))then
			equip(sets.buff['Mana Wall'])
		end
	end
end

function job_aftercast(spell, spellMap, eventArgs)
    if not spell.interrupted then
        if spell.english == 'Sleep' or spell.english == 'Sleepga' then
            send_command('@timers c "'..spell.english..' ['..spell.target.name..']" 60 down spells/00220.png')
        elseif spell.english == 'Sleep II' or spell.english == 'Sleepga II' then
            send_command('@timers c "'..spell.english..' ['..spell.target.name..']" 90 down spells/00220.png')
		elseif spell.english == "Death" and state.DeathMode.value == 'Single' then
			state.DeathMode:reset()
			if state.DisplayMode.value then update_job_states()	end
        end
    end
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.
function job_buff_change(buff, gain)

end

-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

-- Custom spell mapping.
function job_get_spell_map(spell, default_spell_map)

	if  default_spell_map == 'Cure' or default_spell_map == 'Curaga'  then
		if world.weather_element == 'Light' then
                return 'LightWeatherCure'
		elseif world.day_element == 'Light' then
                return 'LightDayCure'
        end

    elseif spell.skill == 'Elemental Magic' then
		if default_spell_map == 'ElementalEnfeeble' or spell.english:contains('helix') then
			return
        elseif LowTierNukes:contains(spell.english) then
            return 'LowTierNuke'
        else
            return 'HighTierNuke'
        end
	
	elseif spell.skill == "Enfeebling Magic" then
		if spell.english:startswith('Dia') then
			return "Dia"
		elseif spell.type == "WhiteMagic" or spell.english:startswith('Frazzle') or spell.english:startswith('Distract') then
			return 'MndEnfeebles'
		else
			return 'IntEnfeebles'
		end
    end
	
end

-- Modify the default idle set after it was constructed.
function job_customize_idle_set(idleSet)
    if buffactive['Sublimation: Activated'] then
        if (state.IdleMode.value == 'Normal' or state.IdleMode.value:contains('Sphere')) and sets.buff.Sublimation then
            idleSet = set_combine(idleSet, sets.buff.Sublimation)
        elseif state.IdleMode.value:contains('DT') and sets.buff.DTSublimation then
            idleSet = set_combine(idleSet, sets.buff.DTSublimation)
        end
    end

    if state.IdleMode.value == 'Normal' or state.IdleMode.value:contains('Sphere') then
		if player.mpp < 51 then
			if sets.latent_refresh then
				idleSet = set_combine(idleSet, sets.latent_refresh)
			end
			
			if (state.Weapons.value == 'None' or state.UnlockWeapons.value) and idleSet.main then
				local main_table = get_item_table(idleSet.main)

				if  main_table and main_table.skill == 12 and sets.latent_refresh_grip then
					idleSet = set_combine(idleSet, sets.latent_refresh_grip)
				end
				
				if player.tp > 10 and sets.TPEat then
					idleSet = set_combine(idleSet, sets.TPEat)
				end
			end
		end
   end
	
	if state.DeathMode.value ~= 'Off' then
        idleSet = set_combine(idleSet, sets.idle.Death)
    end

    if state.Buff['Mana Wall'] then
		idleSet = set_combine(idleSet, sets.buff['Mana Wall'])
    end
    
    return idleSet
end

-- Modify the default melee set after it was constructed.
function job_customize_melee_set(meleeSet)

    if state.Buff['Mana Wall'] then
		meleeSet = set_combine(meleeSet, sets.buff['Mana Wall'])
    end

    return meleeSet
end

function job_customize_defense_set(defenseSet)

    if state.Buff['Mana Wall'] then
		defenseSet = set_combine(defenseSet, sets.buff['Mana Wall'])
    end

    return defenseSet
end

-- Function to display the current relevant user state when doing an update.
function display_current_job_state(eventArgs)
    display_current_caster_state()
    eventArgs.handled = true
end

function job_self_command(commandArgs, eventArgs)
		if commandArgs[1]:lower() == 'elemental' then
			handle_elemental(commandArgs)
			eventArgs.handled = true			
		end
end

function job_tick()
	if check_arts() then return true end
	if check_zerg_sp() then return true end
	if check_buff() then return true end
	if check_buffup() then return true end
	return false
end

function check_arts()
	if (player.sub_job == 'SCH' and not (state.Buff['SJ Restriction'] or arts_active())) and (buffup ~= '' or (not data.areas.cities:contains(world.area) and ((state.AutoArts.value and player.in_combat) or state.AutoBuffMode.value ~= 'Off'))) then
	
		local abil_recasts = windower.ffxi.get_ability_recasts()

		if abil_recasts[232] < latency then
			windower.chat.input('/ja "Dark Arts" <me>')
			tickdelay = os.clock() + 1
			return true
		end

	end
	
	return false
end

-- Handling Elemental spells within Gearswap.
-- Format: gs c elemental <nuke, helix, skillchain1, skillchain2, weather>
function handle_elemental(cmdParams)
    -- cmdParams[1] == 'elemental'
    -- cmdParams[2] == ability to use

    if not cmdParams[2] then
        add_to_chat(123,'Error: No elemental command given.')
        return
    end
    local command = cmdParams[2]:lower()
	
	if command == 'spikes' then
		windower.chat.input('/ma "'..data.elements.spikes_of[state.ElementalMode.value]..' Spikes" <me>')
		return
	elseif command == 'enspell' then
		windower.chat.input('/ma "En'..data.elements.enspell_of[state.ElementalMode.value]..'" <me>')
		return
	--Leave out target, let shortcuts auto-determine it.
	elseif command == 'weather' then
		if player.sub_job == 'RDM' then
			windower.chat.input('/ma "Phalanx" <me>')
		else
			local spell_recasts = windower.ffxi.get_spell_recasts()
			if (player.target.type == 'SELF' or not player.target.in_party) and buffactive[data.elements.storm_of[state.ElementalMode.value]] and not buffactive['Klimaform'] and spell_recasts[287] < spell_latency then
				windower.chat.input('/ma "Klimaform" <me>')
			else
				windower.chat.input('/ma "'..data.elements.storm_of[state.ElementalMode.value]..'"')
			end
		end
		return
	end

	local target = '<t>'
	if cmdParams[3] then
		if tonumber(cmdParams[3]) then
			target = tonumber(cmdParams[3])
		else
			target = table.concat(cmdParams, ' ', 3)
			target = get_closest_mob_id_by_name(target) or '<t>'
		end
	end

    if command == 'nuke' then
		local spell_recasts = windower.ffxi.get_spell_recasts()
		
		if state.ElementalMode.value == 'Light' then
			if spell_recasts[29] < spell_latency and actual_cost(get_spell_table_by_name('Banish II')) < player.mp then
				windower.chat.input('/ma "Banish II" '..target..'')
			elseif spell_recasts[28] < spell_latency and actual_cost(get_spell_table_by_name('Banish')) < player.mp then
				windower.chat.input('/ma "Banish" '..target..'')
			else
				add_to_chat(123,'Abort: Banishes on cooldown or not enough MP.')
			end

		elseif state.ElementalMode.value == 'Dark' then
			if spell_recasts[219] < spell_latency and actual_cost(get_spell_table_by_name('Comet')) < player.mp then
				windower.chat.input('/ma "Comet" '..target..'')
			else
				add_to_chat(123,'Abort: Comet on cooldown or not enough MP.')
			end

		else
			if player.job_points[(res.jobs[player.main_job_id].ens):lower()].jp_spent > 99 and spell_recasts[get_spell_table_by_name(data.elements.nuke_of[state.ElementalMode.value]..' VI').id] < spell_latency and actual_cost(get_spell_table_by_name(data.elements.nuke_of[state.ElementalMode.value]..' VI')) < player.mp then
				windower.chat.input('/ma "'..data.elements.nuke_of[state.ElementalMode.value]..' VI" '..target..'')
			else
				local tiers = {' V',' IV',' III',' II',''}
				for k in ipairs(tiers) do
					if spell_recasts[get_spell_table_by_name(data.elements.nuke_of[state.ElementalMode.value]..''..tiers[k]..'').id] < spell_latency and actual_cost(get_spell_table_by_name(data.elements.nuke_of[state.ElementalMode.value]..''..tiers[k]..'')) < player.mp then
						windower.chat.input('/ma "'..data.elements.nuke_of[state.ElementalMode.value]..''..tiers[k]..'" '..target..'')
						return
					end
				end
				add_to_chat(123,'Abort: All '..data.elements.nuke_of[state.ElementalMode.value]..' nukes on cooldown or or not enough MP.')
			end
		end
	elseif command == 'impact' then
		local spell_recasts = windower.ffxi.get_spell_recasts()
		local abil_recasts = windower.ffxi.get_ability_recasts()
		if spell_recasts[503] < spell_latency and actual_cost(get_spell_table_by_name('Impact')) < player.mp then
			if abil_recasts[35] < latency and not buffactive['amnesia'] then
				windower.send_command('@input /ja "Manawell" <me>; wait 1; input /ma "Impact" '..target..'')
			else
				windower.chat.input('/ma "Impact" '..target..'')
			end
		end
	elseif command == 'burn' then
		local spell_recasts = windower.ffxi.get_spell_recasts()
		local abil_recasts = windower.ffxi.get_ability_recasts()
		if spell_recasts[235] < spell_latency and actual_cost(get_spell_table_by_name('Burn')) < player.mp then
			if abil_recasts[38] < latency and not buffactive['amnesia'] then
				windower.send_command('@input /ja "Elemental Seal" <me>; wait 1; input /ma "Burn" '..target..'')
			else
				windower.chat.input('/ma "Burn" '..target..'')
			end
		end
	elseif command == 'ninjutsu' then
		windower.chat.input('/ma "'..data.elements.ninjutsu_nuke_of[state.ElementalMode.value]..': Ni" '..target..'')
			
	elseif command == 'smallnuke' then
		local spell_recasts = windower.ffxi.get_spell_recasts()
	
		local tiers = {' II',''}
		for k in ipairs(tiers) do
			if spell_recasts[get_spell_table_by_name(data.elements.nuke_of[state.ElementalMode.value]..''..tiers[k]..'').id] < spell_latency and actual_cost(get_spell_table_by_name(data.elements.nuke_of[state.ElementalMode.value]..''..tiers[k]..'')) < player.mp then
				windower.chat.input('/ma "'..data.elements.nuke_of[state.ElementalMode.value]..''..tiers[k]..'" '..target..'')
				return
			end
		end
		add_to_chat(123,'Abort: All '..data.elements.nuke_of[state.ElementalMode.value]..' nukes on cooldown or or not enough MP.')
		
	elseif command:contains('tier') then
		local spell_recasts = windower.ffxi.get_spell_recasts()
		local tierlist = {['tier1']='',['tier2']=' II',['tier3']=' III',['tier4']=' IV',['tier5']=' V',['tier6']=' VI'}
		
		windower.chat.input('/ma "'..data.elements.nuke_of[state.ElementalMode.value]..tierlist[command]..'" '..target..'')
		
	elseif command:contains('aga') or command == 'aja' then
		local spell_recasts = windower.ffxi.get_spell_recasts()
		local tierkey = {'aja','aga3','aga2','aga1'}
		local tierlist = {['aja']='ja',['aga3']='ga III',['aga2']='ga II',['aga1']='ga',}
		if command == 'aga' then
			for i in ipairs(tierkey) do
				if spell_recasts[get_spell_table_by_name(data.elements.nukega_of[state.ElementalMode.value]..''..tierlist[tierkey[i]]..'').id] < spell_latency and actual_cost(get_spell_table_by_name(data.elements.nukega_of[state.ElementalMode.value]..''..tierlist[tierkey[i]]..'')) < player.mp then
					windower.chat.input('/ma "'..data.elements.nukega_of[state.ElementalMode.value]..''..tierlist[tierkey[i]]..'" '..target..'')
					return
				end
			end
		else
			windower.chat.input('/ma "'..data.elements.nukega_of[state.ElementalMode.value]..tierlist[command]..'" '..target..'')
		end

	elseif command == 'ara' then
		windower.chat.input('/ma "'..data.elements.nukera_of[state.ElementalMode.value]..'ra" '..target..'')
		
	elseif command == 'helix' then
		windower.chat.input('/ma "'..data.elements.helix_of[state.ElementalMode.value]..'helix" '..target..'')
	
	elseif command == 'ancientmagic' then
		windower.chat.input('/ma "'..data.elements.ancient_nuke_of[state.ElementalMode.value]..'" '..target..'')
		
	elseif command == 'ancientmagic2' then
		windower.chat.input('/ma "'..data.elements.ancient_nuke_of[state.ElementalMode.value]..' II" '..target..'')
		
	elseif command == 'enfeeble' then
		windower.chat.input('/ma "'..data.elements.elemental_enfeeble_of[state.ElementalMode.value]..'" '..target..'')
	
	elseif command == 'bardsong' then
		windower.chat.input('/ma "'..data.elements.threnody_of[state.ElementalMode.value]..' Threnody" '..target..'')
	else
        add_to_chat(123,'Unrecognized elemental command.')
    end
end

function check_buff()
	if state.AutoBuffMode.value ~= 'Off' and not data.areas.cities:contains(world.area) then
		local spell_recasts = windower.ffxi.get_spell_recasts()
		local abil_recasts = windower.ffxi.get_ability_recasts()
		local battle_target = windower.ffxi.get_mob_by_target('bt') or false
		
		for i in pairs(buff_spell_lists[state.AutoBuffMode.Value]) do
			if not buffactive[buff_spell_lists[state.AutoBuffMode.Value][i].Buff] and (buff_spell_lists[state.AutoBuffMode.Value][i].When == 'Always' or 
            (buff_spell_lists[state.AutoBuffMode.Value][i].When == 'Combat' and (player.in_combat or being_attacked)) or 
            (buff_spell_lists[state.AutoBuffMode.Value][i].When == 'Engaged' and player.status == 'Engaged') or 
            (buff_spell_lists[state.AutoBuffMode.Value][i].When == 'Idle' and player.status == 'Idle') or 
            (buff_spell_lists[state.AutoBuffMode.Value][i].When == 'OutOfCombat' and not (player.in_combat or being_attacked))) and 
			((buff_spell_lists[state.AutoBuffMode.Value][i].Buff == 'Haste' and not buffactive['Slow'] and not buffactive['Haste']) or not (buff_spell_lists[state.AutoBuffMode.Value][i].Buff == 'Haste')) and
            spell_recasts[buff_spell_lists[state.AutoBuffMode.Value][i].SpellID] < spell_latency and 
            player.mp > res.spells[buff_spell_lists[state.AutoBuffMode.Value][i].SpellID].mp_cost and
            silent_can_use(buff_spell_lists[state.AutoBuffMode.Value][i].SpellID) and
            (((player.sub_job == 'SCH' and data.spells.addendum_white:contains(buff_spell_lists[state.AutoBuffMode.Value][i].Name) and not buffactive['Addendum: White'] and get_current_stratagem_count() > 0) or (player.sub_job == 'SCH' and data.spells.addendum_white:contains(buff_spell_lists[state.AutoBuffMode.Value][i].Name) and buffactive['Addendum: White'])) or (player.sub_job ~= 'SCH' or (not(data.spells.addendum_white:contains(buff_spell_lists[state.AutoBuffMode.Value][i].Name)) and player.sub_job == 'SCH'))) then
				windower.chat.input('/ma "'..buff_spell_lists[state.AutoBuffMode.Value][i].Name..'" <me>')
				tickdelay = os.clock() + 2
				return true
			end
		end
		if (state.AutoConvert.value and player.sub_job == "RDM" and not buffactive['SJ Restriction'] and not buffactive['Manafont']) and 
			player.mpp < 20 and player.hpp > 75 and abil_recasts[49] < latency and not silent_check_amnesia() and 
			player.in_combat and (battle_target and battle_target.distance:sqrt() < (battle_target.model_size + 20.1) and battle_target.valid_target) then
            windower.send_command('input /ja "Convert" <me>')
			tickdelay = os.clock() + 2.5
            return true
		end
	else
		return false
	end
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

function check_zerg_sp()
	local abil_recasts = windower.ffxi.get_ability_recasts()
	local battle_target = windower.ffxi.get_mob_by_target('bt') or false
	add_to_chat(123, 'Zerg Mode ACTIVATION')
    if state.AutoZergMode.value == 'On' and player.in_combat and (battle_target and battle_target.distance:sqrt() < (battle_target.model_size + 20.1) and battle_target.valid_target) and not data.areas.cities:contains(world.area) then
        if abil_recasts[254] < latency and not buffactive['Subtle Sorcery'] then
			windower.chat.input('/ja "Subtle Sorcery" <me>')
            tickdelay = os.clock() + 2.5
            return true
		elseif abil_recasts[0] < latency and not buffactive['Manafont'] then
            windower.chat.input('/ja "Manafont" <me>')
			tickdelay = os.clock() + 2.5
            return true
        else
            return false
        end
    end
end

buff_spell_lists = {
	Auto = {--Options for When are: Always, Engaged, Idle, OutOfCombat, Combat
		{Name='Haste',			Buff='Haste',			SpellID=57,		When='Always'},
		{Name='Refresh',		Buff='Refresh',			SpellID=109,	When='Always'},
		{Name='Klimaform',		Buff='Klimaform',		SpellID=287,	When='Combat'},
        {Name='Reraise',		Buff='Reraise',			SpellID=113,	When='Always'},
	},
	
	Default = {
		{Name='Haste',			Buff='Haste',			SpellID=57,		Reapply=false},
		{Name='Refresh',		Buff='Refresh',			SpellID=109,	Reapply=false},
		{Name='Aquaveil',		Buff='Aquaveil',		SpellID=55,		Reapply=false},
		{Name='Stoneskin',		Buff='Stoneskin',		SpellID=54,		Reapply=false},
		{Name='Klimaform',		Buff='Klimaform',		SpellID=287,	Reapply=false},
		{Name='Blink',			Buff='Blink',			SpellID=53,		Reapply=false},
		{Name='Regen',			Buff='Regen',			SpellID=108,	Reapply=false},
		{Name='Phalanx',		Buff='Phalanx',			SpellID=106,	Reapply=false},
        {Name='Reraise',		Buff='Reraise',			SpellID=113,	Reapply=false},
	},
	
	Rebuff = {
		{Name='Refresh',		Buff='Refresh',			SpellID=109,	Reapply=true},
		{Name='Haste',			Buff='Haste',			SpellID=57,		Reapply=true},
	},
}

function select_default_macro_book()
	set_macro_page(1, 4)
end