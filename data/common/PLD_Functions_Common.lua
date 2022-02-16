enmitydelay = os.clock()
blueflag = true

function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'BLU' then
        set_macro_page(1, 7)
    elseif player.sub_job == 'RUN' then
        set_macro_page(1, 7)
    elseif player.sub_job == 'NIN' then
        set_macro_page(1, 7)
    else
        set_macro_page(1, 7)
    end
end

buff_spell_lists = {
	Auto = {	
		{Name='Reprisal',Buff='Reprisal',SpellID=97,When='Combat'},
		{Name='Cocoon',Buff='Defense Boost',SpellID=547,When='Always'},
		{Name='Phalanx',Buff='Phalanx',SpellID=106,When='Always'},
	},
	
	Default = {
		{Name='Crusade',Buff='Enmity Boost',SpellID=476,Reapply=true},
		{Name='Phalanx',Buff='Phalanx',SpellID=106,Reapply=true},
		{Name='Reprisal',Buff='Reprisal',SpellID=97,Reapply=false},
		{Name='Haste',Buff='Haste',SpellID=57,Reapply=false},
		{Name='Refresh',Buff='Refresh',SpellID=109,Reapply=false},
		{Name='Aquaveil',Buff='Aquaveil',SpellID=55,Reapply=false},
		{Name='Stoneskin',Buff='Stoneskin',SpellID=54,Reapply=false},
		{Name='Blink',Buff='Blink',SpellID=53,Reapply=false},
		{Name='Regen',Buff='Regen',SpellID=108,Reapply=false},
	},
}

function job_self_command(commandArgs, eventArgs)

	if commandArgs[1] == 'RuneElement' then
		send_command('input /ja "'..state.RuneElement.value..'" <me>')

	elseif commandArgs[1] == 'SubJobEnmity' then

		if player.target.type ~= "MONSTER" then
			add_to_chat(123,'Abort: You are not targeting a monster.')
			return

		elseif player.sub_job == 'RUN' and not state.Buff['SJ Restriction'] and not silent_check_amnesia() then
			local abil_recasts = windower.ffxi.get_ability_recasts()
			
			if abil_recasts[23] < latency then
				send_command('input /ja "Vallation" <me>')
				tickdelay = os.clock() + 2.5
				return true
			elseif abil_recasts[113] < latency then
				send_command('input /ja "Valiance" <me>')
				tickdelay = os.clock() + 2.5
				return true
			elseif abil_recasts[59] < latency then
				send_command('input /ja "Pflug" <me>')
				tickdelay = os.clock() + 2.5
				return true
			elseif abil_recasts[24] < latency then
				send_command('input /ja "Swordplay" <me>')
				tickdelay = os.clock() + 2.5
				return true
			else
				return false
			end
		elseif player.sub_job == 'BLU' and not state.Buff['SJ Restriction'] and not moving then
			local spell_recasts = windower.ffxi.get_spell_recasts()
			local now = os.clock()
			
			if spell_recasts[584] < spell_latency and player.mp > res.spells[584].mp_cost then
				windower.chat.input('/ma "Sheep Song" <t>')
			elseif spell_recasts[605] < spell_latency and player.mp > res.spells[605].mp_cost then
				if blueflag == true then
					blueflag = false
					enmitydelay = os.clock() + 2.5
				end
				if now > enmitydelay then
					windower.chat.input('/ma "Geist Wall" <t>')
					tickdelay = os.clock() + 2
					blueflag = true
					return true
				end
			elseif spell_recasts[575] < spell_latency and player.mp > res.spells[575].mp_cost then
				if blueflag == true then
					blueflag = false
					enmitydelay = os.clock() + 2.5
				end
				if now > enmitydelay then
					windower.chat.input('/ma "Jettatura" <t>')
					tickdelay = os.clock() + 2
					blueflag = true
					return true
				end
			elseif spell_recasts[592] < spell_latency and player.mp > res.spells[592].mp_cost then
				if blueflag == true then
					blueflag = false
					enmitydelay = os.clock() + 2.5
				end
				if now > enmitydelay then
					windower.chat.input('/ma "Blank Gaze" <t>')
					tickdelay = os.clock() + 2
					blueflag = true
					return true
				end
			elseif spell_recasts[537] < spell_latency and player.mp > res.spells[537].mp_cost then
				if blueflag == true then
					blueflag = false
					enmitydelay = os.clock() + 2.5
				end
				if now > enmitydelay then
					windower.chat.input('/ma "Stinking Gas" <t>')
					tickdelay = os.clock() + 2
					blueflag = true
					return true
				end
			elseif not check_auto_tank_ws() then
				if not state.AutoTankMode.value then add_to_chat(123,'All Enmity Blue Magic on cooldown.') end
			end
			-- 598 Soporific
		elseif player.sub_job == 'DRK' and not state.Buff['SJ Restriction'] and not moving then
			local abil_recasts = windower.ffxi.get_ability_recasts()
			local spell_recasts = windower.ffxi.get_spell_recasts()
			
			if (state.HybridMode.value ~= 'Tank' or state.DefenseMode.value ~= 'None')  and buffactive['Souleater'] then
				send_command('cancel souleater')
			end
			
			if (state.HybridMode.value ~= 'Tank' or state.DefenseMode.value ~= 'None')  and buffactive['Last Resort'] then
				send_command('cancel last resort')
			end
			
			if spell_recasts[252] < spell_latency and not silent_check_silence() and player.mp > res.spells[252].mp_cost then
				windower.chat.input('/ma "Stun" <t>')
			elseif not check_auto_tank_ws() then
				if not state.AutoTankMode.value then add_to_chat(123,'All Enmity Dark Knight abillities on cooldown.') end
			end

		elseif player.sub_job == 'WAR' and not state.Buff['SJ Restriction'] and not silent_check_amnesia() then
			local abil_recasts = windower.ffxi.get_ability_recasts()
			
			if state.HybridMode.value:contains('DD') then
				if buffactive['Defender'] then send_command('cancel defender') end
			elseif state.HybridMode.value ~= 'Normal' and not state.HybridMode.value:contains('DD') then
				if buffactive['Berserk'] then send_command('cancel berserk') end
			end
			
			if abil_recasts[5] < latency then
				send_command('input /ja "Provoke" <t>')
			elseif abil_recasts[2] < latency then
				send_command('input /ja "Warcry" <me>')
			elseif abil_recasts[3] < latency then
				send_command('input /ja "Defender" <me>')
			elseif abil_recasts[4] < latency then
				send_command('input /ja "Aggressor" <me>')
			elseif abil_recasts[1] < latency then
				send_command('input /ja "Berserk" <me>')
			elseif not check_auto_tank_ws() then
				if not state.AutoTankMode.value then add_to_chat(123,'All Enmity Warrior Job Abilities on cooldown.') end
			end
			
		elseif player.sub_job == 'DNC' and not state.Buff['SJ Restriction'] and not silent_check_amnesia() then
			local abil_recasts = windower.ffxi.get_ability_recasts()
			local under3FMs = not buffactive['Finishing Move 3'] and not buffactive['Finishing Move 4'] and not buffactive['Finishing Move 5']
        
			if under3FMs then
				if abil_recasts[220] < latency then
				send_command('@input /ja "'..state.CurrentStep.value..'" <t>')
				return
				end
			elseif abil_recasts[221] < latency then
				send_command('input /ja "Animated Flourish" <t>')
				return
			elseif abil_recasts[220] < latency and not buffactive['Finishing Move 5'] then
				send_command('@input /ja "'..state.CurrentStep.value..'" <t>')
				return
			elseif not check_auto_tank_ws() then
				if not state.AutoTankMode.value then add_to_chat(123,'Dancer job abilities not needed.') end
			end
		end

	end

end

function job_tick()
	if check_majesty() then return true end
	if check_buff() then return true end
	if state.AutoTankMode.value and player.in_combat and player.target.type == "MONSTER" and not moving then
		if check_flash() then return true
		else 
			windower.send_command('gs c SubJobEnmity')
			tickdelay = os.clock() + 1
			return true
		end
	end
	if check_buffup() then return true end
	if check_hasso() then return true end
end

function check_flash()
	local spell_recasts = windower.ffxi.get_spell_recasts()
	local abil_recasts = windower.ffxi.get_ability_recasts()

	if spell_recasts[112] < spell_latency and player.mp > res.spells[112].mp_cost then
		if abil_recasts[80] < latency and not silent_check_amnesia() then
			windower.chat.input('/ja "Divine Emblem" <me>')
		end
		windower.chat.input:schedule(1,'/ma "Flash" <t>')	
		tickdelay = os.clock() + 2.5
		return true
	elseif not buffactive['Enmity Boost'] and spell_recasts[476] < spell_latency and not silent_check_silence() and player.mp > res.spells[476].mp_cost then
		windower.chat.input('/ma "Crusade" <me>')
		tickdelay = os.clock() + 2.5
		return true
	elseif abil_recasts[73] < latency and not silent_check_amnesia() then
		send_command('input /ja "Shield Bash" <t>')
		tickdelay = os.clock() + 2.5
		return true
	elseif state.AutoWSMode.value and player.tp > 1001 and not (player.mpp < 35 and abil_recasts[79] < latency) and player.in_combat and player.target.type == "MONSTER" and not silent_check_amnesia() then
		send_command('input /ws "' .. autows .. '" <t>')
		add_to_chat(262,'WS -> ' .. autows)
		tickdelay = os.clock() + 2.5
		return true
	elseif state.AutoTankFull.value and player.in_combat and not silent_check_amnesia() and abil_recasts[77] < latency then
		add_to_chat(262,'ATF: Rampart')
		send_command('input /ja "Rampart" <me>')
		tickdelay = os.clock() + 2.5
		return true
	elseif state.AutoTankFull.value and player.in_combat and not silent_check_amnesia() and abil_recasts[75] < latency then
		add_to_chat(262,'ATF: Sentinel')
		send_command('input /ja "Sentinel" <me>')
		tickdelay = os.clock() + 2.5
		return true
	elseif state.AutoTankFull.value and player.in_combat and not silent_check_amnesia() and abil_recasts[42] < latency then
		add_to_chat(262,'ATF: Palisade')
		send_command('input /ja "Palisade" <me>')
		tickdelay = os.clock() + 2.5
		return true
	else
		return false
	end
end

function check_buff()
	if state.AutoBuffMode.value ~= 'Off' and not data.areas.cities:contains(world.area) then
		local spell_recasts = windower.ffxi.get_spell_recasts()
		local abil_recasts = windower.ffxi.get_ability_recasts()
		for i in pairs(buff_spell_lists[state.AutoBuffMode.Value]) do
			if not buffactive[buff_spell_lists[state.AutoBuffMode.Value][i].Buff] and (buff_spell_lists[state.AutoBuffMode.Value][i].When == 'Always' or (buff_spell_lists[state.AutoBuffMode.Value][i].When == 'Combat' and (player.in_combat or being_attacked)) or (buff_spell_lists[state.AutoBuffMode.Value][i].When == 'Engaged' and player.status == 'Engaged') or (buff_spell_lists[state.AutoBuffMode.Value][i].When == 'Idle' and player.status == 'Idle') or (buff_spell_lists[state.AutoBuffMode.Value][i].When == 'OutOfCombat' and not (player.in_combat or being_attacked))) and spell_recasts[buff_spell_lists[state.AutoBuffMode.Value][i].SpellID] < latency and silent_can_use(buff_spell_lists[state.AutoBuffMode.Value][i].SpellID) and player.mp > res.spells[buff_spell_lists[state.AutoBuffMode.Value][i].SpellID].mp_cost then
				windower.chat.input('/ma "'..buff_spell_lists[state.AutoBuffMode.Value][i].Name..'" <me>')
				tickdelay = os.clock() + 2.0
				return true
			end
		end
		
		if player.in_combat then
			local abil_recasts = windower.ffxi.get_ability_recasts()

			if not buffactive['Majesty'] and abil_recasts[150] < latency then
				windower.chat.input('/ja "Majesty" <me>')
				tickdelay = os.clock() + 2.0
				return true
			end
			
			if abil_recasts[79] < latency and (player.mpp < 30 and player.tp > 1500) and not silent_check_amnesia() then
				windower.chat.input('/ja "Chivalry" <me>')
				tickdelay = os.clock() + 2.0
				return true
			end
		end
	else
		return false
	end
end

function update_melee_groups()
	if player.equipment.main then
		--classes.CustomMeleeGroups:clear()
		if player.equipment.main == "Burtgang" and state.Buff['Aftermath: Lv.3'] then
			--classes.CustomMeleeGroups:append('AM')
		end
	end	
end