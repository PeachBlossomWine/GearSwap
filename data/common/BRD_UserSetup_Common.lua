state.OffenseMode:options('Normal')
state.HybridMode:options('Normal')
state.CastingMode:options('Normal','Melee')
state.IdleMode:options('DT', 'Normal')

state.Weapons:options('None','Carnwenhan','Aeneas','Naegling','DualCarn','DualAeneas','DualSavage')

-- Adjust this if using the Terpander (new +song instrument)
info.ExtraSongInstrument = 'Daurdabla'

-- How many extra songs we can keep from Daurdabla/Terpander
info.ExtraSongs = 2

-- Set this to false if you don't want to use custom timers.
state.UseCustomTimers = M(false, 'Use Custom Timers')
state.UnlockWeapons = M(true, 'Unlock Weapons')
state.MaintainAftermath	= M(false, 'Maintain Aftermath')

gear.jse_back = { name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Phys. dmg. taken-10%',}}
gear.tp_back={ name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}}
gear.wsd_back = { name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}}
gear.wsd_str_back = { name="Intarabus's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}}
gear.wsd_mab_back={ name="Intarabus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}}

gear.tp_linos = { name="Linos", augments={'Accuracy+17','"Dbl.Atk."+3','Quadruple Attack +3',}}
gear.wsd_linos = { name="Linos", augments={'Accuracy+18','Weapon skill damage +3%','DEX+8',}}
gear.wsd_str_linos = { name="Linos", augments={'Accuracy+20','Weapon skill damage +3%','STR+8',}},

-- Additional local binds
send_command('bind ^` input /ja "Nightingale" <me>; wait 1.5; input /ja "Troubadour" <me>')
send_command('bind @` input /ma "Chocobo Mazurka" <me>')
send_command('bind ^Backspace input /ma "Puppet\'s Operetta" <me>; wait 5; input /ma "Scop\'s Operetta" <me>; wait 5; input /ma "Goblin Gavotte" <me>; wait 5; input /ma "Shining Fantasia" <me>;')
send_command('bind !Backspace input /ma "Puppet\'s Operetta" <me>;')
send_command('bind ^\\\\ input /ma "Dispelga" <t>;')
send_command('lua load singer; wait 0.2; singer off')
send_command('wait 5; hb mincure 4')

--Lockstyle + Dressup
send_command('wait 10; input /lockstyleset 10; wait 3; lua load dressup')
select_default_macro_book()