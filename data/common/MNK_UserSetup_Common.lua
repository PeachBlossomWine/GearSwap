state.OffenseMode:options('Normal')
state.WeaponskillMode:options('Normal','Emnity','Tank')
state.HybridMode:options('DT','Tank','Normal')
state.PhysicalDefenseMode:options('PDT')
state.MagicalDefenseMode:options('MDT')
state.ResistDefenseMode:options('MEVA')
state.IdleMode:options('Normal')
state.Weapons:options('Verethragna','Godhands','Malignance','None')
state.AutoJumpMode = M(false, 'Auto Jump Mode')

state.ExtraMeleeMode = M{['description']='Extra Melee Mode', 'None'}

autows = "Victory Smite"

gear.jse_da_back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10','Accuracy+10','Phys. dmg. taken-10%',}}
gear.jse_crit_back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Crit.hit rate+10','STR+10','Phys. dmg. taken-10%',}}
gear.jse_wsd_back={ name="Segomo's Mantle", augments={'VIT+20','Accuracy+20 Attack+20','Weapon skill damage +10%','VIT+10','Phys. dmg. taken-10%',}}

-- Additional local binds
send_command('bind ^` input /ja "Boost" <me>')
send_command('bind !` input /ja "Impetus" <me>')
send_command('bind ^backspace input /ja "Mantra" <me>')
send_command('bind @` input /ja "Perfect Counter" <me>')
send_command('bind ^\\\\ input /ja "Provoke" <t>')

send_command('wait 15; input /lockstyleset 2;')
select_default_macro_book()