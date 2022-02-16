function select_default_macro_book()
	-- Default macro set/book
	if player.sub_job == 'WAR' then
		set_macro_page(1, 9)
	else
		set_macro_page(1, 9)
	end
end

-- function check_ready()
	-- if state.AutoReadyMode.value and player.in_combat then
	-- local abil_recasts = windower.ffxi.get_ability_recasts()
	
		-- if pet.isvalid then
			-- if pet.status == "Engaged" and get_current_ready_count() > 0 and abil_recasts[102] < latency then
				-- windower.send_command('gs c ready')
				-- tickdelay = os.clock() + 2
				-- return true
			-- elseif pet.status == "Idle" and player.target.type == "MONSTER" and abil_recasts[100] < latency then
				-- windower.chat.input('/pet Fight <t>')
				-- tickdelay = os.clock() + 2
				-- return true
			-- else
				-- return false
			-- end
		-- else
			-- return false
		-- end
	-- else
		-- return false
	-- end

-- end

function check_ready()
	if state.AutoReadyMode.value and player.in_combat then
	local abil_recasts = windower.ffxi.get_ability_recasts()
	
		if pet.isvalid then
			if get_current_ready_count() > 0 and abil_recasts[102] < latency  then
				if pet.status == "Idle" and player.target.type == "MONSTER" and abil_recasts[100] < latency then
					windower.chat.input('/pet Fight <t>')
					tickdelay = os.clock() + 2
					return true
				elseif pet.status == "Engaged" then 
					windower.send_command('gs c ready')
					if state.JugMode.value == 'FatsoFargann' then
						windower.send_command('input /p TP Drainkiss!; wait 15; input /p Drainkiss 15s remaining;')
					end
					tickdelay = os.clock() + 2
					return true
				end
			elseif get_current_ready_count() <= 0 and abil_recasts[102] > latency and pet.status == "Engaged" and not buffactive['Unleash'] then
				--windower.chat.input('/pet Heel <me>')
				windower.send_command:schedule(1,'input /pet "Heel" <me>')
				tickdelay = os.clock() + 3
				return true
			else
				return false
			end	
		else
			return false
		end
	else
		return false
	end
end