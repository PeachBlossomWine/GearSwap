state.CastingMode:options('Normal','Resistant','Proc')
state.OffenseMode:options('Normal')
state.IdleMode:options('Normal','DT')
state.Weapons:options('None','Marin','Khatvanga','Xoanon','Opashoro')
state.AutoZergMode:reset()

gear.obi_cure_waist = "Porous Rope"
gear.obi_low_nuke_waist = "Sacro Cord"
gear.obi_high_nuke_waist = "Sacro Cord"

gear.jse_mab_back = {name="Taranus's Cape",augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Phys. dmg. taken-10%',}}
gear.jse_fc_back = { name="Taranus's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Phys. dmg. taken-10%',}}

-- Additional local binds
send_command('bind ^` gs c cycle ElementalMode') 

send_command('bind !\\\\ input /ja "Manawell" <me>')
send_command('bind !` gs c elemental nuke')
send_command('bind @` gs c set toggle MagicBurstMode Lock')
send_command('bind @f10 gs c cycle RecoverMode')
send_command('bind @f9 gs c cycle DeathMode')

send_command('bind ^backspace input /ma "Stun" <t>')
send_command('bind !backspace input /ja "Enmity Douse" <t>')

if player.sub_job == "SCH" then
	send_command('bind ^delete input /ja "Dark Arts" <me>')
	send_command('bind !delete input /ja "Addendum: Black" <me>')
	send_command('bind @delete input /ja "Manifestation" <me>')
end

send_command('gs c set MagicBurstMode Lock')
send_command('gs c set RecoverMode 35%')
send_command('wait 20; hb disable allcure; hb disable curaga; hb disable na')
send_command('wait 15; input /lockstyleset 4;')

select_default_macro_book()