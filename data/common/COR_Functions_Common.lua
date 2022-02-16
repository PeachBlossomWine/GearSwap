rd_status = false
wc_status = false
wildcard_failsafe = os.clock() + 900000

function job_tick()
	if check_ammo() then return true end
	if check_buff() then return true end
	if check_zerg_sp() then return true end
	if check_steps_subjob() then return true end
	return false
end

function job_post_precast(spell, spellMap, eventArgs)
	if spell.type == 'WeaponSkill' then
		local WSset = standardize_set(get_precast_set(spell, spellMap))
		local wsacc = check_ws_acc()
		
		if (WSset.ear1 == "Moonshade Earring" or WSset.ear2 == "Moonshade Earring") then
			-- Replace Moonshade Earring if we're at cap TP
			if get_effective_player_tp(spell, WSset) > 3200 then
				if data.weaponskills.elemental:contains(spell.english) then
					if wsacc:contains('Acc') and sets.MagicalAccMaxTP then
						equip(sets.MagicalAccMaxTP[spell.english] or sets.MagicalAccMaxTP)
					elseif sets.MagicalMaxTP then
						equip(sets.MagicalMaxTP[spell.english] or sets.MagicalMaxTP)
					else
					end
				elseif spell.skill == 26 then
					if wsacc:contains('Acc') and sets.RangedAccMaxTP then
						equip(sets.RangedAccMaxTP[spell.english] or sets.RangedAccMaxTP)
					elseif sets.RangedMaxTP then
						equip(sets.RangedMaxTP[spell.english] or sets.RangedMaxTP)
					else
					end
				else
					if wsacc:contains('Acc') and not buffactive['Sneak Attack'] and sets.AccMaxTP then
						equip(sets.AccMaxTP[spell.english] or sets.AccMaxTP)
					elseif sets.MaxTP then
						equip(sets.MaxTP[spell.english] or sets.MaxTP)
					else
					end
				end
			end
		end
	elseif spell.type == 'CorsairShot' and not (spell.english == 'Light Shot' or spell.english == 'Dark Shot') then
		if state.CastingMode.value == 'Resistant' and sets.precast.CorsairShot then
			equip(sets.precast.CorsairShot.Resistant)
		end
	elseif spell.action_type == 'Ranged Attack' then
		if buffactive.Flurry then
			if sets.precast.RA.Flurry and lastflurry == 1 then
				equip(sets.precast.RA.Flurry)
			elseif sets.precast.RA.Flurry2 and lastflurry == 2 then
				equip(sets.precast.RA.Flurry2)
			end
		end
	elseif spell.type == 'CorsairRoll' or spell.english == "Double-Up" then
		if state.LuzafRing.value and item_available("Luzaf's Ring") then
			equip(sets.precast.LuzafRing)
		end
		if spell.type == 'CorsairRoll' and state.CompensatorMode.value ~= 'Never' and (state.CompensatorMode.value == 'Always' or tonumber(state.CompensatorMode.value) > player.tp) then
			if item_available("Compensator") then
				enable('range')
				equip({range="Compensator"})
			end
			if sets.precast.CorsairRoll.main and sets.precast.CorsairRoll.main ~= player.equipment.main then
				enable('main')
				equip({main=sets.precast.CorsairRoll.main})
			end
		end
    elseif spell.english == 'Fold' and buffactive['Bust'] == 2 and sets.precast.FoldDoubleBust then
		equip(sets.precast.FoldDoubleBust)
	end
end

function job_buff_change(buff, gain)

	local abil_recasts = windower.ffxi.get_ability_recasts()
	
	if player.equipment.Ranged and buff:contains('Aftermath') then
		classes.CustomRangedGroups:clear()
		if (player.equipment.Ranged == 'Death Penalty' and buffactive['Aftermath: Lv.3']) then
			classes.CustomRangedGroups:append('AM')
		end
	end

	-- Gain
	if buff == 'Warcry' and gain and state.AutoZergMode.value then
		if abil_recasts[196] > latency then
			wc_status = true
		else
			rd_status = true
		end
	end
	-- Loss
	if buff == 'Warcry' and not gain and state.AutoZergMode.value then
		rd_status = false
		wc_status = false
		wildcard_failsafe = os.clock() + 20
	end
end

function check_buff()
	if state.AutoBuffMode.value ~= 'Off' and player.in_combat then
		
		local abil_recasts = windower.ffxi.get_ability_recasts()
		local available_ws = S(windower.ffxi.get_abilities().weapon_skills)

		if player.sub_job == 'WAR' and not state.Buff['SJ Restriction'] and not buffactive.Berserk and abil_recasts[1] < latency and player.status == 'Engaged' then
			windower.chat.input('/ja "Berserk" <me>')
			tickdelay = os.clock() + 5.1
			return true
		elseif player.sub_job == 'WAR' and not state.Buff['SJ Restriction'] and not buffactive.Aggressor and abil_recasts[4] < latency and player.status == 'Engaged' then
			windower.chat.input('/ja "Aggressor" <me>')
			tickdelay = os.clock() + 5.1
			return true
		elseif state.Weapons.value:contains("Ranged") and abil_recasts[84] < latency and not buffactive['Triple Shot'] then
			windower.chat.input('/ja "Triple Shot" <me>')
			tickdelay = os.clock() + 5.1
			return true
		else
			return false
		end
	end
		
	return false
end

function check_zerg_sp()
	if state.AutoZergMode.value and player.status == 'Engaged' and player.in_combat then
	
		local now = os.clock()
		local abil_recasts = windower.ffxi.get_ability_recasts()

		if buffactive['Warcry'] and abil_recasts[196] < latency and rd_status == true then
			windower.chat.input('/p Random Deal! <scall20>')
			windower.chat.input('/ja "Random Deal" <me>')
			if abil_recasts[196] > latency then
				rd_status = false
			end
			tickdelay = os.clock() + 4.5
			return true		
		elseif buffactive['Warcry'] and abil_recasts[196] > latency and abil_recasts[0] < latency and wc_status == true then
			windower.chat.input('/p Wild Card! <scall20>')
			windower.chat.input('/ja "Wild Card" <me>')
			if abil_recasts[0] > latency then
				wc_status = false
			end
			tickdelay = os.clock() + 4.5
			return true		
		-- If RD fails, to force WC
		elseif not buffactive['Warcry'] and abil_recasts[196] > latency and abil_recasts[0] < latency and rd_status == false then
			if now > wildcard_failsafe then
				wildcard_failsafe = os.clock() + 900000
				windower.chat.input('/p Wild Card - Failsafe! <scall20>')
				windower.chat.input('/ja "Wild Card" <me>')
				tickdelay = os.clock() + 4.5
				return true
			end
			return false
		else
			return false
		end
	end
		
	return false
end