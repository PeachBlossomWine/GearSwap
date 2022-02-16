-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    set_macro_page(1, 10)
end

buff_spell_lists = {
	Auto = {--Options for When are: Always, Engaged, Idle, OutOfCombat, Combat
		{Name='Refresh',			Buff='Refresh',			SpellID=109,	When='Idle'},
		{Name='Haste',				Buff='Haste',			SpellID=57,		Reapply='Idle'},
	},
	Default = {
		{Name='Refresh',			Buff='Refresh',			SpellID=109,	Reapply=false},
		{Name='Phalanx',			Buff='Phalanx',			SpellID=106,	Reapply=false},
		{Name='Stoneskin',			Buff='Stoneskin',		SpellID=54,		Reapply=false},
		{Name='Blink',				Buff='Blink',			SpellID=53,		Reapply=false},
	},
}

function job_tick()
	if check_song() then return true end
	if check_buff() then return true end
	if check_buffup() then return true end
	if check_zerg_sp() then return true end
	if check_steps_subjob() then return true end
	return false
end

function job_filtered_action(spell, eventArgs)
	if spell.type == 'WeaponSkill' then
		local available_ws = S(windower.ffxi.get_abilities().weapon_skills)
		
		if available_ws:contains(32) then
			if spell.english == "Rudra's Storm" then
				send_command('@input /ws "Savage Blade" '..spell.target.raw)
                cancel_spell()
				eventArgs.cancel = true
			end
		end
	end
end

weapon_castingmode = {['None']='Normal',['Carnwenhan']='Melee',['Aeneas']='Melee',['Naegling']='Melee',['DualCarn']='Melee',['DualAeneas']='Melee',['DualSavage']='Melee',}

function user_job_state_change(stateField, newValue, oldValue)
	if stateField == 'Weapons' then
		if weapon_castingmode[newValue] then 
			state.CastingMode:set(weapon_castingmode[newValue]) 
		end
	end
end

singeron = false

function check_zerg_sp()
	if state.AutoZergMode.value == 'On' then
		
		local abil_recasts = windower.ffxi.get_ability_recasts()

		if (not buffactive['Soul Voice'] and abil_recasts[0] < latency) or (not buffactive['Clarion Call'] and abil_recasts[254] < latency) then
			send_command('sing off')
			singeron = false
			if not buffactive['Soul Voice'] and abil_recasts[0] < latency then
				windower.chat.input('/ja "Soul Voice" <me>')
			elseif not buffactive['Clarion Call'] and abil_recasts[254] < latency then
				windower.chat.input('/ja "Clarion Call" <me>')
			end
			tickdelay = os.clock() + 1.8
			return true		
		elseif buffactive['Soul Voice'] and buffactive['Clarion Call'] and singeron == false then
			send_command('sing n on; sing on')
			singeron = true
			tickdelay = os.clock() + 1.8
			return true
		else
			return false
		end
	end
		
	return false
end