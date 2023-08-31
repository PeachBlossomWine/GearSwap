state.OffenseMode:options('Normal')
state.HybridMode:options('DT','Normal')
state.RangedMode:options('Normal')
state.WeaponskillMode:options('Normal')
state.IdleMode:options('Normal')
if player.sub_job == 'NIN' or player.sub_job == 'DNC' then
	state.Weapons:options('DualGastra','DualArma','DualFoma','DualAnni','DualYoichi','DualFailNot','DualSavage','DualAeolian','DualKCSavage','DualKCTrueFlight','None')
else
	state.Weapons:options('Gastraphetes','Armageddon','Fomalhaut','Annihilator','Yoichinoyumi','FailNot','Naegling','Tauret','None')
end
--state.Weapons:options('DualGastra','DualFoma','DualAnni','DualYoichi','DualFailNot','DualSavage','Gastraphetes','Fomalhaut','Annihilator','Yoichinoyumi','FailNot','Naegling','None')
--state.Weapons:options('Fomalhaut','Annihilator','Gastraphetes','Yoichinoyumi','FailNot','Naegling','DualFoma','DualAnni','DualGastra','DualYoichi','DualFailNot','DualKCSavage','DualKCTrueFlight','None')

WeaponType =  {['Fail-Not'] = "Bow",
			   ['Yoichinoyumi'] = "Bow",
			   ['Sparrowhawk +2'] = "Bow",
			   ['Fomalhaut'] = "Gun",
			   ['Armageddon'] = "Gun",
			   ['Anarchy +2'] = "Gun",
			   ['Annihilator'] = "Gun",
			   ['Gastraphetes'] = "Crossbow",
}

DefaultAmmo = {
	['Bow']  = {['Default'] = "Yoichi's Arrow",
				['WS'] = "Yoichi's Arrow",
				['Acc'] = "Yoichi's Arrow",
				['Magic'] = "Yoichi's Arrow",
				['MagicAcc'] = "Yoichi's Arrow",
				['Unlimited'] = "Yoichi's Arrow",
				['MagicUnlimited'] ="Yoichi's Arrow",
				['MagicAccUnlimited'] ="Yoichi's Arrow"},

	['Gun']  = {['Default'] = "Chrono Bullet",
				['WS'] = "Chrono Bullet",
				['Acc'] = "Chrono Bullet",
				['Magic'] = "Chrono Bullet",
				['MagicAcc'] = "Chrono Bullet",
				['Unlimited'] = "Chrono Bullet",
				['MagicUnlimited'] = "Chrono Bullet",
				['MagicAccUnlimited'] ="Chrono Bullet"},
				
	['Crossbow'] = {['Default'] = "Quelling Bolt",
					['WS'] = "Quelling Bolt",
					['Acc'] = "Quelling Bolt",
					['Magic'] = "Quelling Bolt",
					['MagicAcc'] = "Quelling Bolt",
					['Unlimited'] = "Quelling Bolt",
					['MagicUnlimited'] = "Quelling Bolt",
					['MagicAccUnlimited'] ="Quelling Bolt"}
				
}

gear.jse_agi_back = { name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}}
gear.jse_mab_back = { name="Belenus's Cape", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}}
gear.jse_midshot_back = { name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Rng.Acc.+10','"Store TP"+10','Phys. dmg. taken-10%',}}
gear.jse_snapshot_back = { name="Belenus's Cape", augments={'Snapshot +10',}}
gear.jse_tp_back = { name="Belenus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10','Accuracy+10','Phys. dmg. taken-10%',}}
gear.jse_str_back = { name="Belenus's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}}
gear.jse_crit_back = { name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Rng.Acc.+10','Crit.hit rate+10','Phys. dmg. taken-10%',}}

-- Additional local binds
send_command('bind !` input /ra <t>')
send_command('bind !backspace input /ja "Bounty Shot" <t>')
send_command('bind @f7 gs c toggle RngHelper')
send_command('bind @` input /ja "Velocity Shot" <me>')
send_command('wait 15; input /lockstyleset 11;')
send_command('lua l hovershot')
ammostock = 198
--rangedautows = 'Last Stand'
state.MaintainAftermath	= M(true, 'Maintain Aftermath')
select_default_macro_book()