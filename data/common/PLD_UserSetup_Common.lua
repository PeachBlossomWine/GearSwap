state.OffenseMode:options('Normal','Acc')
state.HybridMode:options('Tank','DTLite','Normal')
state.WeaponskillMode:options('Tank','Normal')
state.CastingMode:options('SIRD','Normal')
state.PhysicalDefenseMode:options('PDT')
state.MagicalDefenseMode:options('MDT')
state.ResistDefenseMode:options('MEVA')
state.IdleMode:options('DT','Normal')
state.Weapons:options('Ochain','Aegis','Srivatsa','None')

state.ExtraDefenseMode = M{['description']='Extra Defense Mode','None'}
state.MaintainAftermath	= M(false, 'Maintain Aftermath')
state.AutoEmblem = M(false, 'Auto Emblem')
state.AutoTankFull = M(false, 'Auto Tank Full')
--state.UnlockWeapons = M(true, 'Unlock Weapons')
autows = 'Atonement'

gear.tank_fc_back = { name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','"Fast Cast"+10','Phys. dmg. taken-10%',}, priority=80}
gear.tank_jse_back = { name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','Enmity+10','Phys. dmg. taken-10%',}, priority=80}
gear.tank_cure_back = { name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','"Cure" potency +10%','Phys. dmg. taken-10%',}, priority=80}
--tp
gear.jse_wsd_back = { name="Rudianos's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}}
gear.phalanx_jse_back={ name="Weard Mantle", augments={'VIT+4','DEX+1','Enmity+1','Phalanx +4',}}

-- Additional local binds
send_command('bind !` gs c SubJobEnmity')
send_command('bind ^` gs c RuneElement')
send_command('bind @` gs c cycle RuneElement')
send_command('bind @pause gs c toggle AutoRuneMode')
send_command('bind ^\\\\ input /ma "Protect V" <t>')
send_command('bind @\\\\ input /ma "Shell IV" <t>')
send_command('bind !\\\\ input /ma "Crusade" <me>')
send_command('bind ^backspace input /ja "Shield Bash" <t>')
send_command('bind @backspace input /ja "Cover" <stpt>')
send_command('bind !f11 gs c cycle ExtraDefenseMode')
send_command('bind ^pause gs c toggle AutoRuneMode')
send_command('bind @f6 gs c toggle AutoTankFull;')
send_command('bind @f7 gs c toggle AutoBuffMode;')
send_command('bind @f8 gs c toggle AutoTankMode;')
send_command('bind @f10 gs c toggle TankAutoDefense')

send_command('wait 15; input /lockstyleset 7;')
send_command('hb mincure 4;')

select_default_macro_book()
update_defense_mode()