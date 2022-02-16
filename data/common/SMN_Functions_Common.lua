function select_default_macro_book(reset)
    if reset == 'reset' then
        -- lost pet, or tried to use pact when pet is gone
    end
    -- Default macro set/book
    set_macro_page(1, 15)
end

buff_spell_lists = {
	Auto = {--Options for When are: Always, Engaged, Idle, OutOfCombat, Combat
		{Name='Refresh',		Buff='Refresh',		SpellID=109,	When='Idle'},
	},
	Default = {
		{Name='Refresh',		Buff='Refresh',		SpellID=109,	Reapply=false},
		{Name='Haste',			Buff='Haste',		SpellID=57,		Reapply=false},
		{Name='Stoneskin',		Buff='Stoneskin',	SpellID=54,		Reapply=false},
		{Name='Blink',			Buff='Blink',		SpellID=53,		Reapply=false},
		{Name='Regen',			Buff='Regen',		SpellID=52,		Reapply=false},
	},
}

function job_post_midcast(spell, action, spellMap, eventArgs)
	--Cure with OBI
	if spell.skill == 'Healing Magic' then
		if (spell.element == world.day_element or spell.element == world.weather_element) then
            equip(sets.CureObi)
        end
    end
end

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
		end
	end

    if pet.isvalid then
	
        if sets.perp[pet.name] and state.IdleMode.value:contains('DT') then
            idleSet = set_combine(idleSet, sets.perp[pet.name].DT)
		else
			idleSet = set_combine(idleSet, sets.perp[pet.name])
        end
		
        if pet.status == 'Engaged' then
			if state.IdleMode.value:contains('DT') then
				idleSet = sets.idle.DT.Avatar.Engaged
				if sets.idle.Avatar.Engaged[pet.name] then
					idleSet = sets.idle.DT.Avatar.Engaged[pet.name]
				end
			else
				idleSet = set_combine(idleSet, sets.idle.Avatar.Engaged)
				if sets.idle.Avatar.Engaged[pet.name] then
					idleSet = set_combine(idleSet, sets.idle.Avatar.Engaged[pet.name])
				end
			end
        end
    end
   
    return idleSet
end

function check_auto_avatar_mode()

	if not (state.AutoBPMode.value or state.AutoAvatarMode.value) and not state.BPWardToggle.value or data.areas.cities:contains(world.area) then return false end
	
	local abil_recasts = windower.ffxi.get_ability_recasts()
	local spell_recasts = windower.ffxi.get_spell_recasts()
	
	local avatar_map = {['Carbuncle']=296,['Fenrir']=297,['Ifrit']=298,['Titan']=299,
		['Leviathan']=300,['Garuda']=301,['Shiva']=302,['Ramuh']=303,['Diabolos']=304,
		['Cait Sith']=307,['Siren']=355}
	
	-- Summon
	if not pet.isvalid and (state.AutoBPMode.value or state.AutoAvatarMode.value) and state.BPWardToggle.value and not moving and not silent_check_silence() then
		if spell_recasts[avatar_map[state.Avatar.value]] < spell_latency then
			windower.add_to_chat(261, '[AutoSMN] -BP/Avatar- Summon: ' .. state.Avatar.value)
			windower.chat.input('/ma "' .. state.Avatar.value .. '" <me>')
			tickdelay = os.clock() + 5.0
			return true
		end
	end
	
	-- Check correct avatar + Low HP
	if (state.AutoBPMode.value or state.AutoAvatarMode.value) and state.BPWardToggle.value and pet.isvalid and abil_recasts[172] < latency and not silent_check_amnesia() and (pet.name ~= state.Avatar.value or pet.hpp < 25) then
		windower.add_to_chat(261, '[AutoSMN] -BP/Avatar- Release HP/incorrect avatar.')
		windower.chat.input('/ja "Release" <me>')
		tickdelay = os.clock() + 5.0
		return true
	end
	
	-- Assault
	if (state.AutoBPMode.value or state.AutoAvatarMode.value) and state.BPWardToggle.value and pet.isvalid and pet.status == "Idle" and player.target.type == "MONSTER" and player.in_combat and abil_recasts[170] < latency and not silent_check_amnesia() and pet.name ~= "Cait Sith" then
		windower.add_to_chat(261, '[AutoSMN] -BP/Avatar- Assault.')
		windower.chat.input('/pet "Assault" <t>')
		tickdelay = os.clock() + 4.5
		return true
	elseif (state.AutoBPMode.value or state.AutoAvatarMode.value) and state.BPWardToggle.value and pet.isvalid and pet.name == "Cait Sith" and pet.status == "Engaged" then
		windower.add_to_chat(261, '[AutoSMN] -BP/Avatar- HEEL - Cait Sith ONLY -')
		windower.chat.input('/pet "Retreat" <me>')
		tickdelay = os.clock() + 4.5
		return true
	end
	
	-- BP mode
	if state.AutoBPMode.value and state.BPWardToggle.value and pet.isvalid and player.in_combat and abil_recasts[174] < latency and player.target.type == "MONSTER" and not silent_check_amnesia() and (pet.name == "Leviathan" or pet.name == "Cait Sith") then -- and pet.status == "Engaged" 
		windower.add_to_chat(261, '[AutoSMN] -BP- BloodPact: ' .. pacts.autobp[pet.name])
		windower.chat.input('/pet "'..pacts.autobp[pet.name]..'"')
		tickdelay = os.clock() + 4.5
		return true
	elseif state.AutoBPMode.value and state.BPWardToggle.value and pet.isvalid and player.in_combat and pet.status == "Engaged" and abil_recasts[173] < latency and player.target.type == "MONSTER" and not silent_check_amnesia() then
		windower.add_to_chat(261, '[AutoSMN] -BP- BloodPact: ' .. pacts.autobp[pet.name])
		if state.AutoSMNSCMode.value then
			windower.send_command('wait 2.1; input /pet "'..pacts.autobp[pet.name]..'"')
		else
			windower.chat.input('/pet "'..pacts.autobp[pet.name]..'"')
		end
		if pet.name == "Ramuh" then
			windower.send_command('wait 1.5; mc smn VS')
		elseif pet.name == "Ifrit" then
			windower.send_command('wait 1.5; mc smn FC')
		end
		tickdelay = os.clock() + 5.5
		return true
	end
	
end

function check_auto_ward_mode()

	if state.AutoWardMode.value == 'Off' or data.areas.cities:contains(world.area) then 
		state.BPWardToggle.value = true
		return false 
	end
	
	local abil_recasts = windower.ffxi.get_ability_recasts()
	local spell_recasts = windower.ffxi.get_spell_recasts()
	
	local avatar_map = {['Carbuncle']=296,['Fenrir']=297,['Ifrit']=298,['Titan']=299,
		['Leviathan']=300,['Garuda']=301,['Shiva']=302,['Ramuh']=303,['Diabolos']=304,
		['Cait Sith']=307,['Siren']=355}

	-- Full wards for BPWardToggle flag
	needsbuff = false
	for i in pairs(AutoWards[state.AutoWardMode.value]) do
		if not buffactive[AutoWards[state.AutoWardMode.value][i].Buff] then
			needsbuff = true
			state.BPWardToggle.value = false
			tickdelay = os.clock() + 2.1
			break
		end
	end

	-- All ward buffs up, toggles BPWardToggle
	if not needsbuff and state.AutoBPMode.value then
		state.BPWardToggle.value = true
		tickdelay = os.clock() + 2.5
		return false
	elseif not needsbuff then
		if not (state.AutoBPMode.value or state.AutoAvatarMode.value) and pet.isvalid and abil_recasts[172] < latency and not silent_check_amnesia() then
			windower.add_to_chat(261, '[AutoSMN] -Ward-: All ward buffs up, releasing current avatar!')
			windower.chat.input('/ja "Release" <me>')
		end
		tickdelay = os.clock() + 4.5
		return false
	end

	for i in pairs(AutoWards[state.AutoWardMode.value]) do

		if not buffactive[AutoWards[state.AutoWardMode.value][i].Buff] and state.AutoWardMode.value ~= 'Off' and spell_recasts[avatar_map[AutoWards[state.AutoWardMode.value][i].Name]] < spell_latency then 
			-- Summon Avatar
			if not pet.isvalid or (pet.isvalid and pet.name ~= AutoWards[state.AutoWardMode.value][i].Name) and not moving and not silent_check_silence() then
				windower.add_to_chat(261, '[AutoSMN] -Ward- Summon: ' .. AutoWards[state.AutoWardMode.value][i].Name)
				windower.chat.input('/ma ' ..AutoWards[state.AutoWardMode.value][i].Name.. ' <me>')
				tickdelay = os.clock() + 9.5
				return true
			-- Ward BP
			elseif pet.isvalid and pet.name == AutoWards[state.AutoWardMode.value][i].Name and abil_recasts[174] < latency and not silent_check_amnesia() then --and not player.in_combat then
				windower.add_to_chat(261, '[AutoSMN] -Ward- BP: ' ..AutoWards[state.AutoWardMode.value][i].BP)
				if not player.in_combat then
					windower.chat.input('/pet "'..AutoWards[state.AutoWardMode.value][i].BP..'"')
					tickdelay = os.clock() + 7.0
					return true
				else
					if player.target.type == "MONSTER" then
						windower.chat.input('/pet "Assault" <t>')
						windower.chat.input:schedule(3.2,'/pet "'..AutoWards[state.AutoWardMode.value][i].BP..'"')
					else
						windower.chat.input('/pet "'..AutoWards[state.AutoWardMode.value][i].BP..'"')
					end
					tickdelay = os.clock() + 9.0
					return true
				end
			else
				tickdelay = os.clock() + 2.5
				return false
			end
		end
	end
	
end

function job_tick()
	if check_favor() then return true end
	if check_buff() then return true end
	if check_buffup() then return true end
	if check_auto_ward_mode() then return true end
	if check_auto_avatar_mode() then return true end
	return false
end
