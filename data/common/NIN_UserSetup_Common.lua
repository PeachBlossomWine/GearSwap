state.OffenseMode:options('Normal')
state.HybridMode:options('DT','Normal')
state.RangedMode:options('Normal')
state.WeaponskillMode:options('Normal')
state.CastingMode:options('Normal','Resistant')
state.IdleMode:options('Normal')
state.PhysicalDefenseMode:options('PDT')
state.MagicalDefenseMode:options('MDT')
state.ResistDefenseMode:options('MEVA')
--state.Weapons:options('Kikoku','Heishi','Naegling','Tauret','None')
state.Weapons:options('Kikoku','Heishi','Naegling','Tauret',
	'ProcKatana','ProcScythe','ProcDagger','ProcGreatKatana','ProcSword',
	'ProcStaff','ProcClub','ProcGreatSword','ProcPolearm','None')
state.ExtraMeleeMode = M{['description']='Extra Melee Mode', 'None'}
autows = 'Blade: Metsu'

gear.jse_dex_back = {name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Weapon skill damage +10%','DEX+10','Phys. dmg. taken-10%',}}
gear.jse_da_back = {name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','"Store TP"+10','Accuracy+10','Phys. dmg. taken-10%',}}
gear.jse_str_back = {name="Andartia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%','STR+10','Phys. dmg. taken-10%',}}

send_command('bind ^` input /ja "Innin" <me>')
send_command('bind !` input /ja "Yonin" <me>')
send_command('bind @f7 gs c toggle autoshadowmode')
send_command('bind @f8 gs c toggle AutoTankMode')
send_command('bind @\\\\ gs c set toggle weapons Kikoku')


utsusemi_cancel_delay = .3
utsusemi_ni_cancel_delay = .06

select_default_macro_book()

send_command('wait 15; input /lockstyleset 14; wait 3; lua l dressup')