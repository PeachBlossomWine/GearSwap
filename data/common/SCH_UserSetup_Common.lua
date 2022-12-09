state.OffenseMode:options('Normal')
state.CastingMode:options('DT','Normal','Resistant','Proc')
state.IdleMode:options('DT','Normal')
state.HybridMode:options('Normal')
state.Weapons:options('None','Musa','Khatvanga')
state.AutoArts = M(false, 'AutoArts')
state.AutoAPMode = M(true, 'AutoAPMode')
state.AutoAOE = M(false, 'AutoAOE')
state.AutoBuffMode = M{['description'] = 'Auto Buff Mode','Off','Auto','Healing','Nuking'}
state.AutoArts = M{['description'] = 'Auto Arts Mode','Off','On','Light','Dark'}

gear.jse_mab_back = { name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Phys. dmg. taken-10%',}}

gear.obi_cure_back = "Solemnity Cape"
gear.obi_cure_waist = "Porous Rope"
gear.obi_low_nuke_waist = "Sacro Cord"
gear.obi_high_nuke_waist = "Sacro Cord"

-- Additional local binds
send_command('bind ^` gs c cycle ElementalMode')
send_command('bind !` gs c elemental nuke') -- change to buff up pro/shell?
send_command('bind @` gs c set toggle MagicBurstMode Lock')

send_command('bind @f10 gs c cycle RecoverMode')
send_command('bind @f8 gs c toggle AutoNukeMode')
send_command('bind !pause gs c toggle AutoSubMode') --Automatically uses sublimation and Myrkr.
send_command('bind !scrolllock gs c toggle AutoArts')
send_command('bind @f7 gs c set toggle CastingMode DT; gs c set toggle IdleMode DT')
send_command('bind @f6 gs c set toggle AutoAPMode')

send_command('bind !@^backspace input /ja "Enlightenment" <me>')

send_command('bind @backspace gs c scholar cost')
send_command('bind ^backspace gs c scholar aoe')
send_command('bind !backspace gs c scholar duration')

send_command('bind @= gs c scholar dark')
send_command('bind != gs c scholar light')

send_command('bind ^\\\\ input /ma "Protect V" <t>')
send_command('bind @\\\\ input /ma "Shell V" <t>')
send_command('bind !\\\\ input /ma "Reraise III" <me>')

send_command('gs c set MagicBurstMode Lock')
send_command('wait 15; hb disable cure; hb disable curaga; hb disable na;')

--Lockstyle
send_command('wait 15; input /lockstyleset 20; wait 3; lua load dressup')
select_default_macro_book()