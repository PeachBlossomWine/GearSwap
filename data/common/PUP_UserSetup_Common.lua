state.OffenseMode:options('Normal')
state.HybridMode:options('DT','HybridPET','PetTank','Normal')
state.WeaponskillMode:options('Normal')
state.PhysicalDefenseMode:options('PDT')
state.IdleMode:options('Normal','Refresh')
state.Weapons:options('Verethragna','Godhands','Sakpata','Midnights','DivinatorII','None')
state.PetWSGear = M(true, 'Pet WS Gear')

--state.AutoBuffMode:options('auto')
state.PetMode = M{['description']='Pet Mode', 'Tank','TankMEVA','Melee','Ranged','Heal','Nuke'}
state.AutoManeuvers = M{['description']='Auto Maneuver List', 'Tank','TankMEVA','Melee','Ranged','Heal','Nuke'}

PetMode="Tank"
AutoManeuvers="Tank"
autows = "Victory Smite"

-- Default/Automatic maneuvers for each pet mode.  Define at least 3.
defaultManeuvers = {
	Tank = {
		{Name='Earth Maneuver',	  Amount=0},
		{Name='Fire Maneuver',	  Amount=1},
		{Name='Light Maneuver',	  Amount=2},
		{Name='Water Maneuver',	  Amount=0},
	},
	TankMEVA = {
		{Name='Earth Maneuver',	  Amount=0},
		{Name='Fire Maneuver',	  Amount=0},
		{Name='Light Maneuver',	  Amount=2},
		{Name='Water Maneuver',	  Amount=1},
	},
	Melee = {
		{Name='Fire Maneuver', 	  Amount=0},
		{Name='Wind Maneuver', 	  Amount=0},
		{Name='Light Maneuver',	  Amount=2},
		{Name='Thunder Maneuver', Amount=1},
	},
	Ranged = {
		{Name='Wind Maneuver', 	  Amount=3},
		{Name='Fire Maneuver',	  Amount=0},
		{Name='Light Maneuver',	  Amount=0},
		{Name='Thunder Maneuver', Amount=0},
	},
	Heal = {
		{Name='Light Maneuver',	  Amount=2},
		{Name='Dark Maneuver',	  Amount=1},
		{Name='Water Maneuver',	  Amount=0},
		{Name='Earth Maneuver',	  Amount=0},
	},
	Nuke = {
		{Name='Ice Maneuver',	  Amount=2},
		{Name='Dark Maneuver',	  Amount=1},
		{Name='Water Maneuver',	  Amount=0},
		{Name='Earth Maneuver',	  Amount=0},
	},
}

deactivatehpp = 85

gear.jse_pet_tank_back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Eva.+20 /Mag. Eva.+20','Pet: "Regen"+10','Pet: Damage taken -5%',}}
gear.jse_da_back={ name="Visucius's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10','Accuracy+10','Phys. dmg. taken-10%',}}
gear.jse_wsd_back={ name="Visucius's Mantle", augments={'VIT+20','Accuracy+20 Attack+20','VIT+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}}

send_command('wait 15; input /lockstyleset 18;')

select_default_macro_book()

send_command('bind ^` input /ja Deactivate <me>')	
send_command('bind @backspace gs c toggle PetMode; gs c toggle AutoManeuvers')
send_command('bind !` input /ja Deploy <t>')
send_command('bind @` input /ja Retrieve <me>')
send_command('bind ^backspace input /ja "Deus Ex Automata" <me>')
send_command('bind !backspace input /ja Activate <me>')
send_command('bind @f8 gs c toggle AutoPuppetMode')
send_command('bind @f7 gs c toggle AutoRepairMode')
send_command('lua r autocontrol')