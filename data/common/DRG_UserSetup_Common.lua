state.OffenseMode:options('Normal')
state.WeaponskillMode:options('Normal','SubtleBlow')
state.HybridMode:options('DT','Normal')
state.PhysicalDefenseMode:options('PDT')
state.MagicalDefenseMode:options('MDT')
state.ResistDefenseMode:options('MEVA')
state.IdleMode:options('DT','Normal','Refresh','Reraise')
state.ExtraMeleeMode = M{['description']='Extra Melee Mode','None'}
state.Weapons:options('GaeBuide','Trishula','ShiningOne', 'Malignance', 'Naegling', 'DualSavage', 'None')
state.Passive = M{['description'] = 'Passive Mode','None'}
state.AutoBondMode = M(false, 'Auto Bond Mode')
state.AutoZergMode:reset()
state.AutoJumpMode = M(false, 'Auto Jump Mode')

gear.jse_da_back ={ name="Brigantia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10','Accuracy+10','Phys. dmg. taken-10%',}}
gear.jse_str_back = { name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','"Dbl.Atk."+10','STR+10','Phys. dmg. taken-10%',}}
gear.jse_wsd_back ={ name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%','STR+10','Phys. dmg. taken-10%',}}


-- Additional local binds
send_command('bind !` input /ja "Hasso" <me>')
send_command('bind ^` input /ja "Seigan" <me>')
send_command('bind ^backspace input /ja "Super Jump" <me>')
send_command('bind !backspace input /ja "Steady Wing" <me>')
send_command('bind ^f11 gs c cycle MagicalDefenseMode')
send_command('bind @f7 gs c toggle AutoJumpMode')
send_command('bind @f8 gs c toggle AutoBondMode')
send_command('bind @f6 gs c toggle AutoZergMode')

send_command('wait 15; input /lockstyleset 14;')
select_default_macro_book()