-- ***************************
-- *Credit to Mote/Selindrile*
-- ***************************
--
-- Include this if  you want a means of applying defense down on the first contact
-- with a mob, require gearswap code to reset to default WS/weapon.
--
-- Command: include('Kate-DefenseDown')
-- Place this in your job_setup() function, or user_setup() function if using
-- a sidecar file, or get_sets() function if your job file isn't based
-- on my includes.

-- If using this in a job file that isn't based on Selindrile includes, you must
-- handle cycling the options values on your own, unless you also include
-- Sel-SelfCommands.
--
-- The job file must handle the 'update' self-command (gs c update auto).
-- This is automatically handled if using Selindrile includes, but must be ensured
-- if being used with a user-built job file.
--
-- Create a macro or keybind to cycle the Defense Down Mode value:
-- gs c cycle DefenseDownMode
-------------------------------------------------------------------------------------------------------------------


-------------------------------------------------------------------------------------------------------------------
-- Setup vars and events when first running the include.
-------------------------------------------------------------------------------------------------------------------

-- Ensure base tables are defined
options = options or {}
state = state or {}
dd_info = dd_info or {}
state.DefenseDownMode = M{['description']='Defense Down Mode'}
state.DefenseDownMode:options('None','Tag')

-- Tracking vars for DD.
dd_info.tagged_mobs = T{}
dd_info.last_player_target_index = 0

-- Event registration is done at the bottom of this file.

-------------------------------------------------------------------------------------------------------------------
-- User-callable functions for DD handling utility.
-------------------------------------------------------------------------------------------------------------------

-- Can call to force a status refresh.
-- Also displays the current tagged mob table if in debug mode.
function dd_update(cmdParams, eventArgs)
    if (cmdParams and cmdParams[1] == 'user') or not cmdParams then
        DD_for_first_hit()
    
        if _settings.debug_mode then
            print_set(dd_info.tagged_mobs, 'Tagged mobs')
        end
    end
end

-------------------------------------------------------------------------------------------------------------------
-- Local functions to support DD handling.
-------------------------------------------------------------------------------------------------------------------


-- For any active DD mode, if we haven't already tagged this target, change weapons or autows.
function DD_for_first_hit()
    if player.status == 'Engaged' and state.DefenseDownMode.value ~= 'None' then
        if not dd_info.tagged_mobs[player.target.id] then
            if _settings.debug_mode then add_to_chat(123,'Prepping defense down on '..tostring(player.target.id)..'.') end
			if player.main_job == 'SAM' then
				windower.send_command('gs c autows Tachi: Ageha')
			elseif player.main_job == 'DRK' then
				windower.send_command('gs c set weapons Lycurgos; gs c autows tp 1750;')
			elseif player.main_job == 'WAR' then
				windower.send_command('gs c autows Armor Break; gs c set weapons Chango; gs c autows tp 1750;')
			end
        else
            if _settings.debug_mode then add_to_chat(123,'Prepping defense down on '..player.target.id..'.  Target has already been tagged.') end
        end
    end
end

-------------------------------------------------------------------------------------------------------------------
-- Event handlers to allow tracking DD application.
-------------------------------------------------------------------------------------------------------------------

-- On engaging a mob, attempt to switch to DD weaponskill or weapon.
function on_status_change_for_dd(new_status_id, old_status_id)
	if not (gearswap and gearswap.res and gearswap.res.statuses and new_status_id and old_status_id) then return end
    if gearswap.gearswap_disabled then return end
	
	-- 1 Is the status ID for Engaged.
	if new_status_id == 1 then
		if _settings.debug_mode then add_to_chat(123,'Engaging '..player.target.id..'.') end
		dd_info.last_player_target_index = player.target.index
		DD_for_first_hit()
	end
end


-- On changing targets, attempt to switch to DD weaponskill or weapon.
function on_target_change_for_dd(new_index, old_index)
    -- Only care about changing targets while we're engaged, either manually or via current target death.
    if player.status == 'Engaged' then
        -- If  the current player.target is the same as the new mob then we're actually
        -- engaged with it.
        -- If it's different than the last known mob, then we've actually changed targets.
        if player.target.index == new_index and new_index ~= dd_info.last_player_target_index then
            if _settings.debug_mode then add_to_chat(123,'Changing target to '..player.target.id..'.') end
            dd_info.last_player_target_index = player.target.index
            DD_for_first_hit()
        end
    end
end


-- On any action event, mark mobs that we tag with DD.  Also, update the last time tagged mobs were acted on.
function on_action_for_dd(action)
	if not action then return end --protection from errors
    if state.DefenseDownMode.value ~= 'None' then
        if action.actor_id == player.id then
            -- category == 3=weaponskill, 1=melee
            if state.DefenseDownMode.value == 'Tag' and (action.category == 3 or action.category == 1) then
                for index,target in pairs(action.targets) do
                    if not dd_info.tagged_mobs[target.id] and _settings.debug_mode then
                        add_to_chat(123,'Mob '..target.id..' hit. Adding to tagged mobs table.')
                    end
                    dd_info.tagged_mobs[target.id] = os.time()
                end

            end
        elseif dd_info.tagged_mobs[action.actor_id] then
            -- If mob acts, keep an update of last action time for DD bookkeeping
            dd_info.tagged_mobs[action.actor_id] = os.time()
        else
            -- If anyone else acts, check if any of the targets are our tagged mobs
            for index,target in pairs(action.targets) do
                if dd_info.tagged_mobs[target.id] then
                    dd_info.tagged_mobs[target.id] = os.time()
                end
            end
        end
    end
    
    dd_cleanup_tagged_mobs()
end

-- Need to use this event handler to listen for deaths in case Battlemod is loaded,
-- because Battlemod blocks the 'action message' event.

str_using = string.char(130,240,142,103,151,112,130,181,130,196)
str_stars = string.char(129,154,129,153)
-- This function removes mobs from our tracking table when they die.
function on_incoming_chunk_for_dd(id, data, original, modified, injected, blocked)
    if id == 0x29 then
        local target_id = data:unpack('I',0x09)
        local message_id = data:unpack('H',0x19)%32768
		local packet = packets.parse('incoming', original)

        -- Remove mobs that die from our tagged mobs list.
        if message_id == 6 or message_id == 20 then
			if being_attacked and not player.in_combat then
				being_attacked = false
				if player.status == 'Idle' and not midaction() and not pet_midaction() then
					send_command('gs c forceequip')
				end
			end
            -- 6 == actor defeats target
            -- 20 == target falls to the ground
            if dd_info.tagged_mobs[target_id] then
                if _settings.debug_mode then add_to_chat(123,'Mob '..target_id..' died. Removing from tagged mobs table.') end
                dd_info.tagged_mobs[target_id] = nil
            end
		elseif packet.Message == 206 then
            if state.DefenseDownMode.value == 'Tag' then
                local name = windower.ffxi.get_mob_by_index(packet['Target Index'])
                if packet['Param 1'] == 149 and name.is_npc then
                    windower.add_to_chat(3,"Defense Down is now *OFF* on: " .. name.name)
                    if player.main_job == 'SAM' then
                        windower.send_command('gs c autows Tachi: Ageha')
                    elseif player.main_job == 'DRK' then
                        windower.send_command('gs c set weapons Lycurgos; gs c autows tp 1750;')
                    elseif player.main_job == 'WAR' then
                        windower.send_command('gs c autows Armor Break; gs c set weapons Chango; gs c autows tp 1750;')
                    end
                end
            else
                local name = windower.ffxi.get_mob_by_index(packet['Target Index'])
                if packet['Param 1'] == 149 and name.is_npc then
                    windower.send_command("input /p Defense Down is now *OFF* on: " .. name.name)
                end
            end
        end
    elseif id == 0x028 then
        local packet = packets.parse('incoming', data)
        --local receive_effect_id = S{230,237,267,268,269,271,278}
        local receive_effect_id = S{2,252}
        --table.vprint(packet)
        if packet['Target 1 Action 1 Message'] == 226 and (player.main_job == "BST" or player.main_job == "SMN") and packet.Actor == pet.id then
            if player.main_job == "BST" then
                windower.send_command('input /p '..str_using..' -'..auto_translate('Ready')..' TP: '..str_stars..'[ ' ..packet['Target 1 Action 1 Param']..' ]'..str_stars)
            elseif player.main_job == "SMN" then
                windower.send_command('input /p '..str_using..' - Mewing Lullaby TP: '..str_stars..'[ ' ..packet['Target 1 Action 1 Param']..' ]'..str_stars)
            end
        elseif receive_effect_id:contains(packet['Target 1 Action 1 Message']) and player.main_job == "COR" and state.AutoShot.value then
            local name = windower.ffxi.get_mob_by_id(packet['Target 1 ID'])
            if S{23,24,25,26,27,33,34,35,36,37}:contains(packet['Param']) and name.is_npc then
                windower.add_to_chat('[AutoShot] Using Light Shot for -DIA- upgrade.')
                windower.send_command('input /ja "Light Shot" '..name.id)
            end
        end
    end
end


-- Clear out the entire tagged mobs table when zoning.
function on_zone_change_for_dd(new_zone, old_zone)
    if _settings.debug_mode then add_to_chat(123,'Zoning. Clearing tagged mobs table.') end
    dd_info.tagged_mobs:clear()
end


-- Save the existing function, if it exists, and call it after our own handling.
if job_state_change then
    job_state_change_via_dd = job_state_change
end


-- Called if we change any user state fields.
function job_state_change(stateField, newValue, oldValue)
    if stateField == 'Defense Down Mode' then
		if oldValue == 'None' then
            DD_for_first_hit()
        end
    end
    
    if job_state_change_via_dd then
        job_state_change_via_dd(stateField, newValue, oldValue)
    end
end

-------------------------------------------------------------------------------------------------------------------
-- Extra utility functions.
-------------------------------------------------------------------------------------------------------------------

-- Remove mobs that we've marked as tagged with DD if we haven't seen any activity from or on them
-- for over 3 minutes.  This is to handle deagros, player deaths, or other random stuff where the
-- mob is lost, but doesn't die.
function dd_cleanup_tagged_mobs()
    -- If it's been more than 3 minutes since an action on or by a tagged mob,
    -- remove them from the tagged mobs list.
    local current_time = os.time()
    local remove_mobs = S{}
    -- Search list and flag old entries.
    for target_id,action_time in pairs(dd_info.tagged_mobs) do
        local time_since_last_action = current_time - action_time
        if time_since_last_action > 180 then
            remove_mobs:add(target_id)
            if _settings.debug_mode then add_to_chat(123,'Over 3 minutes since last action on mob '..target_id..'. Removing from tagged mobs list.') end
        end
    end
    -- Clean out mobs flagged for removal.
    for mob_id,_ in pairs(remove_mobs) do
        dd_info.tagged_mobs[mob_id] = nil
    end
end


-------------------------------------------------------------------------------------------------------------------
-- Event function registration calls.
-- Can call these now that the above functions have been defined.
-------------------------------------------------------------------------------------------------------------------

-- Register events to allow us to manage DD application.
windower.register_event('status change', on_status_change_for_dd)
windower.register_event('target change', on_target_change_for_dd)
windower.raw_register_event('action', on_action_for_dd)
windower.raw_register_event('incoming chunk', on_incoming_chunk_for_dd)
windower.raw_register_event('zone change', on_zone_change_for_dd)
