function select_default_macro_book()
	if player.sub_job == 'BLM' then
		set_macro_page(1, 5)
	elseif player.sub_job == 'SCH' then
		set_macro_page(1, 5)
	elseif player.sub_job == 'NIN' then
		set_macro_page(1, 5)
	else
		set_macro_page(1, 5)
	end
end

function user_job_buff_change(buff, gain)
	if buff:startswith('Addendum: ') or buff:endswith(' Arts') then
		style_lock = true
	end
end

buff_spell_lists = {
	Auto = {--Options for When are: Always, Engaged, Idle, OutOfCombat, Combat
		{Name='Refresh III',	Buff='Refresh',			SpellID=894,	When='Always'},
		{Name='Haste II',		Buff='Haste',			SpellID=511,	When='Always'},
		{Name='Aurorastorm',	Buff='Aurorastorm',		SpellID=119,	When='Always'},
		{Name='Temper II',		Buff='Multi Strikes',	SpellID=895,	When='Engaged'},
		{Name='Phalanx',		Buff='Phalanx',			SpellID=106,	When='Engaged'},
	},
	Default = {
		{Name='Refresh III',	Buff='Refresh',			SpellID=894,	Reapply=false},
		{Name='Haste II',		Buff='Haste',			SpellID=511,	Reapply=false},
		{Name='Stoneskin',		Buff='Stoneskin',		SpellID=54,		Reapply=false},
		{Name='Shell V',		Buff='Shell',			SpellID=52,		Reapply=false},
		{Name='Protect V',		Buff='Protect',			SpellID=47,		Reapply=false},
		{Name='Temper II',		Buff='Multi Strikes',	SpellID=895, 	Reapply=false},
		{Name='Phalanx',		Buff='Phalanx',			SpellID=106,	Reapply=false},
		{Name='Aquaveil',		Buff='Aquaveil',		SpellID=55,		Reapply=false},
	},
	
}

function check_buff()
	if state.AutoBuffMode.value ~= 'Off' and not data.areas.cities:contains(world.area) then
		local spell_recasts = windower.ffxi.get_spell_recasts()
		local abil_recasts = windower.ffxi.get_ability_recasts()
		for i in pairs(buff_spell_lists[state.AutoBuffMode.Value]) do
			if not buffactive[buff_spell_lists[state.AutoBuffMode.Value][i].Buff] and (buff_spell_lists[state.AutoBuffMode.Value][i].When == 'Always' or (buff_spell_lists[state.AutoBuffMode.Value][i].When == 'Combat' and (player.in_combat or being_attacked)) or (buff_spell_lists[state.AutoBuffMode.Value][i].When == 'Engaged' and player.status == 'Engaged') or (buff_spell_lists[state.AutoBuffMode.Value][i].When == 'Idle' and player.status == 'Idle') or (buff_spell_lists[state.AutoBuffMode.Value][i].When == 'OutOfCombat' and not (player.in_combat or being_attacked))) and spell_recasts[buff_spell_lists[state.AutoBuffMode.Value][i].SpellID] < spell_latency and silent_can_use(buff_spell_lists[state.AutoBuffMode.Value][i].SpellID) then
				windower.chat.input('/ma "'..buff_spell_lists[state.AutoBuffMode.Value][i].Name..'" <me>')
				tickdelay = os.clock() + 2
				return true
			end
		end

		-- Convert
		if abil_recasts[49] < latency and player.mpp < 10 and not silent_check_amnesia() then
			add_to_chat(122,'MP low, Converting!')
			windower.chat.input('/ja Convert <me>')
			tickdelay = os.clock() + 2
			return true
		end
	else
		return false
	end
end

