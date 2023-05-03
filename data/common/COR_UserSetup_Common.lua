state.OffenseMode:options('Normal','Acc')
state.HybridMode:options('DT','Tank','Normal')
state.RangedMode:options('Normal')
state.WeaponskillMode:options('Normal','SubtleBlow','STP')
state.CastingMode:options('Normal','Resistant')
state.IdleMode:options('Normal','Refresh')
state.ExtraMeleeMode = M{['description']='Extra Melee Mode', 'None'}
state.Weapons:options('DualLeaden','DualLeadenRanged','DualSavage','DualWildfire','DualWildfireRanged','DualLastStand','DualLastStandRanged','DeathPenalty','Armageddon','Fomalhaut','Naegling','None')
state.CompensatorMode = M{'Never','Always'}
state.AutoZergMode = M(false, 'Auto Zerg Mode')
state.MaintainAftermath	= M(false, 'Maintain Aftermath')

ammostock = 198
autows = 'Savage Blade'
rangedautows = 'Leaden Salute'	

gear.RAbullet = "Chrono Bullet"
gear.WSbullet = "Chrono Bullet"
gear.MAbullet = "Living Bullet"
gear.QDbullet = "Animikii Bullet" -- Single bullet here.
options.ammo_warning_limit = 15

-- Additional local binds
send_command('bind @` input /ja "Bolter\'s Roll" <me>')
send_command('bind ^` gs c cycle ElementalMode')
send_command('bind !` gs c elemental quickdraw')
send_command('bind ^backspace input /ja "Double-up" <me>')
send_command('bind @backspace input /ja "Snake Eye" <me>')
send_command('bind !backspace input /ja "Fold" <me>')
send_command('bind ^@!backspace input /ja "Crooked Cards" <me>')
send_command('bind ^\\\\ input /ja "Random Deal" <me>')
send_command('bind ^@!\\\\ gs c toggle LuzafRing')
send_command('bind @f7 gs c toggle RngHelper')
send_command('bind @f8 gs c toggle CompensatorMode')
send_command('bind @pause gs c toggle AutoBuffMode')
send_command('bind @f6 gs c toggle AutoZergMode')
send_command('lua r roller')

state.LuzafRing = M(true, "Luzaf's Ring")

gear.jse_snapshot_back = { name="Camulus's Mantle", augments={'"Snapshot"+10',}}
gear.jse_midshot_back = { name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Rng.Acc.+10','"Store TP"+10','Phys. dmg. taken-10%',}}
gear.jse_agi_back = { name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}}
gear.jse_mab_back = { name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}}
gear.jse_tp_back = { name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}}
gear.jse_str_back = { name="Camulus's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}}
gear.jse_crit_back = { name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Rng.Acc.+10','Crit.hit rate+10','Phys. dmg. taken-10%',}}

--Lockstyle
send_command('wait 15; input /lockstyleset 17')
select_default_macro_book()
