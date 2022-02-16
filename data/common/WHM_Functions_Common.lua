
buff_spell_lists = {
	Auto = {--Options for When are: Always, Engaged, Idle, OutOfCombat, Combat
		{Name='Reraise IV',		Buff='Reraise',		SpellID=848,	When='Always'},
		{Name='Haste',			Buff='Haste',		SpellID=57,		When='Always'},
		{Name='Aurorastorm',	Buff='Aurorastorm',	SpellID=119,	When='Always'},
		{Name='Refresh',		Buff='Refresh',		SpellID=109,	When='Always'},
		{Name='Shellra V',		Buff='Shell',		SpellID=134,	When='Always'},
		{Name='Protectra V',	Buff='Protect',		SpellID=129,	When='Always'},
	},

	Default = {
		{Name='Haste',			Buff='Haste',		SpellID=57,		Reapply=false},
		{Name='Reraise IV',		Buff='Reraise',		SpellID=848,	Reapply=false},
		{Name='Refresh',		Buff='Refresh',		SpellID=109,	Reapply=false},
		{Name='Shellra V',		Buff='Shell',		SpellID=134,	Reapply=false},
		{Name='Protectra V',	Buff='Protect',		SpellID=129,	Reapply=false},
		{Name='Aquaveil',		Buff='Aquaveil',	SpellID=55,		Reapply=false},
		{Name='Stoneskin',		Buff='Stoneskin',	SpellID=54,		Reapply=false},
		{Name='Blink',			Buff='Blink',		SpellID=53,		Reapply=false},
		{Name='Phalanx',		Buff='Phalanx',		SpellID=106,	Reapply=false},
	},
	Rebuff = {
		{Name='Reraise IV',		Buff='Reraise',		SpellID=848,	Reapply=false},
		{Name='Refresh',		Buff='Refresh',		SpellID=109,	Reapply=false},
		{Name='Shellra V',		Buff='Shell',		SpellID=134,	Reapply=true},
		{Name='Protectra V',	Buff='Protect',		SpellID=129,	Reapply=true},
	},
	Melee = {
		{Name='Auspice',		Buff='Auspice',		SpellID=96,		Reapply=false},
		{Name='Boost-STR',		Buff='STR Boost',	SpellID=479,	Reapply=false},
	},
}

function job_precast(spell, spellMap, eventArgs)
	if spell.action_type == 'Magic' then
		if spellMap == 'Cure' or spellMap == 'Curaga' then
			gear.default.obi_waist = gear.obi_cure_waist
			gear.default.obi_back = gear.obi_cure_back
		elseif spell.english == 'Holy II' then
			gear.default.obi_waist = gear.obi_high_nuke_waist
		elseif spell.english == 'Holy' or (spell.skill == 'Elemental Magic' and default_spell_map ~= 'ElementalEnfeeble') then
			gear.default.obi_waist = gear.obi_nuke_waist
			gear.default.obi_back = gear.obi_nuke_back
		elseif spellMap == 'StatusRemoval' and not (spell.english == "Erase" or spell.english == "Esuna" or spell.english == "Sacrifice") then
			local abil_recasts = windower.ffxi.get_ability_recasts()
			if abil_recasts[32] < latency and not silent_check_amnesia() and state.AutoCaress.value then
				eventArgs.cancel = true
				windower.chat.input('/ja "Divine Caress" <me>')
				windower.chat.input:schedule(1,'/ma "'..spell.english..'" '..spell.target.raw..'')
				return
			end
		elseif spell.english == 'Regen IV' or spell.english == 'Invisible' or spell.english == 'Sneak' then
			local abil_recasts = windower.ffxi.get_ability_recasts()
			if player.sub_job == "SCH" and get_current_stratagem_count() > 0 and not(buffactive.Accession or silent_check_amnesia()) and not buffactive['SJ Restriction'] then
				if state.Buff['Light Arts'] then
					windower.chat.input('/ja "Accession" <me>')
					windower.chat.input:schedule(1.6,'/ma "'..spell.english..'" '..spell.target.raw..'')
					add_to_chat(122,'Accession - "'..spell.english..'" !')
					eventArgs.cancel = true
					tickdelay = os.clock() + 4.6
				else
					if abil_recasts[228] < latency then
						windower.chat.input('/ja "Light Arts" <me>')
						windower.chat.input:schedule(1.6,'/ja "Accession" <me>')
						windower.chat.input:schedule(3.1,'/ma "'..spell.english..'" '..spell.target.raw..'')
						add_to_chat(122,'Accession - "'..spell.english..'" !')
						eventArgs.cancel = true
						tickdelay = os.clock() + 6.2
					end
				end
			end
		end
	elseif spell.type == 'JobAbility' then
		local abil_recasts = windower.ffxi.get_ability_recasts()
		if spell.english == 'Devotion' and state.BlockLowDevotion.value and abil_recasts[28] < latency and player.hpp < 50 then
			eventArgs.cancel = true
			add_to_chat(123,'Abort: Blocking Devotion under 50% HP to prevent inefficient use.')
		end
	end
    if state.CastingMode.value == 'Proc' then
		classes.CustomClass = 'Proc'
    end
end
