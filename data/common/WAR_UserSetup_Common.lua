state.OffenseMode:options('Normal')
state.WeaponskillMode:options('Normal','Enmity','SubtleBlow')
state.HybridMode:options('DT','Normal','SubtleBlow','Enmity')
state.PhysicalDefenseMode:options('PDT')
state.MagicalDefenseMode:options('MDT')
state.ResistDefenseMode:options('MEVA')
state.IdleMode:options('Normal','Reraise')
state.ExtraMeleeMode = M{['description']='Extra Melee Mode','None'}
state.Passive = M{['description']='Passive Mode','None'}
state.AutoTomahawkMode = M(false, 'AutoTomahawkMode')
state.AutoTPReductionMode = M(false, 'Auto TP Reduction Mode')

autows = "Upheaval"
state.AutoZergMode = M(false, 'Auto Zerg Mode')
state.AutoJumpMode = M(false, 'Auto Jump Mode')

state.Weapons:options('Chango','ShiningOne','Nandaka','Drepanum','Dolichenus','Naegling','Loxotic',
	'ProcKatana','ProcScythe','ProcDagger','ProcGreatKatana','ProcSword','ProcStaff','ProcClub','ProcGreatSword','ProcPolearm','None')

gear.jse_str_back ={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}}
gear.jse_da_back={ name="Cichol's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}}
gear.jse_vit_back ={ name="Cichol's Mantle", augments={'VIT+20','Accuracy+20 Attack+20','VIT+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}}

send_command('bind !` input /ja "Hasso" <me>')
send_command('bind ^` input /ja "Seigan" <me>')
send_command('bind @f7 gs c toggle AutoTPReductionMode')
send_command('bind ^backspace input /ja "Third Eye" <me>')
send_command('bind !@^` gs c cycle Stance')
send_command('bind @\\\\ gs c set toggle weapons Chango')

if player.sub_job == "DRG" then
	send_command('bind @f8 gs c toggle AutoJumpMode')
else
	send_command('unbind @f8')
end

send_command('bind @f6 gs c toggle AutoZergMode')

send_command('wait 15; input /lockstyleset 1;')
select_default_macro_book()
