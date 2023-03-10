state.OffenseMode:options('Normal')
state.WeaponskillMode:options('Normal','Enmity','SubtleBlow')
state.HybridMode:options('DT','Normal','SubtleBlow')
state.PhysicalDefenseMode:options('PDT')
state.MagicalDefenseMode:options('MDT')
state.ResistDefenseMode:options('MEVA')
state.IdleMode:options('Normal')
state.Weapons:options('Caladbolg','Liberator','Apocalypse','Anguta','Loxotic','Lycurgos','Naegling','None')
state.ExtraMeleeMode = M{['description']='Extra Melee Mode','None'}
state.Passive = M{['description'] = 'Passive Mode','None'}
state.DrainAbsSwapMode = M{'300','Always','Never'}
state.AutoJumpMode = M(false, 'Auto Jump Mode')
state.AutoTPReductionMode = M(false, 'Auto TP Reduction Mode')

autows = 'Torcleaver'
autofood = 'Grape Daifuku'

-- Additional local binds
send_command('bind !` input /ja "Hasso" <me>')
send_command('bind ^` input /ja "Seigan" <me>')
send_command('bind @` input /ma "Stun" <t>')
send_command('bind @f7 gs c toggle AutoTPReductionMode')
send_command('bind ^backspace input /ja "Third Eye" <me>')
send_command('bind !backspace gs c toggle DrainAbsSwapMode')
send_command('bind ^\\\\ input /ja "Weapon Bash" <t>')
send_command('bind @\\\\ gs c set toggle weapons Lycurgos')

if player.sub_job == "DRG" then
	send_command('bind @f8 gs c toggle AutoJumpMode')
else
	send_command('bind @f8 gs c toggle AutoNukeMode')
end

gear.jse_VIT_Back 	={ name="Ankou's Mantle", augments={'VIT+20','Accuracy+20 Attack+20','VIT+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}}
gear.jse_STR_Back 	={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}}
gear.jse_FC_Back	={ name="Ankou's Mantle", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Phys. dmg. taken-10%',}}
gear.jse_TP_Back	={ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10','Accuracy+10','Phys. dmg. taken-10%',}}

send_command('wait 15; input /lockstyleset 8;')

select_default_macro_book()
