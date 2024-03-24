state.OffenseMode:options('Normal')
state.HybridMode:options('Tank','MEVA','Parry','DTLite','Ongo','Normal')
state.WeaponskillMode:options('Tank','Normal')
state.CastingMode:options('Normal','SIRD','DT')
state.PhysicalDefenseMode:options('PDT')
state.MagicalDefenseMode:options('MDT')
state.ResistDefenseMode:options('MEVA')
state.IdleMode:options('Normal','Refresh')
state.Weapons:options('Epeolatry','Lionheart','Lycurgos','Helheim','None')
autows = 'Dimidiation'
autofood = 'Om. Sandwich'
state.MaintainAftermath	= M(false, 'Maintain Aftermath')
state.MaintainTenebrae = M(false, 'Maintain Tenebrae')
state.MaintainVorV = M(false, 'MaintainVorV')
state.AutoZergMode:reset()

state.ExtraDefenseMode = M{['description']='Extra Defense Mode','None'}

gear.tank_back={ name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','Enmity+10','Phys. dmg. taken-10%',}}
gear.fc_back={ name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','"Fast Cast"+10','Phys. dmg. taken-10%',}}
gear.sird_back={ name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','Enmity+10','Spell interruption rate down-10%',}}
gear.jse_da_back = { name="Ogma's cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}}
gear.jse_wsd_back = { name="Ogma's cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}}
gear.jse_str_back = { name="Ogma's cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}}

gear.jovian_fc_body={ name="Adhemar Jacket +1", augments={'HP+105','"Fast Cast"+10','Magic dmg. taken -4',}, priority=168}

-- Additional local binds
send_command('bind !` gs c SubJobEnmity')
send_command('bind @` gs c cycle RuneElement')
send_command('bind ^` gs c RuneElement')
send_command('bind @pause gs c toggle AutoRuneMode')
send_command('bind @f6 gs c toggle AutoTankFull;')
send_command('bind @f7 gs c toggle AutoBuffMode')
send_command('bind @f8 gs c toggle AutoTankMode')
send_command('bind @f9 gs c toggle MaintainTenebrae')
send_command('bind @f10 gs c set toggle weapons Epeolatry')
send_command('bind ^\\\\ input /ma "Protect IV" <t>')
send_command('bind @\\\\ input /ma "Shell V" <t>')
send_command('bind !\\\\ input /ma "Crusade" <me>')
send_command('bind ^backspace input /ja "Rayke" <t>')
send_command('bind @backspace input /ja "Gambit" <t>')
send_command('bind !backspace input /ja "Lunge" <t>')

send_command('wait 15; input /lockstyleset 22;')
select_default_macro_book()