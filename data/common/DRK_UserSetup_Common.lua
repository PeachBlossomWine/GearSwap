state.OffenseMode:options('Normal')
state.WeaponskillMode:options('Normal','Enmity','SubtleBlow')
state.HybridMode:options('DT','Normal','SubtleBlow')
state.PhysicalDefenseMode:options('PDT')
state.MagicalDefenseMode:options('MDT')
state.ResistDefenseMode:options('MEVA')
state.IdleMode:options('Normal','Reraise')
state.Weapons:options('KajaChopper','Caladbolg','Apocalypse','Anguta','Loxotic','None')
state.ExtraMeleeMode = M{['description']='Extra Melee Mode','None'}
state.Passive = M{['description'] = 'Passive Mode','None'}
state.DrainSwapWeaponMode = M{'300','Always','Never','1000'}
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
send_command('bind ^\\\\ input /ja "Weapon Bash" <t>')
send_command('bind @\\\\ gs c set toggle weapons KajaChopper')

if player.sub_job == "DRG" then
	send_command('bind @f8 gs c toggle AutoJumpMode')
else
	send_command('unbind @f8')
end

gear.jse_VIT_Back 	={ name="Ankou's Mantle", augments={'VIT+20','Accuracy+20 Attack+20','VIT+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}}
gear.jse_STR_Back 	={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}}
gear.jse_FC_Back	={ name="Ankou's Mantle", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Phys. dmg. taken-10%',}}
gear.jse_TP_Back	={ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10','Accuracy+10','Phys. dmg. taken-10%',}}
gear.Drain_back		={ name="Niht Mantle", augments={'Attack+7','Dark magic skill +7','"Drain" and "Aspir" potency +25',}}

send_command('wait 15; input /lockstyleset 8;')

select_default_macro_book()
