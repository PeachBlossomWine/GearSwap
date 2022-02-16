-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'WAR' then
        set_macro_page(1, 18)
    else
        set_macro_page(1, 18)
    end
end

function get_pet_mode()
	if pet.frame == 'Sharpshot Frame' then
		if pet.head == 'Valoredge Head' or pet.head == 'Harlequin Head' then
			return 'Ranged'
		else
			return 'Ranged'
		end
	elseif pet.frame == 'Valoredge Frame' then
		if pet.head == 'Soulsoother Head' then
			return 'Tank'
		else
			return 'Melee'
		end
	elseif pet.head == 'Sharpshot Head' or pet.head == 'Stormwaker Head' then
		return 'Nuke'
	elseif pet.head == 'Spiritreaver Head' then
		return 'Nuke'
	elseif pet.frame == 'Harlequin Frame' then
		if pet.head == 'Harlequin Head' then
			return 'Melee'
		else
			return 'Melee'
		end
	else
		if pet.head == 'Soulsoother Head' then
			return 'Heal'
		elseif pet.head == 'Valoredge Head' then
			return 'Melee'
		else
			return 'Magic'
		end
	end
end