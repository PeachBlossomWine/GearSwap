state.OffenseMode:options('Normal')
state.HybridMode:options('DT','Normal')
state.WeaponskillMode:options('Normal')
state.CastingMode:options('Normal','Resistant')
state.IdleMode:options('DT','Normal','Refresh')
state.PhysicalDefenseMode:options('PDT')
state.MagicalDefenseMode:options('MDT')
state.ResistDefenseMode:options('MEVA')
state.Weapons:options('TizThib','TizZan','TizBunzi','NaegThib','NaegZan','Maxentius','Magic','MACC','None')
state.AutoWSRestore = M(false, 'AutoWSRestore')
state.AutoBLUSpam = M(false, 'AutoBLUSpam')
state.AutoJumpMode = M(false, 'AutoJumpMode')
state.MaintainAftermath	= M(false, 'Maintain Aftermath')

state.ExtraMeleeMode = M{['description']='Extra Melee Mode','None'}

gear.jse_da_back		= {name="Rosmerta's Cape",augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10','Accuracy+10','Phys. dmg. taken-10%',}}
gear.jse_crit_back		= {name="Rosmerta's Cape",augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Crit.hit rate+10','Phys. dmg. taken-10%',}}
gear.jse_str_back 		= {name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}}
gear.jse_mab_back 		= { name="Rosmerta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Phys. dmg. taken-10%',}}
gear.jse_hybrid_back 	= {name="Rosmerta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}}
gear.jse_macc_fc_back   = { name="Rosmerta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Phys. dmg. taken-10%',}}
gear.macc_unm_back 		= "Aurist's Cape +1"

gear.obi_cure_waist = "Luminary Sash"
gear.obi_nuke_waist = "Yamabuki-no-Obi"
gear.obi_cure_back = "Tempered Cape +1"

autows="Expiacion"

-- Additional local binds
send_command('bind ^` input /ja "Chain Affinity" <me>')
send_command('bind @` input /ja "Efflux" <me>')
send_command('bind !` input /ja "Burst Affinity" <me>')
send_command('bind ^backspace input /ma "Mighty Guard" <me>')
send_command('bind !backspace input /ma "Carcharian Verve" <me>')
send_command('bind @\\\\ gs c set toggle weapons Magic')
send_command('bind ^\\\\ input /ja "Diffusion" <me>')
send_command('bind @f6 gs c toggle AutoBLUSpam')

if player.sub_job == "DRG" then
	send_command('bind @f7 gs c toggle AutoJumpMode')
else
	send_command('unbind @f7')
end

send_command('lua r azuresets')

send_command('wait 5; hb disable cure; hb disable curaga; hb disable na')
send_command('wait 15; input /lockstyleset 16')

select_default_macro_book()