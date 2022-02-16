-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	-- Default macro set/book
	if player.sub_job == 'DRG' then
		set_macro_page(1, 16)
	elseif player.sub_job == 'WAR' then
		set_macro_page(1, 16)
	elseif player.sub_job == 'RDM' then
		set_macro_page(5, 16)
	else
		set_macro_page(1, 16)
	end
end

buff_spell_lists = {
	Auto = {--Options for When are: Always, Engaged, Idle, OutOfCombat, Combat
		{Name='Erratic Flutter',	Buff='Haste',			SpellID=710,	When='Always'},
		{Name='Battery Charge',		Buff='Refresh',			SpellID=662,	When='Idle'},
		{Name='Refresh',			Buff='Refresh',			SpellID=109,	When='Idle'},
		{Name='Mighty Guard',		Buff='Mighty Guard',	SpellID=750,	When='Combat'},
	},
	Default = {
		{Name='Erratic Flutter',	Buff='Haste',			SpellID=710,	Reapply=false},
		{Name='Battery Charge',		Buff='Refresh',			SpellID=662,	Reapply=false},
		{Name='Refresh',			Buff='Refresh',			SpellID=109,	Reapply=false},
		{Name='Phalanx',			Buff='Phalanx',			SpellID=106,	Reapply=false},
		{Name='Barrier Tusk',		Buff='Phalanx',			SpellID=685,	Reapply=false},
		{Name='Stoneskin',			Buff='Stoneskin',		SpellID=54,		Reapply=false},
		{Name='Occultation',		Buff='Blink',			SpellID=679,	Reapply=false},
		{Name='Blink',				Buff='Blink',			SpellID=53,		Reapply=false},
		{Name='Mighty Guard',		Buff='Mighty Guard',	SpellID=750,	Reapply=false},
		{Name='Nat. Meditation',	Buff='Attack Boost',	SpellID=700,	Reapply=false},
	},
}

function job_tick()
	if check_arts() then return true end
	if check_buff() then return true end
	if check_jump() then return true end
	if check_buffup() then return true end
	if state.AutoBLUSpam.value and player.in_combat and player.target.type == "MONSTER" and not moving then
		if check_tp_lower() then return true end
			tickdelay = os.clock() + 1.5
		return true
	end
	return false
end

function job_filter_precast(spell, spellMap, eventArgs)
	if spell.skill == 'Blue Magic' and unbridled_spells:contains(spell.english) and not silent_check_amnesia() and not (buffactive['Unbridled Learning'] or buffactive['Unbridled Wisdom']) and not buffactive['Diffusion'] then
		if (windower.ffxi.get_ability_recasts()[184] < latency or windower.ffxi.get_ability_recasts()[81] < latency) and (windower.ffxi.get_spell_recasts()[spell.recast_id]/60) < spell_latency then
			eventArgs.cancel = true
			windower.chat.input('/ja "Diffusion" <me>')
			windower.chat.input:schedule(1.7,'/ja "Unbridled Learning" <me>')
			windower.chat.input:schedule(3.4,'/ma "'..spell.english..'" '..spell.target.raw..'')
			return
		else
			eventArgs.cancel = true
			add_to_chat(123,'Abort: Unbridled Learning and Diffusion not active.')
		end
	end
end

function job_filtered_action(spell, eventArgs)
	if spell.type == 'WeaponSkill' then
		local available_ws = S(windower.ffxi.get_abilities().weapon_skills)
		-- WS 160 is Shining Strike, meaning a club is equipped.
		if available_ws:contains(160) then
            if spell.english == "Chant du Cygne" then
                send_command('@input /ws "Realmrazer" '..spell.target.raw)
                cancel_spell()
				eventArgs.cancel = true
            elseif spell.english == "Sanguine Blade" then
                send_command('@input /ws "Flash Nova" '..spell.target.raw)
                cancel_spell()
				eventArgs.cancel = true
            elseif spell.english == "Flat Blade" then
                send_command('@input /ws "Brainshaker" '..spell.target.raw)
                cancel_spell()
				eventArgs.cancel = true
            elseif spell.english == "Expiacion" then
                send_command('@input /ws "Black Halo" '..spell.target.raw)
                cancel_spell()
				eventArgs.cancel = true
            elseif spell.english == "Savage Blade" then
                send_command('@input /ws "Black Halo" '..spell.target.raw)
                cancel_spell()
				eventArgs.cancel = true
            end
        end
	end
end

function check_buff()
	if state.AutoBuffMode.value ~= 'Off' and not data.areas.cities:contains(world.area) then
		local spell_recasts = windower.ffxi.get_spell_recasts()
		for i in pairs(buff_spell_lists[state.AutoBuffMode.Value]) do
			if not buffactive[buff_spell_lists[state.AutoBuffMode.Value][i].Buff] and (buff_spell_lists[state.AutoBuffMode.Value][i].When == 'Always' or (buff_spell_lists[state.AutoBuffMode.Value][i].When == 'Combat' and (player.in_combat or being_attacked)) or (buff_spell_lists[state.AutoBuffMode.Value][i].When == 'Engaged' and player.status == 'Engaged') or (buff_spell_lists[state.AutoBuffMode.Value][i].When == 'Idle' and player.status == 'Idle') or (buff_spell_lists[state.AutoBuffMode.Value][i].When == 'OutOfCombat' and not (player.in_combat or being_attacked))) and spell_recasts[buff_spell_lists[state.AutoBuffMode.Value][i].SpellID] < spell_latency and silent_can_use(buff_spell_lists[state.AutoBuffMode.Value][i].SpellID) then
				if not unbridled_spells:contains(buff_spell_lists[state.AutoBuffMode.Value][i].Name) or (unbridled_ready() and windower.ffxi.get_ability_recasts()[184] < latency) then
					windower.chat.input('/ma "'..buff_spell_lists[state.AutoBuffMode.Value][i].Name..'" <me>')
					tickdelay = os.clock() + 5.5
					return true
				end
			end
		end
		
		if player.in_combat and player.sub_job == 'WAR' and not silent_check_amnesia() and not buffactive['SJ Restriction'] then
			local abil_recasts = windower.ffxi.get_ability_recasts()

			if not buffactive.Berserk and abil_recasts[1] < latency then
				windower.chat.input('/ja "Berserk" <me>')
				tickdelay = os.clock() + 2.5
				return true
			elseif not buffactive.Aggressor and abil_recasts[4] < latency then
				windower.chat.input('/ja "Aggressor" <me>')
				tickdelay = os.clock() + 2.5
				return true
			end
		end
		
	else
		return false
	end
end

function check_tp_lower()
	local spell_recasts = windower.ffxi.get_spell_recasts()

	if spell_recasts[573] < spell_latency then
		windower.chat.input('/ma "Feather Tickle" <t>')
		tickdelay = os.clock() + 2
		return true
	elseif spell_recasts[684] < spell_latency then
		windower.chat.input('/ma "Reaving Wind" <t>')
		tickdelay = os.clock() + 2
		return true
	else
		return false
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