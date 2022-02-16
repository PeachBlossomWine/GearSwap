state.OffenseMode:options('Normal')
state.CastingMode:options('Normal', 'Resistant', 'DT')
state.IdleMode:options('Normal', 'DT')
state.PhysicalDefenseMode:options('PDT', 'NukeLock', 'GeoLock', 'PetPDT')
state.MagicalDefenseMode:options('MDT', 'NukeLock')
state.ResistDefenseMode:options('MEVA')
state.Weapons:options('None')
state.AutoZergMode = M(false, 'Auto Zerg Mode')

gear.obi_cure_waist = "Porous Rope"
gear.obi_low_nuke_waist = "Eschan Stone"
gear.obi_high_nuke_waist = "Eschan Stone"

autogeotar = "None"
autoindi = "Fury"
autogeo = "Frailty"
autoentrust = "None"
autows = "Black Halo"

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

indi_duration = 326

if player.sub_job == "RDM" then
send_command('wait 5; hb mincure 4')
elseif player.sub_job == "WHM" then
send_command('wait 5; hb mincure 3')
else
send_command('wait 5; hb mincure 4')
end