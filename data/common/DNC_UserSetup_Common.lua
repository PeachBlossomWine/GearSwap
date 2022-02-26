state.OffenseMode:options('Normal')
state.HybridMode:options('DT','Normal')
state.WeaponskillMode:options('Normal')
state.IdleMode:options('DT','Normal')
state.PhysicalDefenseMode:options('PDT')
state.MagicalDefenseMode:options('MDT')
state.ResistDefenseMode:options('MEVA')
state.Weapons:options('Terpsichore','Aeneas','Karambit','None')
state.ExtraMeleeMode = M{['description']='Extra Melee Mode','None'}
state.AutoJumpMode = M(false, 'Auto Jump Mode')
state.MaintainAftermath	= M(false, 'Maintain Aftermath')
autows = 'Pyrrhic Kleos'

state.MainStep = M{['description']='Main Step', 'Box Step','Quickstep','Stutter Step','Feather Step'}
state.AltStep = M{['description']='Alt Step', 'Quickstep','Box Step','Stutter Step','Feather Step'}
state.UseAltStep = M(false, 'Use Alt Step')
state.CurrentStep = M{['description']='Current Step', 'Main', 'Alt'}
state.AutoSambaMode = M{['description']= 'Auto Samba Mode', 'Off', 'Haste'}
state.AutoContradanceMode = M(true, 'Auto Contradance Mode')
state.AutoPrestoMode = M(true, 'Auto Presto Mode')

gear.jse_stp_back = {name="Senuna's Mantle",augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}}
gear.jse_wsd_back = {name="Senuna's Mantle",augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}}
gear.jse_str_back = {name="Senuna's Mantle",augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}}
gear.waltz_back = { name="Toetapper Mantle", augments={'"Store TP"+1','"Dual Wield"+2','"Rev. Flourish"+30',}}
-- Additional local binds
send_command('bind !` gs c step')
send_command('bind ^!@` gs c toggle usealtstep')
send_command('bind @` input /ja "Chocobo Jig II" <me>')
--send_command('bind ^` input /ja "Saber Dance" <me>')
--send_command('bind !` input /ja "Fan Dance" <me>')
send_command('bind ^\\\\ gs c cycle mainstep')
send_command('bind !\\\\ gs c cycle altstep')
send_command('bind !backspace input /ja "Reverse Flourish" <me>')
send_command('bind ^backspace input /ja "No Foot Rise" <me>')
send_command('bind @f6 gs c toggle autoprestomode')
send_command('bind @f7 gs c toggle autosambamode')
send_command('bind @f8 gs c toggle autojumpmode')

send_command('wait 15; input /lockstyleset 13;')
select_default_macro_book()