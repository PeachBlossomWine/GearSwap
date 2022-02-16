state.OffenseMode:options('Normal')
state.HybridMode:options('DT','Normal')
state.RangedMode:options('Normal')
state.WeaponskillMode:options('Normal')
state.IdleMode:options('Normal')
state.PhysicalDefenseMode:options('PDT')
state.MagicalDefenseMode:options('MDT')
state.ResistDefenseMode:options('MEVA')
state.Weapons:options('Aeneas','TH','Naegling','KajaKnuckles','KajaBow','None')

state.ExtraMeleeMode = M{['description']='Extra Melee Mode','None'}
state.AmbushMode = M(false, 'Ambush Mode')
state.TreasureMode:options('Tag','Fulltime','None')

-- Additional local binds
send_command('bind ^` input /ja "Flee" <me>')
send_command('bind ^= gs c cycle treasuremode')
send_command('bind @` input /ja "Spectral Jig" <me>')
send_command('bind @f10 gs c toggle AmbushMode')
send_command('bind !backspace input /ja "Hide" <me>')
send_command('bind ^backspace input /item "Thief\'s Tools" <t>')
send_command('bind ^\\\\ input /ja "Despoil" <t>')
send_command('bind !\\\\ input /ja "Mug" <t>')

gear.jse_tp_back = { name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','"Store TP"+10','Phys. dmg. taken-10%',}}
gear.jse_wsd_back = { name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Weapon skill damage +10%','Phys. dmg. taken-10%',}}

send_command('wait 15; input /lockstyleset 6;')
select_default_macro_book()