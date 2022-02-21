OurReso = windower.get_windower_settings()
X_pos_view = OurReso.x_res - 305
X_pos_ffxidb = OurReso.x_res - 370
send_command('lua l equipviewer; wait 2; equipviewer pos ' .. X_pos_view .. ' 280')
send_command('wait 3; ffxidb map pos ' .. X_pos_ffxidb .. ' 40')

send_command('bind ^= gs c cycle treasuremode')
send_command('bind !f2 mc fin')
send_command('bind ^end mc wsall')
send_command('bind !f3 mc cc')
send_command('bind ^pagedown sa fullcircle')
send_command('exec SI.txt')
send_command('wait 5; lua r healbot')
--send_command('wait 7; gs org')

--Binds
send_command('bind !@^f7 gs c toggle AutoWSMode') --Turns auto-ws mode on and off.
send_command('bind !^f7 gs c toggle AutoFoodMode') --Turns auto-ws mode on and off.
send_command('bind f7 gs c cycle Weapons') --Cycle through weapons sets.
send_command('bind @f8 gs c toggle AutoNukeMode') --Turns auto-nuke mode on and off.
send_command('bind ^f8 gs c toggle AutoStunMode') --Turns auto-stun mode off and on.
send_command('bind !f8 gs c toggle AutoDefenseMode') --Turns auto-defense mode off and on.
send_command('bind ^@!f8 gs c toggle AutoTrustMode') --Summons trusts automatically.
send_command('bind @pause gs c toggle AutoBuffMode') --Automatically keeps certain buffs up, job-dependant.
send_command('bind @scrolllock gs c cycle Passive') --Changes offense settings such as accuracy.
send_command('bind f9 gs c cycle OffenseMode') --Changes offense settings such as accuracy.
send_command('bind ^f9 gs c cycle HybridMode') --Changes defense settings for melee such as PDT.
--send_command('bind @f9 gs c cycle RangedMode') --Changes ranged offense settings such as accuracy.
send_command('bind !f9 gs c cycle WeaponskillMode') --Allows automatic weaponskilling if the job is setup to handle it.
send_command('bind f10 gs c set DefenseMode Physical') --Turns your physical defense set on.
send_command('bind ^f10 gs c cycle PhysicalDefenseMode') --Changes your physical defense set.
send_command('bind !f10 gs c toggle Kiting') --Keeps your kiting gear on..
send_command('bind f11 gs c set DefenseMode Magical') --Turns your magical defense set on.
send_command('bind ^f11 gs c cycle MagicalDefenseMode') --Changes your magical defense set.
send_command('bind @f11 gs c cycle CastingMode') --Changes your castingmode options such as magic accuracy.
send_command('bind !f11 gs c cycle ExtraMeleeMode') --Adds another set layered on top of your engaged set.
send_command('bind ^f12 gs c cycle ResistDefenseMode') --Changes your resist defense set.
send_command('bind f12 gs c set DefenseMode Resist') --Turns your resist defense set on.
send_command('bind @f12 gs c cycle IdleMode') --Changes your idle mode options such as refresh.
send_command('bind !f12 gs c reset DefenseMode') --Turns your defensive mode off.
send_command('bind ^@!f12 gs reload') --Reloads gearswap.
send_command('bind pause gs c update user') --Runs a quick check to make sure you have the right gear on and checks variables.
send_command('bind ^@!pause gs org') --Runs organizer.
send_command('bind ^@!backspace gs c buffup') --Buffup macro because buffs are love.
send_command('bind ^o fillmode') --Lets you see through walls


state.AutoSubMode = M{['description'] = 'Auto Sublimation Mode','Off','On','Sleep'}
state.AutoZergMode = M{['description'] = 'Auto Zerg Mode','Off','On'}
state.AutoBPMode = M(false, 'AutoBPMode')
state.BPWardToggle = M(false, 'BPWardToggle')
state.AutoWardMode =  M{['description']='AutoWardMode','Off','Ward_Defense','Ward_Offense','Ward_Full'}
state.AutoAvatarMode = M(false, 'AutoAvatarMode')
state.AutoAPMode = M(true, 'AutoAPMode')
state.MaintainTenebrae = M(false, 'Maintain Tenebrae')
state.AutoArts = M{['description'] = 'Auto Arts Mode','Off','On','Light','Dark'}
state.AutoTankFull = M(false, 'Auto Tank Full')
state.AutoSMNSCMode = M(false, 'AutoSMNSCMode')
state.AutoOtherTargetWS = M(false, 'AutoOtherTargetWS')
state.AutoTPReductionMode = M(false, 'Auto TP Reduction Mode')
state.AutoTomahawkMode = M(false, 'AutoTomahawkMode')

data.weaponskills.mythic = {
    ["Conqueror"] = "King's Justice",
    ["Glanzfaust"] = "Ascetic's Fury",
    ["Yagrush"] = "Mystic Boon",
    ["Laevateinn"] = "Vidohunir",
    ["Murgleis"] = "Death Blossom",
    ["Vajra"] = "Mandalic Stab",
    ["Burtgang"] = "Atonement",
    ["Liberator"] = "Insurgency",
    ["Aymur"] = "Primal Rend",
    ["Carnwenhan"] = "Mordant Rime",
    ["Gastraphetes"] = "Trueflight",
    ["Kogarasumaru"] = "Tachi: Rana",
    ["Nagi"] = "Blade: Kamu",
    ["Ryunohige"] = "Drakesbane",
    ["Nirvana"] = "Garland of Bliss",
    ["Tizona"] = "Expiacion",
    ["Death Penalty"] = "Leaden Salute",
    ["Kenkonken"] = "Stringing Pummel",
    ["Terpsichore"] = "Pyrrhic Kleos",
    ["Tupsimati"] = "Omniscience",
    ["Idris"] = "Exudation",
    ["Epeolatry"] = "Dimidiation",
	["Armageddon"] = "Wildfire",
}

--table.vprint({data.weaponskills.empyrean})
data.weaponskills.empyrean = {
    ["Verethragna"] = "Victory Smite",
    ["Twashtar"] = "Rudra's Storm",
    ["Almace"] = "Chant du Cygne",
    ["Caladbolg"] = "Torcleaver",
    ["Farsha"] = "Cloudsplitter",
    ["Ukonvasara"] = "Ukko's Fury",
    ["Redemption"] = "Quietus",
    ["Rhongomiant"] = "Camlann's Torment",
    ["Kannagi"] = "Blade: Hi",
    ["Masamune"] = "Tachi: Fudo",
    ["Gambanteinn"] = "Dagann",
    ["Hvergelmir"] = "Myrkr",
    ["Gandiva"] = "Jishnu's Radiance",
}

data.equipment.mythic_weapons = S{'Conqueror','Glanzfaust','Yagrush','Laevateinn','Murgleis','Vajra','Burtgang','Liberator',
	'Aymur','Carnwenhan','Gastraphetes','Kogarasumaru','Nagi','Ryunohige','Nirvana','Tizona','Death Penalty','Kenkonken',
	'Terpsichore','Tupsimati','Idris','Epeolatry','Armageddon'}
	
data.equipment.rema_ranged_weapons = S{'Fomalhaut','Gastraphetes','Death Penalty','Armageddon','Fail-Not','Gandiva','Yoichinoyumi','Annihilator','Anarchy +2'}

data.equipment.rema_ranged_weapons_ammo = {
	['Fomalhaut'] = 'Chrono Bullet',
	['Death Penalty'] = 'Living Bullet',
	['Armageddon'] = 'Devastating Bullet',
	['Fail-Not'] = 'Chrono Arrow',
	['Gandiva'] = "Artemis's Arrow",
	['Gastraphetes'] = "Quelling Bolt",
	['Yoichinoyumi'] = "Yoichi's Arrow",
	['Annihilator'] = 'Chrono Bullet',
	['Anarchy +2'] = 'Chrono Bullet'
}

data.equipment.rema_ranged_weapons_ammo_pouch = {
	['Fomalhaut'] = 'Chr. Bul. Pouch',
	['Death Penalty'] = 'Liv. Bul. Pouch',
	['Armageddon'] = 'Dev. Bul. Pouch',
	['Fail-Not'] = 'Chrono Quiver',
	['Gandiva'] = "Artemis's Quiver",
	['Gastraphetes'] = "Quelling B. Quiver",
	['Yoichinoyumi'] = "Yoichi's Quiver",
	['Annihilator'] = 'Chr. Bul. Pouch',
	['Anarchy +2'] = 'Chr. Bul. Pouch'
}

spell_stepdown = {
    ['Aspir III'] = 'Aspir II',
    ['Aspir II'] = 'Aspir',
    ['Sleepga II'] = 'Sleepga',
    ['Sleep II'] = 'Sleep',
    ['Arise'] = 'Raise III',
    ['Raise III'] = 'Raise II',
    ['Raise II'] = 'Raise',
    ['Reraise IV'] = 'Reraise III',
    ['Reraise III'] = 'Reraise II',
    ['Reraise II'] = 'Reraise',
    ['Gravity II'] = 'Gravity',
    ['Horde Lullaby II'] = 'Horde Lullaby',
    ['Foe Lullaby II'] = 'Foe Lullaby',
	['Puppet\'s Operetta'] = 'Scop\'s Operetta',
	['Scop\'s Operetta'] = 'Goblin Gavotte',
	['Goblin Gavotte'] = 'Shining Fantasia',
	['Stoneja'] = 'Stone VI',
	['Stone VI'] = 'Stone V',
	['Stone V'] = 'Stone IV',
	['Stone IV'] = 'Stone III',
	['Water VI'] = 'Water V',
	['Water V'] = 'Water IV',
	['Water IV'] = 'Water III',
	['Aeroja'] = 'Aero VI',
	['Aero VI'] = 'Aero V',
	['Aero V'] = 'Aero IV',
	['Aero IV'] = 'Aero III',
	['Fire VI'] = 'Fire V',
	['Fire V'] = 'Fire IV',
	['Fire IV'] = 'Fire III',
	['Blizzard VI'] = 'Blizzard V',
	['Blizzard V'] = 'Blizzard IV',
	['Blizzard IV'] = 'Blizzard III',
	['Thundaja'] = 'Thunder VI',
	['Thunder VI'] = 'Thunder V',
	['Thunder V'] = 'Thunder IV',
	['Thunder IV'] = 'Thunder III',
	
	-- ['Entomb'] = 'Scouring Spate',
	-- ['Scouring Spate'] = 'Spectral Floe',
	-- ['Spectral Floe'] = 'Tenebral Crush',
	-- ['Tenebral Crush'] = 'Anvil Lightning',
	
	-- ['Searing Tempest'] = 'Blinding Fulgor',
	-- ['Blinding Fulgor'] = 'Anvil Lightning',
	-- ['Anvil Lightning'] = 'Silent Storm',
	-- ['Silent Storm'] = 'Spectral Floe',
	
	['Spectral Floe'] = 'Tenebral Crush',
	--['Tenebral Crush'] = 'Anvil Lightning',
	['Anvil Lightning'] = 'Silent Storm',
	
	['Utsusemi: San'] = 'Utsusemi: Ni',
	['Utsusemi: Ni'] = 'Utsusemi: Ichi',

}


function user_unload()
	currentPC=windower.ffxi.get_player()

	if currentPC.main_job == "BRD" then
		send_command('singer off')
		send_command('lua u singer')
	elseif currentPC.main_job == "COR" or currentPC.sub_job == "COR" then
		send_command('lua u roller')
	elseif currentPC.main_job == "GEO" then
		send_command('lua u autogeo')
	elseif currentPC.main_job == "BLU" then
		send_command('lua u azuresets')
	elseif currentPC.main_job == "PUP" then
		send_command('lua u autocontrol')
	elseif currentPC.main_job == "RNG" then
		send_command('lua u hovershot')
	elseif currentPC.main_job == "DRK" then
		send_command('unbind @f7')
	end

	send_command('lua u dressup')
	send_command('lua u healbot')
end

function check_trust()
	if not moving then
		if state.AutoTrustMode.value and not data.areas.cities:contains(world.area) and (buffactive['Elvorseal'] or buffactive['Reive Mark'] or not player.in_combat) then
			local party = windower.ffxi.get_party()
			if party.p5 == nil then
				local spell_recasts = windower.ffxi.get_spell_recasts()

				if spell_recasts[998] < spell_latency and not have_trust("Ygnas") then
					windower.chat.input('/ma "Ygnas" <me>')
					tickdelay = os.clock() + 3
					return true
				elseif spell_recasts[981] < spell_latency and not have_trust("Sylvie") then
					windower.chat.input('/ma "Sylvie (UC)" <me>')
					tickdelay = os.clock() + 3
					return true
				elseif spell_recasts[952] < spell_latency and not have_trust("Koru-Moru") then
					windower.chat.input('/ma "Koru-Moru" <me>')
					tickdelay = os.clock() + 3
					return true
				elseif spell_recasts[914] < spell_latency and not have_trust("Ulmia") then
					windower.chat.input('/ma "Ulmia" <me>')
					tickdelay = os.clock() + 3
					return true
				elseif spell_recasts[900] < spell_latency and not have_trust("Ayame") then
					windower.chat.input('/ma "Ayame" <me>')
					tickdelay = os.clock() + 3
					return true
				else
					return false
				end
			end
		end
	end
	return false
end

function check_sub()
	local abil_recasts = windower.ffxi.get_ability_recasts()
	if state.AutoSubMode.value and not data.areas.cities:contains(world.area) then
		if player.mpp < 70 and player.tp > 999 then
			local available_ws = S(windower.ffxi.get_abilities().weapon_skills)
			
			if available_ws:contains(190) then
				windower.chat.input('/ws Myrkr <me>')
				tickdelay = os.clock() + 1.5
				return true
			elseif available_ws:contains(173) then
				windower.chat.input('/ws Dagan <me>')
				tickdelay = os.clock() + 1.5
				return true
			end
		end
		-- 143 157
		if (player.main_job == 'SCH' or player.sub_job == 'SCH' and not buffactive['SJ Restriction']) then
			if abil_recasts[234] < latency then
				if state.AutoSubMode.value == 'Sleep' then
					if buffactive['Sublimation: Complete'] then
						windower.chat.input('/ja Sublimation <me>')
						tickdelay = os.clock() + 1.5
						return true
					elseif not buffactive['Sublimation: Activated'] then
						windower.chat.input('/ja Sublimation <me>')
						tickdelay = os.clock() + 1.5
						return true
					end
				elseif state.AutoSubMode.value == 'On' then
					if buffactive['Sublimation: Complete'] then
						if player.mpp < 70 then
							windower.chat.input('/ja Sublimation <me>')
							tickdelay = os.clock() + 1.5
							return true
						end
					elseif not buffactive['Sublimation: Activated'] then
						windower.chat.input('/ja Sublimation <me>')
						tickdelay = os.clock() + 1.5
						return true
					end
				end
			end
		end
	elseif state.AutoSubMode.value == 'Off' and data.areas.cities:contains(world.area) then
		if (player.main_job == 'SCH' or player.sub_job == 'SCH' and not buffactive['SJ Restriction']) and buffactive['Sublimation: Activated'] and abil_recasts[234] < latency then
			windower.chat.input('/ja Sublimation <me>')
			tickdelay = os.clock() + 1.5
			return true
		end
	end
	return false
end

function check_shadows()
	if moving or data.areas.cities:contains(world.area) then return false end
	
	local spell_recasts = windower.ffxi.get_spell_recasts()
	local currentshadows = has_shadows()
	if player.main_job == 'NIN' then
		if currentshadows < 1  and state.AutoShadowMode.value then
			if spell_recasts[340] < spell_latency then
				windower.chat.input('/ma "Utsusemi: San" <me>')
				tickdelay = os.clock() + 1.8
				return true
			elseif spell_recasts[339] < spell_latency then
				windower.chat.input('/ma "Utsusemi: Ni" <me>')
				tickdelay = os.clock() + 1.8
				return true
			else
				return false
			end
		elseif currentshadows < 2 and state.AutoShadowMode.value then
			if spell_recasts[339] > spell_latency and spell_recasts[340] > spell_latency and spell_recasts[338] < spell_latency then
				windower.chat.input('/ma "Utsusemi: Ichi" <me>')
				tickdelay = os.clock() + 2
				return true
			end
		elseif player.hpp < 50 and currentshadows < 2 then
			if spell_recasts[340] < spell_latency then
				windower.chat.input('/ma "Utsusemi: San" <me>')
				tickdelay = os.clock() + 1.8
				return true
			elseif spell_recasts[339] < spell_latency then
				windower.chat.input('/ma "Utsusemi: Ni" <me>')
				tickdelay = os.clock() + 1.8
				return true
			else
				return false
			end
			return false
		end
	elseif player.sub_job == 'NIN' and not buffactive['SJ Restriction'] then
		if currentshadows < 1 and state.AutoShadowMode.value then
			if spell_recasts[339] < spell_latency then
				windower.chat.input('/ma "Utsusemi: Ni" <me>')
				tickdelay = os.clock() + 1.8
				return true
			else
				return false
			end
		elseif currentshadows < 2 and state.AutoShadowMode.value then
			if spell_recasts[339] > spell_latency and spell_recasts[338] < spell_latency then
				windower.chat.input('/ma "Utsusemi: Ichi" <me>')
				tickdelay = os.clock() + 2
				return true
			end
		elseif player.hpp < 50 and currentshadows < 1 then
			if spell_recasts[339] < spell_latency then
				windower.chat.input('/ma "Utsusemi: Ni" <me>')
				tickdelay = os.clock() + 1.8
				return true
			else
				return false
			end
			return false
		else
			return false
		end
	elseif currentshadows == 0 then
		if state.AutoShadowMode.value then
			if player.main_job == 'SAM' and windower.ffxi.get_ability_recasts()[133] < latency then
				windower.chat.input('/ja "Third Eye" <me>')
				tickdelay = os.clock() + 1.1
				return true
			elseif silent_can_use(679) and spell_recasts[679] < spell_latency and not buffactive['Blink'] then
				windower.chat.input('/ma "Occultation" <me>')
				tickdelay = os.clock() + 2
				return true
			elseif silent_can_use(53) and spell_recasts[53] < spell_latency and not buffactive['Blink'] then
				windower.chat.input('/ma "Blink" <me>')
				tickdelay = os.clock() + 2
				return true
			elseif player.sub_job == 'SAM' and windower.ffxi.get_ability_recasts()[133] < latency and not buffactive['SJ Restriction'] then
				windower.chat.input('/ja "Third Eye" <me>')
				tickdelay = os.clock() + 1.1
				return true
			else
				return false
			end
		elseif player.hpp < 50 then
			if player.main_job == 'SAM' and windower.ffxi.get_ability_recasts()[133] < latency then
				windower.chat.input('/ja "Third Eye" <me>')
				tickdelay = os.clock() + 1.1
				return true
			elseif silent_can_use(679) and spell_recasts[679] < spell_latency and not buffactive['Blink'] then
				windower.chat.input('/ma "Occultation" <me>')
				tickdelay = os.clock() + 2
				return true
			elseif player.sub_job == 'SAM' and not buffactive['SJ Restriction'] and windower.ffxi.get_ability_recasts()[133] < latency then
				windower.chat.input('/ja "Third Eye" <me>')
				tickdelay = os.clock() + 1.1
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

function check_rune()

	if state.AutoRuneMode.value and (player.main_job == 'RUN' or player.sub_job == 'RUN') and not silent_check_amnesia() and not data.areas.cities:contains(world.area) then
		local abil_recasts = windower.ffxi.get_ability_recasts()

		--AutoRuneMode Normal
		if player.main_job == 'RUN' and (not buffactive[state.RuneElement.value] or buffactive[state.RuneElement.value] < 3) and not state.MaintainTenebrae.value then
			if abil_recasts[92] > 0 then return false end		
			send_command('input /ja "'..state.RuneElement.value..'" <me>')
			tickdelay = os.clock() + 1.8
			return true

		--Keep 1 Tenebrae
		elseif player.main_job == 'RUN' and (not buffactive[state.RuneElement.value] or buffactive[state.RuneElement.value] < 2 or not buffactive['Tenebrae']) and state.MaintainTenebrae.value then
			if abil_recasts[92] > 0 then return false end
			if not buffactive['Tenebrae'] then
				send_command('input /ja "Tenebrae" <me>')
			else
				send_command('input /ja "'..state.RuneElement.value..'" <me>')
			end
			tickdelay = os.clock() + 1.8
			return true
		-- Sub RUN
		elseif player.sub_job == 'RUN' and not buffactive[state.RuneElement.value] or buffactive[state.RuneElement.value] < 2 and not buffactive['SJ Restriction'] then
			if abil_recasts[92] > 0 then return false end		
			windower.chat.input('/ja "'..state.RuneElement.value..'" <me>')
			tickdelay = os.clock() + 1.8
			return true
		
		-- Auto MP or HP recovery
		elseif player.main_job == 'RUN' and abil_recasts[242] < latency and (player.hpp < 50 or (buffactive['Tenebrae'] and player.mpp < 40)) then
			windower.chat.input('/ja "Vivacious Pulse" <me>')
			tickdelay = os.clock() + 1.8
			return true
			
		elseif not player.in_combat then
			return false
			
		elseif not buffactive['Vallation'] and not buffactive['Liement'] and buffactive[state.RuneElement.value] then
			if player.main_job == 'RUN' and abil_recasts[23] < latency then
				send_command('input /ja "Vallation" <me>')
				tickdelay = os.clock() + 2.5
				return true
			else
				return false
			end
		else
			return false
		end
	
	end
	
	return false
end

function check_ws()
	if state.AutoWSMode.value and not state.RngHelper.value and player.status == 'Engaged' and player.target and player.target.type == "MONSTER" and player.tp > 999 and not silent_check_amnesia() and not (player.target.distance > (19.7 + player.target.model_size)) then

	local available_ws = S(windower.ffxi.get_abilities().weapon_skills)
		
		if player.hpp < 41 and state.AutoWSRestore.value and available_ws:contains(47) and player.target.distance < (3.2 + player.target.model_size) then
			windower.chat.input('/ws "Sanguine Blade" <t>')
			tickdelay = os.clock() + 2.8
			return true
		elseif player.hpp < 41 and state.AutoWSRestore.value and available_ws:contains(105) and player.target.distance < (3.2 + player.target.model_size) then
			windower.chat.input('/ws "Catastrophe" <t>')
			tickdelay = os.clock() + 2.8
			return true
		elseif player.mpp < 31 and state.AutoWSRestore.value and available_ws:contains(109) and player.target.distance < (3.2 + player.target.model_size) then
			windower.chat.input('/ws "Entropy" <t>')
			tickdelay = os.clock() + 2.8
			return true
		elseif player.mpp < 31 and state.AutoWSRestore.value and available_ws:contains(171) and player.target.distance < (3.2 + player.target.model_size) then
			windower.chat.input('/ws "Mystic Boon" <t>')
			tickdelay = os.clock() + 2.8
			return true
		elseif player.target.distance > (3.2 + player.target.model_size) and not data.weaponskills.ranged:contains(autows) then
			return false
		elseif data.equipment.relic_weapons:contains(player.equipment.main) and state.MaintainAftermath.value and (not buffactive['Aftermath']) then
			windower.chat.input('/ws "'..data.weaponskills.relic[player.equipment.main]..'" <t>')
			tickdelay = os.clock() + 2.8
			return true
		elseif (buffactive['Aftermath: Lv.3'] or not state.MaintainAftermath.value or not data.equipment.mythic_weapons:contains(player.equipment.main)) and player.tp >= autowstp then
			if state.AutoOtherTargetWS.value then
				windower.send_command('gs c smartws Arebati')
				tickdelay = os.clock() + 2.8
				return true
			else
				windower.chat.input('/ws "'..autows..'" <t>')
				tickdelay = os.clock() + 2.8
			end
		elseif player.tp == 3000 then
			windower.chat.input('/ws "'..data.weaponskills.mythic[player.equipment.main]..'" <t>')
			tickdelay = os.clock() + 2.8
			return true
		else
			return false
		end
	else
		return false
	end
end

step_timer = 0

function check_steps_subjob()
	local abil_recasts = windower.ffxi.get_ability_recasts()

	if state.AutoBuffMode.value ~= 'Off' and player.sub_job == 'DNC' and not buffactive['SJ Restriction'] and player.tp > 140 and not silent_check_amnesia() and os.clock() > step_timer and abil_recasts[220] < latency and player.status == 'Engaged' then
		windower.add_to_chat('[AutoStep] Using Box Step')
		windower.chat.input('/ja "Box Step" <t>')
		tickdelay = os.clock() + 3.5
		step_timer = os.clock() + 35
		return true
	else
		return false
	end
end


function getAngle(index)
    local P = windower.ffxi.get_mob_by_target('me') --get player
    local M = index and windower.ffxi.get_mob_by_id(index) or windower.ffxi.get_mob_by_target('t') --get target
    local delta = {Y = (P.y - M.y),X = (P.x - M.x)} --subtracts target pos from player pos
    local angleInDegrees = (math.atan2( delta.Y, delta.X) * 180 / math.pi)*-1 
    local mult = 10^0
    return math.floor(angleInDegrees * mult + 0.5) / mult
end

function default_zone_change(new_id,old_id)
	tickdelay = os.clock() + 10
	state.AutoBuffMode:reset()
	state.AutoSubMode:reset()
	state.AutoTrustMode:reset()
	state.AutoTankMode:reset()
	state.AutoRuneMode:reset()
	state.AutoFoodMode:reset()
	state.AutoWSMode:reset()
	state.AutoNukeMode:reset()
	state.AutoArts:reset()
	state.AutoSambaMode:reset()
	state.AutoShadowMode:reset()
	state.AutoJumpMode:reset()
	--Custom states
	state.AutoZergMode:reset()
	state.AutoWardMode:reset()
	state.AutoBPMode:reset()
	state.AutoAPMode:reset()
	state.AutoAvatarMode:reset()
	state.AutoArts:reset()
	state.AutoTankFull:reset()
	state.AutoSMNSCMode:reset()
	state.AutoOtherTargetWS:reset()
	state.AutoTPReductionMode:reset()
	--state.MaintainTenebrae:reset()
	if state.CraftingMode.value ~= 'None' then
		enable('main','sub','range','ammo','head','neck','lear','rear','body','hands','lring','rring','back','waist','legs','feet')
		state.CraftingMode:reset()
	end
	send_command('gs rh disable')
	state.RngHelper:reset()
	useItem = false
	useItemName = ''
	useItemSlot = ''
	lastincombat = false
	being_attacked = false
	
	if world.area:contains('Abyssea') or data.areas.proc:contains(world.area) then
		state.SkipProcWeapons:set('False')
	else
		state.SkipProcWeapons:reset()
	end
	
	if state.DisplayMode.value then update_job_states()	end
end

-- New Display functions, needs to come after globals for user settings.
include('Sel-Display.lua')
