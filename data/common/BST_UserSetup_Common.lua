state.OffenseMode:options('Normal')
state.HybridMode:options('DT','Normal','HybridPet')
state.WeaponskillMode:options('Normal')
state.CastingMode:options('Normal')
state.IdleMode:options('DT','Normal')
state.RestingMode:options('Normal')
state.PhysicalDefenseMode:options('PDT')
state.MagicalDefenseMode:options('MDT')
state.ResistDefenseMode:options('MEVA')
state.Weapons:options('Agwu','Dolichenus','None')
state.ExtraMeleeMode = M{['description']='Extra Melee Mode','None'}
state.AutoZergMode:reset()

gear.jse_tp_back = { name="Artio's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}}
gear.jse_petmacc_back = { name="Artio's Mantle", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Eva.+20 /Mag. Eva.+20','Pet: Mag. Acc.+10','Pet: "Regen"+10','System: 1 ID: 1246 Val: 4',}}

state.JugMode = M{['description']='Jug Mode', 'GenerousArthur','FatsoFargann','ScissorlegXerin','SweetCaroline'}
state.CorrelationMode = M{['description']='Correlation Mode', 'Neutral', 'Favorable'}
state.PetMode = M{['description']='Pet Mode','DD'}
state.RewardMode = M{['description']='Reward Mode', 'Theta'}

ready_moves.default.FatsoFargann = 'TP Drainkiss'
ready_moves.default.GenerousArthur = 'Purulent Ooze'
--ready_moves.default.GenerousArthur = 'Corrosive Ooze'

state.AutoFightMode = M(false, 'Auto Fight Mode')
state.AutoReadyMode = M(true, 'Auto Ready Mode')
state.AutoCallPet = M(false, 'Auto Call Pet')
autows="Decimation"

send_command('bind ^\\\\ gs c cycle JugMode')
send_command('bind @f6 gs c toggle AutoCallPet')
send_command('bind @f7 gs c toggle AutoFightMode')
send_command('bind @f8 gs c toggle AutoReadyMode')
--send_command('bind @\\\\ gs c cycle CorrelationMode')
--send_command('bind !\\\\ gs c cycle PetMode')	
send_command('bind ^backspace gs c ready default')
send_command('bind !` input /pet "Fight" <t>;')
send_command('bind ^` input /pet "Leave" <me>;')
send_command('bind @` input /pet "Heel" <me>;')

send_command('input /lockstyleset 9')
select_default_macro_book()