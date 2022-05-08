state.OffenseMode:options('Normal')
state.HybridMode:options('Normal')
state.WeaponskillMode:options('Normal')
state.AutoBuffMode:options('Off','Auto')
state.CastingMode:options('Normal','Resistant','Melee')
state.IdleMode:options('DT','Normal')
state.PhysicalDefenseMode:options('PDT')
state.MagicalDefenseMode:options('MDT')
state.ResistDefenseMode:options('MEVA')
state.Weapons:options('None','DualMurCea','DualMurgleis','DualCrocea','DualCroDay','DualSequence','DualSavage','DualEvis','DualClubs','Murgleis','Crocea','Sequence','Naegling')
state.AutoArts = M(false, 'AutoArts') 

gear.jse_str_back = {name="Sucellos's Cape",augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}}
gear.jse_da_back = {name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}}
gear.jse_macc_back = { name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','Phys. dmg. taken-10%',}}
gear.jse_mab_back = {name="Sucellos's Cape",augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Phys. dmg. taken-10%',}}

gear.jse_skill_back = { name="Ghostfyre Cape", augments={'Enfb.mag. skill +3','Enha.mag. skill +10','Mag. Acc.+8',}}

gear.colada_enhancing_sword = { name="Colada", augments={'Enh. Mag. eff. dur. +4','Mag. Acc.+12','"Mag.Atk.Bns."+18','DMG:+10',}}

gear.obi_cure_back = gear.jse_macc_back
gear.obi_cure_waist = "Korin Obi"
gear.obi_low_nuke_back = gear.jse_mab_back
gear.obi_low_nuke_waist = "Sacro Cord"
gear.obi_high_nuke_back = gear.jse_mab_back
gear.obi_high_nuke_waist = "Sacro Cord"

send_command('bind ^` gs c cycle ElementalMode')
send_command('bind @` gs c cycle MagicBurstMode')
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

send_command('exec RDMDebuff.txt')

send_command('wait 15; input /lockstyleset 5; wait 3; lua load dressup')

select_default_macro_book()
