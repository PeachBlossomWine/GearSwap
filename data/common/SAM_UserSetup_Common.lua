state.OffenseMode:options('Normal')
state.HybridMode:options('DT','Normal','SubtleBlow')
state.WeaponskillMode:options('Normal','Enmity','SubtleBlow')
state.RangedMode:options('Normal')
state.PhysicalDefenseMode:options('PDT')
state.MagicalDefenseMode:options('MDT')
state.ResistDefenseMode:options('MEVA')
state.IdleMode:options('Normal')
state.Weapons:options('Masamune','Dojikiri','ShiningOne','MaficCudgel','Yoichinoyumi','Norifusa','None')
state.AutoJumpMode = M(false, 'Auto Jump Mode')
autofood = 'Grape Daifuku'

gear.ws_jse_back = { name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%','STR+10','Phys. dmg. taken-10%',}} 
gear.da_jse_back = { name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10','Accuracy+10','Phys. dmg. taken-10%',}}
gear.mab_jse_back = { name="Smertrios's Mantle", augments={'STR+20','Mag. Acc+20 /Mag. Dmg.+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}}

-- Additional local binds
send_command('bind !` input /ja "Hasso" <me>')
send_command('bind ^` input /ja "Seigan" <me>')
send_command('bind ^backspace input /ja "Third Eye" <me>')
send_command('bind !@^` gs c cycle Stance')
send_command('bind ^\\\\ input /ja "Provoke" <t>')

if player.sub_job == "DRG" then
	send_command('bind @f8 gs c toggle AutoJumpMode')
else
	send_command('unbind @f8')
end

send_command('wait 15; input /lockstyleset 12;')
select_default_macro_book()