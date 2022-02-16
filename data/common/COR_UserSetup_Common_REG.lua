state.OffenseMode:options('Normal','Acc')
state.HybridMode:options('DT','Normal')
state.RangedMode:options('Normal')
state.WeaponskillMode:options('Normal','STP')
state.CastingMode:options('Normal','Resistant')
state.IdleMode:options('Normal','Refresh')
state.ExtraMeleeMode = M{['description']='Extra Melee Mode', 'None'}
state.Weapons:options('DualLeaden','DualLeadenRanged','DualSavage','DualLastStand','DualLastStandRanged','DeathPenalty','Fomalhaut','Naegling','None')
state.CompensatorMode = M{'Never','Always'}
state.AutoZergMode = M(false, 'Auto Zerg Mode')

ammostock = 198
autows = 'Savage Blade'
rangedautows = 'Leaden Salute'	

gear.RAbullet = "Chrono Bullet"
gear.WSbullet = "Chrono Bullet"
gear.MAbullet = "Chrono Bullet" -- For MAB WS, do not put single-use bullets here.
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

-- Whether to use Luzaf's Ring
state.LuzafRing = M(true, "Luzaf's Ring")
-- -- Whether a warning has been given for low ammo
-- state.warned = M(false)