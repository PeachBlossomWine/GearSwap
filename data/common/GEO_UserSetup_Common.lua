state.OffenseMode:options('Normal')
state.CastingMode:options('DT','Normal','Resistant','Proc')
state.IdleMode:options('DT','Normal')
state.PhysicalDefenseMode:options('PDT', 'NukeLock', 'GeoLock', 'PetPDT')
state.MagicalDefenseMode:options('MDT', 'NukeLock')
state.ResistDefenseMode:options('MEVA')
state.WeaponskillMode:options('Normal','SubtleBlow')
state.Weapons:options('None','Idris','LorgMor','IdrisAmmurapi','DualClub')
state.AutoZergMode:reset()
state.MaintainAftermath	= M(false, 'Maintain Aftermath')

gear.obi_cure_waist = "Porous Rope"
gear.obi_low_nuke_waist = "Eschan Stone"
gear.obi_high_nuke_waist = "Eschan Stone"

autogeotar = "None"
autoindi = "Fury"
autogeo = "Frailty"
autoentrust = "None"
autows = "Judgment"

-- Additional local binds
send_command('bind ^` gs c cycle ElementalMode')
send_command('bind !` input /ja "Full Circle" <me>')
send_command('bind @f8 gs c toggle AutoNukeMode')
send_command('bind @` gs c set toggle MagicBurstMode Lock')
send_command('bind @f10 gs c cycle RecoverMode')
send_command('bind @f7 gs c set toggle CastingMode DT; gs c set toggle IdleMode DT')
send_command('bind ^backspace input /ja "Blaze of Glory" <me>')
send_command('bind !backspace input /ja "Life Cycle" <me>')
send_command('bind @backspace input /ma "Sleep II" <t>')
send_command('bind ^delete input /ma "Aspir III" <t>')
send_command('bind @delete input /ma "Sleep" <t>')
send_command('bind @f6 gs c toggle AutoZergMode')
send_command('gs c set MagicBurstMode Lock')

gear.jse_mab_back = { name="Nantosuelta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Phys. dmg. taken-10%',}}
gear.jse_pet_back = { name="Nantosuelta's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Pet: "Regen"+10','Pet: "Regen"+5',}}
gear.jse_ws_back  = { name="Nantosuelta's Cape", augments={'STR+20','Accuracy+20 Attack+20','Accuracy+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}}
gear.jse_fc_back = { name="Nantosuelta's Cape", augments={'"Fast Cast"+10'}}

indi_duration = 326

if player.sub_job == "RDM" then
	send_command('wait 5; hb mincure 4')
elseif player.sub_job == "WHM" then
	send_command('wait 5; hb mincure 3')
else
	send_command('wait 5; hb mincure 4')
end

send_command('wait 15; input /lockstyleset 21; wait 3; lua load dressup')