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

--[[
    Custom commands:
    
    gs c step
        Uses the currently configured step on the target, with either <t> or <stnpc> depending on setting.

    gs c step t
        Uses the currently configured step on the target, but forces use of <t>.
    
    
    Configuration commands:
    
    gs c cycle mainstep
        Cycles through the available steps to use as the primary step when using one of the above commands.
        
    gs c cycle altstep
        Cycles through the available steps to use for alternating with the configured main step.
        
    gs c toggle usealtstep
        Toggles whether or not to use an alternate step.

--]]


-- Initialization function for this job file.
function get_sets()
    -- Load and initialize the include file.
    include('Sel-Include.lua')
end


-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()

    state.Buff['Climactic Flourish'] = buffactive['Climactic Flourish'] or false
	state.Buff['Building Flourish'] = buffactive['Building Flourish'] or false
	state.Buff['Presto'] = buffactive['Presto'] or false
	state.Buff['Contradance'] = buffactive['Contradance'] or false
	state.Buff['Saber Dance'] = buffactive['Saber Dance'] or false
	state.Buff['Fan Dance'] = buffactive['Fan Dance'] or false
	state.Buff['Aftermath: Lv.3'] = buffactive['Aftermath: Lv.3'] or false
	
	
    state.MainStep = M{['description']='Main Step', 'Box Step','Quickstep','Feather Step','Stutter Step'}
    state.AltStep = M{['description']='Alt Step', 'Feather Step','Quickstep','Stutter Step','Box Step'}
    state.UseAltStep = M(true, 'Use Alt Step')
    state.CurrentStep = M{['description']='Current Step', 'Main', 'Alt'}

	state.AutoPrestoMode = M(true, 'Auto Presto Mode')
	state.DanceStance = M{['description']='Dance Stance','None','Saber Dance','Fan Dance'}
	state.AutoBuilding = M(false, 'Auto Building Flourish Mode')

	autows = "Rudra's Storm"
	autofood = 'Soy Ramen'
	
	function calculate_step_feet_reduction()
		local tp_reduction = 0
		
		if sets.precast.Step and sets.precast.Step.feet and standardize_set(sets.precast.Step).feet:startswith('Horos T. Shoes') then
			if sets.precast.Step.feet:endswith('+2') then
				tp_reduction = 10
			elseif sets.precast.Step.feet:endswith('+3') then
				tp_reduction = 20
			end
		end
		
		return tp_reduction 
	end

	step_feet_reduction = calculate_step_feet_reduction()
	
    update_melee_groups()
	init_job_states({"Capacity","AutoRuneMode","AutoTrustMode","AutoWSMode","AutoShadowMode","AutoFoodMode","AutoStunMode","AutoDefenseMode",},{"AutoBuffMode","AutoSambaMode","Weapons","OffenseMode","WeaponskillMode","IdleMode","DanceStance","Passive","RuneElement","TreasureMode",})
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------
-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
-- Set eventArgs.useMidcastGear to true if we want midcast gear equipped on precast.
step_timer = 0

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'WAR' then
        set_macro_page(1, 13)
    elseif player.sub_job == 'SAM' then
	    set_macro_page(1, 13)
    else
        set_macro_page(1, 13)
    end
end

function job_filtered_action(spell, eventArgs)
	if spell.type == 'WeaponSkill' then
		local available_ws = S(windower.ffxi.get_abilities().weapon_skills)
		-- WS 1 is Combo, h2h equipped.
		if available_ws:contains(1) then
            if spell.english == "Pyrrhic Kleos" then
				windower.chat.input('/ws "Asuran Fists" '..spell.target.raw)
                cancel_spell()
				eventArgs.cancel = true
            elseif spell.english == "Rudra's Storm" then
                windower.chat.input('/ws "Asuran Fists" '..spell.target.raw)
                cancel_spell()
				eventArgs.cancel = true
            end
        end
	end
end

function job_precast(spell, spellMap, eventArgs)
	-- Flourish WS
	if spell.type == 'WeaponSkill' and state.AutoBuffMode.value ~= 'Off' and not silent_check_amnesia() then
		local abil_recasts = windower.ffxi.get_ability_recasts()
		if not under3FMs() and not state.Buff['Building Flourish'] and not state.Buff['Presto'] and abil_recasts[226] < latency and player.status == 'Engaged'  then
			eventArgs.cancel = true
			windower.chat.input('/ja "Climactic Flourish" <me>')
			windower.chat.input:schedule(1.6,'/ws "'..spell.english..'" '..spell.target.raw..'')
			tickdelay = os.clock() + 2.8
			return
		elseif state.AutoBuilding.value and not under3FMs() and not state.Buff['Climactic Flourish'] and not state.Buff['Presto'] and abil_recasts[222] < latency and player.status == 'Engaged' then
			eventArgs.cancel = true
			windower.chat.input('/ja "Building Flourish" <me>')
			windower.chat.input:schedule(1.6,'/ws "'..spell.english..'" '..spell.target.raw..'')
			tickdelay = os.clock() + 2.8
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
        if state.Buff['Climactic Flourish'] and sets.buff['Climactic Flourish'] then
            equip(sets.buff['Climactic Flourish'])
        end
	end
end

-- Return true if we handled the aftercast work.  Otherwise it will fall back
-- to the general aftercast() code in Mote-Include.
function job_aftercast(spell, spellMap, eventArgs)
    -- Lock feet after using Mana Wall.
    if not spell.interrupted then
		if spell.type == 'WeaponSkill' and state.Buff['Climactic Flourish'] and not under3FMs() and player.tp < 999 then
			local abil_recasts = windower.ffxi.get_ability_recasts()
			if abil_recasts[222] < latency then
				windower.chat.input:schedule(1.5,'/ja "Reverse Flourish" <me>')
			end
		elseif state.UseAltStep.value and spell.english == state[state.CurrentStep.current..'Step'].current then
			state.CurrentStep:cycle()
		end
    end
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.
function job_buff_change(buff,gain)
	update_melee_groups()
end

-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

-- Called by the default 'update' self-command.
function job_update(cmdParams, eventArgs)
    update_melee_groups()
end


function job_customize_idle_set(idleSet)
    return idleSet
end

function job_customize_melee_set(meleeSet)
    if state.DefenseMode.value ~= 'None' then
        if state.Buff['Saber Dance'] then
            meleeSet = set_combine(meleeSet, sets.buff['Saber Dance'])
        end
        if state.Buff['Climactic Flourish'] then
            meleeSet = set_combine(meleeSet, sets.buff['Climactic Flourish'])
        end
    end
    
    return meleeSet
end

-- Function to display the current relevant user state when doing an update.
-- Set eventArgs.handled to true if display was handled, and you don't want the default info shown.
function display_current_job_state(eventArgs)
    local msg = 'Melee'
    
    if state.CombatForm.has_value then
        msg = msg .. ' (' .. state.CombatForm.value .. ')'
    end
    
    msg = msg .. ': '
    
    msg = msg .. state.OffenseMode.value
    if state.HybridMode.value ~= 'Normal' then
        msg = msg .. '/' .. state.HybridMode.value
    end
    msg = msg .. ', WS: ' .. state.WeaponskillMode.value
    
    if state.DefenseMode.value ~= 'None' then
        msg = msg .. ', ' .. 'Defense: ' .. state.DefenseMode.value .. ' (' .. state[state.DefenseMode.value .. 'DefenseMode'].value .. ')'
    end
    
    if state.Kiting.value then
        msg = msg .. ', Kiting'
    end

    msg = msg .. ', ['..state.MainStep.current

    if state.UseAltStep.value == true then
        msg = msg .. '/'..state.AltStep.current
    end
    
    msg = msg .. ']'

    if state.SelectStepTarget.value == true then
        steps = steps..' (Targetted)'
    end

    add_to_chat(122, msg)

    eventArgs.handled = true
end


-------------------------------------------------------------------------------------------------------------------
-- User self-commands.
-------------------------------------------------------------------------------------------------------------------

-- Called for custom player commands.
function job_self_command(commandArgs, eventArgs)
    if commandArgs[1] == 'step' then
        local doStep = ''
        if state.UseAltStep.value == true then
            doStep = state[state.CurrentStep.current..'Step'].current
        else
            doStep = state.MainStep.current
        end        
        
        send_command('@input /ja "'..doStep..'" <t>')
    end
end

function job_tick()
	if check_dance() then return true end
	if check_buff() then return true end
	if check_steps_presto() then return true end
	--if check_jump() then return true end
	return false
end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

function update_melee_groups()
	classes.CustomMeleeGroups:clear()

	if state.Buff['Saber Dance'] then
		classes.CustomMeleeGroups:append('Saber')
	end	
	
	if player.equipment.main and player.equipment.main == "Terpsichore" and state.Buff['Aftermath: Lv.3'] then
		classes.CustomMeleeGroups:append('AM')
	end
end

function under3FMs()
	if not buffactive['Finishing Move 3'] and not buffactive['Finishing Move 4'] and not buffactive['Finishing Move 5'] and not buffactive['Finishing Move (6+)'] then
		return true
	else
		return false
	end
end

function check_buff()

	if state.AutoBuffMode.value ~= 'Off' then
		local abil_recasts = windower.ffxi.get_ability_recasts()
	
		if not buffactive['Finishing Move 1'] and not buffactive['Finishing Move 2'] and not buffactive['Finishing Move 3'] and not buffactive['Finishing Move 4'] and not buffactive['Finishing Move 5'] and not buffactive['Finishing Move (6+)'] and abil_recasts[223] < latency then
			windower.chat.input('/ja "No Foot Rise" <me>')
			tickdelay = os.clock() + 1.1
			return true
		end
		
		if player.in_combat and not state.Buff['SJ Restriction'] then
			if player.sub_job == 'WAR' and not buffactive.Berserk and abil_recasts[1] < latency then
				windower.chat.input('/ja "Berserk" <me>')
				tickdelay = os.clock() + 1.1
				return true
			elseif player.sub_job == 'WAR' and not buffactive.Aggressor and abil_recasts[4] < latency then
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

function check_dance()

	if state.DanceStance.value ~= 'None' and not (state.Buff['Saber Dance'] or state.Buff['Fan Dance']) and player.in_combat then
		
		local abil_recasts = windower.ffxi.get_ability_recasts()
		
		if state.DanceStance.value == 'Saber Dance' and abil_recasts[219] < latency then
			windower.chat.input('/ja "Saber Dance" <me>')
			tickdelay = os.clock() + 1.1
			return true
		elseif state.DanceStance.value == 'Fan Dance' and abil_recasts[224] < latency then
			windower.chat.input('/ja "Fan Dance" <me>')
			tickdelay = os.clock() + 1.1
			return true
		else
			return false
		end
	end

	return false
end

function step_cost()
	local cost = 100
	
	if player.equipment.main == 'Setan Kober' then cost = cost - 40 end
	if player.equipment.sub == 'Setan Kober' then cost = cost - 40 end
	if state.DefenseMode.value == 'None' then cost = cost - step_feet_reduction end
	
	return cost
end

--Steps only on presto with enough TP
function check_steps_presto()
	local abil_recasts = windower.ffxi.get_ability_recasts()
	if state.AutoBuffMode.value ~= 'off' and state.AutoPrestoMode.value and player.tp > 140 and not silent_check_amnesia() then
		if (abil_recasts[236] < latency or state.Buff['Presto']) and abil_recasts[220] < latency and player.status == 'Engaged' then  -- (under3FMs() or os.clock() > step_timer) and 
			if player.tp > 140 and (state.Buff['Presto']) then
				local doStep = ''
				if state.UseAltStep.value == true then
					doStep = state[state.CurrentStep.current..'Step'].current
				else
					doStep = state.MainStep.current
				end        
				windower.chat.input('/ja "'..doStep..'" <t>')
				tickdelay = os.clock() + 1.2
				step_timer = os.clock() + 15
				return true
			elseif player.tp > 140 and abil_recasts[236] < latency then
				windower.chat.input('/ja "Presto" <me>')
				tickdelay = os.clock() + 1.2
				return true
			else
				return false
			end
		end
	end
end

-- function check_jump()
    -- if state.AutoJumpMode.value and player.status == 'Engaged' and player.sub_job == 'DRG' and not buffactive['SJ Restriction'] then
        -- local abil_recasts = windower.ffxi.get_ability_recasts()

		-- if player.hpp < 65 and abil_recasts[160] < latency then
			-- windower.chat.input('/ja "Super Jump" <t>')
            -- tickdelay = os.clock() + 1.1
            -- return true
		-- elseif player.tp < 901 and abil_recasts[158] < latency then
            -- windower.chat.input('/ja "Jump" <t>')
            -- tickdelay = os.clock() + 1.1
            -- return true
        -- elseif player.tp < 901 and abil_recasts[159] < latency then
            -- windower.chat.input('/ja "High Jump" <t>')
            -- tickdelay = os.clock() + 1.1
            -- return true
        -- else
            -- return false
        -- end
    -- end
-- end

