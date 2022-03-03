-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    set_macro_page(1, 18)
end

buff_spell_lists = {
	Auto = {	
		--Options for When are: Always, Engaged, Idle, OutOfCombat, Combat
		{Name='Haste',			Buff='Haste',			SpellID=57,		When='Always'},
	},
	
	Healing = {
		{Name='Protect V',		Buff='Protect',			SpellID=47, 	When='Always'},
		{Name='Shell V',		Buff='Shell',			SpellID=52, 	When='Always'},
		{Name='Haste',			Buff='Haste',			SpellID=57,		When='Always'},
		{Name='Aurorastorm II', Buff='Aurorastorm',		SpellID=864,	When='Always'},
	},
	
	Nuking = {
		{Name='Klimaform',		Buff='Klimaform',		SpellID=287,	When='Combat'},
		{Name='Haste',			Buff='Haste',			SpellID=57,		When='Always'},
	},
	
	Default = {
		{Name='Protect V',		Buff='Protect',			SpellID=47, 	Reapply=false},
		{Name='Shell V',		Buff='Shell',			SpellID=52, 	Reapply=false},
		{Name='Regen V',		Buff='Regen',			SpellID=504,	Reapply=false},
		{Name='Haste',			Buff='Haste',			SpellID=57,		Reapply=false},
		{Name='Aquaveil',		Buff='Aquaveil',		SpellID=55,		Reapply=false},
		{Name='Stoneskin',		Buff='Stoneskin',		SpellID=54,		Reapply=false},
		{Name='Blink',			Buff='Blink',			SpellID=53,		Reapply=false},
		{Name='Phalanx',		Buff='Phalanx',			SpellID=106,	Reapply=false},
	},
}

function job_precast(spell, spellMap, eventArgs)

	if spell.action_type == 'Magic' then
		if spellMap == 'Cure' or spellMap == 'Curaga' then
			gear.default.obi_back = gear.obi_cure_back
			gear.default.obi_waist = gear.obi_cure_waist
		elseif spell.skill == 'Elemental Magic' and default_spell_map ~= 'ElementalEnfeeble' then
			if spell.english:contains('helix') then
				gear.default.obi_back = gear.obi_high_nuke_back
				gear.default.obi_waist = gear.obi_high_nuke_waist
				local abil_recasts = windower.ffxi.get_ability_recasts()
				if get_current_stratagem_count() > 0 and abil_recasts[233] < latency and not (buffactive['Ebullience'] or silent_check_amnesia()) and player.target.type == "MONSTER" then
					if state.Buff['Dark Arts'] or state.Buff['Addendum: Black'] then
						windower.chat.input('/ja "Ebullience" <me>')
						windower.chat.input:schedule(1.6,'/ma "'..spell.english..'" '..spell.target.raw..'')
						add_to_chat(122,'Ebullience - "'..spell.english..'" !')
						eventArgs.cancel = true
						tickdelay = os.clock() + 4.6
					else
						if abil_recasts[232] < latency and abil_recasts[233] < latency then
							windower.chat.input('/ja "Dark Arts" <me>')
							windower.chat.input:schedule(1.6,'/ja "Ebullience" <me>')
							windower.chat.input:schedule(3.2,'/ma "'..spell.english..'" '..spell.target.raw..'')
							add_to_chat(122,'Ebullience - "'..spell.english..'" !')
							eventArgs.cancel = true
							tickdelay = os.clock() + 6.2
						end
					end
				end
			-- else
				-- gear.default.obi_back = gear.obi_high_nuke_back
				-- gear.default.obi_waist = gear.obi_high_nuke_waist
			end
		-- Accession + Perpetuance
		elseif (spell.english == 'Regen V' or spell.english == 'Animus Minuo') and state.AutoAPMode.value then
			local abil_recasts = windower.ffxi.get_ability_recasts()
			if get_current_stratagem_count() > 1 and not(buffactive.Accession or silent_check_amnesia()) then -- or buffactive.Perpetuance
				if state.Buff['Light Arts'] or state.Buff['Addendum: White'] then
					windower.chat.input('/ja "Accession" <me>')
					windower.chat.input:schedule(1.6,'/ja "Perpetuance" <me>')
					windower.chat.input:schedule(3.2,'/ma "'..spell.english..'" '..spell.target.raw..'')
					add_to_chat(122,'Acc/Perp - "'..spell.english..'" !')
					eventArgs.cancel = true
					tickdelay = os.clock() + 5.6
				else
					if abil_recasts[228] < latency then
						windower.chat.input('/ja "Light Arts" <me>')
						windower.chat.input:schedule(1.6,'/ja "Accession" <me>')
						windower.chat.input:schedule(3.2,'/ja "Perpetuance" <me>')
						windower.chat.input:schedule(4.8,'/ma "'..spell.english..'" '..spell.target.raw..'')
						add_to_chat(122,'Acc/Perp - "'..spell.english..'" !')
						eventArgs.cancel = true
						tickdelay = os.clock() + 7.5
					end
				end
			end
		-- Accession
		elseif (spell.english == 'Protect V' or spell.english == 'Shell V' or spell.english == 'Invisible' or spell.english == 'Sneak' or spell.english == 'Adloquium') and state.AutoAPMode.value then
			local abil_recasts = windower.ffxi.get_ability_recasts()
			if get_current_stratagem_count() > 0 and not(buffactive.Accession or silent_check_amnesia()) then
				if state.Buff['Light Arts'] or state.Buff['Addendum: White'] then
					windower.chat.input('/ja "Accession" <me>')
					windower.chat.input:schedule(1.6,'/ma "'..spell.english..'" '..spell.target.raw..'')
					add_to_chat(122,'Accession - "'..spell.english..'" !')
					eventArgs.cancel = true
					tickdelay = os.clock() + 4.6
				else
					if abil_recasts[228] < latency then
						windower.chat.input('/ja "Light Arts" <me>')
						windower.chat.input:schedule(1.6,'/ja "Accession" <me>')
						windower.chat.input:schedule(3.2,'/ma "'..spell.english..'" '..spell.target.raw..'')
						add_to_chat(122,'Accession - "'..spell.english..'" !')
						eventArgs.cancel = true
						tickdelay = os.clock() + 6.2
					end
				end
			end
		-- Perpetuance
		elseif spell.english == 'Refresh' and state.AutoAPMode.value then -- spell.english == 'Haste' or 
			local abil_recasts = windower.ffxi.get_ability_recasts()
			if get_current_stratagem_count() > 0 and not(buffactive.Perpetuance or silent_check_amnesia()) then
				if state.Buff['Light Arts'] or state.Buff['Addendum: White'] then
					windower.chat.input('/ja "Perpetuance" <me>')
					windower.chat.input:schedule(1.6,'/ma "'..spell.english..'" '..spell.target.raw..'')
					add_to_chat(122,'Perpetuance - "'..spell.english..'" !')
					eventArgs.cancel = true
					tickdelay = os.clock() + 4.6
				else
					if abil_recasts[228] < latency then
						windower.chat.input('/ja "Light Arts" <me>')
						windower.chat.input:schedule(1.6,'/ja "Perpetuance" <me>')
						windower.chat.input:schedule(3.2,'/ma "'..spell.english..'" '..spell.target.raw..'')
						add_to_chat(122,'Perpetuance - "'..spell.english..'" !')
						eventArgs.cancel = true
						tickdelay = os.clock() + 6.2
					end
				end
			end
		end
        if state.CastingMode.value == 'Proc' then
            classes.CustomClass = 'Proc'
        elseif state.CastingMode.value == 'OccultAcumen' then
            classes.CustomClass = 'OccultAcumen'
        end
    end

end

function check_arts()
	--not arts_active() and 
	if (buffup ~= '' or (not data.areas.cities:contains(world.area) and state.AutoBuffMode.value ~= 'Off')) then
	
		local abil_recasts = windower.ffxi.get_ability_recasts()

		if state.AutoArts.value == 'Light' then
			if not state.Buff['Addendum: White'] then
				if not state.Buff['Light Arts'] and abil_recasts[228] < latency and not state.Buff['Addendum: White'] then
					windower.chat.input('/ja "Light Arts" <me>')
				elseif state.Buff['Light Arts'] and abil_recasts[233] < latency and not state.Buff['Addendum: White'] and get_current_stratagem_count() > 0 then
					windower.chat.input('/ja "Addendum: White" <me>')
				end
				tickdelay = os.clock() + 2.1
				return true
			end		
		elseif state.AutoArts.value == 'Dark' then
			if not state.Buff['Addendum: Black'] then
				if not state.Buff['Dark Arts'] and abil_recasts[232] < latency and not state.Buff['Addendum: Black'] then
					windower.chat.input('/ja "Dark Arts" <me>')
				elseif state.Buff['Dark Arts'] and abil_recasts[233] < latency and not state.Buff['Addendum: Black'] and get_current_stratagem_count() > 0 then
					windower.chat.input('/ja "Addendum: Black" <me>')
				end
				tickdelay = os.clock() + 2.1
				return true
			end
		end
	end
	
	return false
end
