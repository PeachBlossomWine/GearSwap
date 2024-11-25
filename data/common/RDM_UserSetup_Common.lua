state.OffenseMode:options('Normal')
state.HybridMode:options('Normal')
state.WeaponskillMode:options('Normal')
state.AutoBuffMode:options('Off','Auto')
state.CastingMode:options('Normal','Resistant','Melee','Proc')
state.IdleMode:options('DT','Normal')
state.PhysicalDefenseMode:options('PDT')
state.MagicalDefenseMode:options('MDT')
state.ResistDefenseMode:options('MEVA')
state.WeaponskillMode:options('Normal','SubtleBlow')
state.Weapons:options('None','DualMurCea','DualMurgleis','DualCrocea','DualCroDay','DualSequence','DualSavage','DualEvis','DualClubs','Murgleis','Crocea','Sequence','Naegling','Maxentius')
state.AutoArts = M(false, 'AutoArts') 
state.AutoZergMode:reset()

gear.jse_str_back = {name="Sucellos's Cape",augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}}
gear.jse_da_back = {name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}}
gear.jse_macc_back = { name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','Haste+10','Phys. dmg. taken-10%',}}
gear.jse_mab_back = {name="Sucellos's Cape",augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Phys. dmg. taken-10%',}}
gear.jse_mnd_back = { name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}}

send_command('bind ^` gs c cycle ElementalMode')
send_command('bind @` gs c set toggle MagicBurstMode Lock')
send_command('bind ^backspace input /ja "Saboteur" <me>')
send_command('bind !backspace input /ja "Spontaneity" <t>')
send_command('bind @backspace input /ja "Composure" <me>')
send_command('bind @f8 gs c toggle AutoNukeMode')
send_command('bind @= gs c scholar dark')
send_command('bind != gs c scholar light')
send_command('bind ^\\\\ input /ma "Protect V" <t>')
send_command('bind @\\\\ input /ma "Shell V" <t>')
send_command('bind !\\\\ input /ma "Reraise" <me>')
send_command('bind @f10 gs c cycle RecoverMode')
send_command('gs c set MagicBurstMode Lock')

send_command('exec RDMDebuff.txt')

send_command('wait 15; input /lockstyleset 5; wait 3; lua load dressup')

select_default_macro_book()
