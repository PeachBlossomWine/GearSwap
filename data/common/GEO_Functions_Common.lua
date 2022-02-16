
buff_spell_lists = {
	Auto = {
		{Name='Haste',		Buff='Haste',		SpellID=57,		When='Always'},
		{Name='Refresh',	Buff='Refresh',		SpellID=109,	When='Always'},
		--{Name='Stoneskin',	Buff='Stoneskin',	SpellID=54,		When='Always'},
	},

	Default = {
		{Name='Haste',		Buff='Haste',		SpellID=57,		Reapply=false},
		{Name='Refresh',	Buff='Refresh',		SpellID=109,	Reapply=false},
		{Name='Aquaveil',	Buff='Aquaveil',	SpellID=55,		Reapply=false},
		{Name='Stoneskin',	Buff='Stoneskin',	SpellID=54,		Reapply=false},
		{Name='Blink',		Buff='Blink',		SpellID=53,		Reapply=false},
		{Name='Regen',		Buff='Regen',		SpellID=108,	Reapply=false},
		{Name='Phalanx',	Buff='Phalanx',		SpellID=106,	Reapply=false},
	},
}


function job_self_command(commandArgs, eventArgs)
	local lowerCommand = commandArgs[1]:lower()
	if lowerCommand == 'autoindi' and commandArgs[2] then
		autoindi = commandArgs[2]:ucfirst()
		add_to_chat(122,'Your Auto Indi- spell is set to '..autoindi..'.')
		if state.DisplayMode.value then update_job_states()	end
	elseif lowerCommand == 'autogeo' and commandArgs[2] then
		autogeo = commandArgs[2]:ucfirst()
		add_to_chat(122,'Your Auto Geo- spell is set to '..autogeo..'.')
		if state.DisplayMode.value then update_job_states()	end
	elseif lowerCommand == 'autoentrust' and commandArgs[2] then
		autoentrust = commandArgs[2]:ucfirst()
		add_to_chat(122,'Your Auto Entrust Indi- spell is set to '..autoentrust..'.')
		if state.DisplayMode.value then update_job_states()	end
	elseif lowerCommand:contains('trustee') and commandArgs[2] then
		autoentrustee = commandArgs[2]:ucfirst()
		add_to_chat(122,'Your Auto Entrustee target is set to '..autoentrustee..'.')
		if state.DisplayMode.value then update_job_states()	end
	elseif lowerCommand == 'elemental' then
		handle_elemental(commandArgs)
		eventArgs.handled = true
	elseif lowerCommand:contains('geotar') and commandArgs[2] then
		autogeotar = commandArgs[2]:ucfirst()
		add_to_chat(122,'Your Auto Geo target is set to '..autogeotar..'.')
		if state.DisplayMode.value then update_job_states()	end
	end
end

--toofarfrommob = false;

function job_tick()
	if check_geo() then return true end
	if check_zerg_sp() then return true end
	if check_buff() then return true end
	if check_buffup() then return true end
	return false
end

function job_precast(spell, spellMap, eventArgs)

	if spell.action_type == 'Magic' then
		if spellMap == 'Cure' or spellMap == 'Curaga' then
			gear.default.obi_back = gear.obi_cure_back
			gear.default.obi_waist = gear.obi_cure_waist

			if spell.english == 'Curaga III' then
				local abil_recasts = windower.ffxi.get_ability_recasts()
				if abil_recasts[26] < latency and not buffactive['Divine Seal'] and not silent_check_amnesia() then
					windower.chat.input('/ja "Divine Seal" <me>')
					windower.chat.input:schedule(1.6,'/ma "'..spell.english..'" '..spell.target.raw..'')
					add_to_chat(122,'DS Curaga III')
					eventArgs.cancel = true
					tickdelay = os.clock() + 5.5
				end
			end
		elseif spell.skill == 'Elemental Magic' then
			if LowTierNukes:contains(spell.english) or spell.english:endswith('helix') then
				gear.default.obi_back = gear.obi_low_nuke_back
				gear.default.obi_waist = gear.obi_low_nuke_waist
			else
				gear.default.obi_back = gear.obi_high_nuke_back
				gear.default.obi_waist = gear.obi_high_nuke_waist
			end
		end

        if state.CastingMode.value == 'Proc' then
            classes.CustomClass = 'Proc'
        end
	elseif buffactive.Bolster and (spell.english == 'Blaze of Glory' or spell.english == 'Ecliptic Attrition') then
		eventArgs.cancel = true
		add_to_chat(123,'Abort: Bolster maxes the strength of bubbles.')
    end
end

function check_geo()

	local PlayerBubbles = S{'Fury','Refresh','Regen','Haste','Barrier','Acumen','Fend','Precision','Voidance','Focus','Attunement','STR','DEX','VIT','AGI','INT','MND','CHR'}

	if state.AutoBuffMode.value ~= 'Off' and not data.areas.cities:contains(world.area) then
		if not pet.isvalid then
			used_ecliptic = false
		end
		local abil_recasts = windower.ffxi.get_ability_recasts()
		if autoindi ~= 'None' and ((not player.indi) or last_indi ~= autoindi) then
			windower.chat.input('/ma "Indi-'..autoindi..'" <me>')
			tickdelay = os.clock() + 2.1
			return true
		elseif autoentrust ~= 'None' and abil_recasts[93] < latency and (player.in_combat or state.CombatEntrustOnly.value == false) then
			send_command('@input /ja "Entrust" <me>; wait 1.1; input /ma "Indi-'..autoentrust..'" '..autoentrustee)
			tickdelay = os.clock() + 3.5
			return true
		elseif pet.isvalid then
			local pet = windower.ffxi.get_mob_by_target("pet")
			if pet.distance:sqrt() > 50 then 		--If pet is greater than detectable.
				windower.chat.input('/ja "Full Circle" <me>')
				tickdelay = os.clock() + 1.1
				return true
						-- --extra	
						-- elseif toofarfrommob == true then
							-- windower.chat.input('/ja "Full Circle" <me>')
							-- tickdelay = os.clock() + 1.1
							-- return true
						-- --extra	
				
			elseif state.AutoGeoAbilities.value and abil_recasts[244] < latency and not used_ecliptic and not buffactive.Bolster then
			
				-- ZergMode is ON
				if state.AutoZergMode.value then 
					-- Bolster has been used.
					if not (abil_recasts[0] < latency) then
						windower.chat.input('/ja "Ecliptic Attrition" <me>;')
						used_ecliptic = true
						return true
					else
						return false
					end
				else
					windower.chat.input('/ja "Ecliptic Attrition" <me>;')
					used_ecliptic = true
					return true
				end
					
			else
				return false
			end
		elseif autogeo ~= 'None' and (windower.ffxi.get_mob_by_target('bt') or data.spells.geo_buffs:contains(autogeo)) then
			if player.in_combat and state.AutoGeoAbilities.value and abil_recasts[247] < latency and not buffactive.Bolster then
			
				-- ZergMode is ON
				if state.AutoZergMode.value then 
					-- Bolster has been used.
					if not (abil_recasts[0] < latency) then
						windower.chat.input('/ja "Blaze of Glory" <me>;')
						tickdelay = os.clock() + 1.1
						return true
					else
						return false
					end
				else
					windower.chat.input('/ja "Blaze of Glory" <me>;')
					tickdelay = os.clock() + 1.1
					return true
				end
			-- Make a toggle for this?
			elseif player.in_combat then
				if autogeotar == 'None' then
					windower.chat.input('/ma "Geo-'..autogeo..'" <bt>')
					tickdelay = os.clock() + 3.1
					return true
				else
					if PlayerBubbles:contains(autogeo) then
						windower.chat.input('/ma "Geo-'..autogeo..'" '..autogeotar..'')
						tickdelay = os.clock() + 3.1
						return true
					else
						return false
					end
				end
			end
		end
	end
	return false
end

function check_zerg_sp()
    if state.AutoZergMode.value and player.in_combat then

        local abil_recasts = windower.ffxi.get_ability_recasts()

        if abil_recasts[0] < latency and abil_recasts[243] < latency and not buffactive['Bolster'] then
			if pet.isvalid then
				windower.chat.input('/ja "Bolster" <me>')
				windower.chat.input:schedule(1.6,'/ja "Full Circle" <me>')
			else
				windower.chat.input('/ja "Bolster" <me>')
			end
            tickdelay = os.clock() + 3.5
            return true
		-- Bolster used
		elseif abil_recasts[0] > latency and abil_recasts[248] < latency and buffactive['Bolster'] and pet.isvalid then
			windower.chat.input('/ja "Dematerialize" <me>')
			tickdelay = os.clock() + 3.5
            return true
        else
            return false
        end
    end
end

data.equipment.mythic_weapons = S{'Conqueror','Glanzfaust','Yagrush','Laevateinn','Murgleis','Vajra','Burtgang','Liberator',
	'Aymur','Carnwenhan','Gastraphetes','Kogarasumaru','Nagi','Ryunohige','Nirvana','Death Penalty','Kenkonken',
	'Terpsichore','Tupsimati',}