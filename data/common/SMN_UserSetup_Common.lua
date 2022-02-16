state.OffenseMode:options('Normal','Acc')
state.CastingMode:options('Normal')
state.IdleMode:options('Normal', 'DT')
state.Weapons:options('None','Nirvana')
state.AutoBPMode = M(false, 'AutoBPMode')
state.BPWardToggle = M(false, 'BPWardToggle')
state.AutoAvatarMode = M(false, 'AutoAvatarMode')
state.AutoSMNSCMode = M(false, 'AutoSMNSCMode')
state.AutoWardMode =  M{['description']='AutoWardMode','Off','Ward_Defense','Ward_Offense','Ward_Full'}

state.Avatar = M{['description']='Avatar','Carbuncle','Fenrir','Ifrit','Titan','Leviathan','Garuda','Shiva','Ramuh','Diabolos','Cait Sith','Siren'}

pacts.autobp = {['Carbuncle']='Meteorite',['Fenrir']='Impact',['Ifrit']='Flaming Crush',['Titan']='Mountain Buster',
		['Leviathan']='Tidal Roar',['Garuda']='Predator Claws',['Shiva']='Rush',['Ramuh']='Volt Strike',['Diabolos']='Nether Blast',
		['Cait Sith']='Mewing Lullaby',['Siren']='Hysteric Assault'}
		
pacts.autoward = {
	Carbuncle = {Name='Carbuncle', BP='Shining Ruby', Buff='Shining Ruby'},
	Fenrir = {Name='Fenrir', BP='Ecliptic Howl', Buff='Accuracy Boost'},
	Ifrit = {Name='Ifrit', BP='Crimson Howl', Buff='Warcry'},
	Titan = {Name='Titan', BP='Earthen Armor', Buff='Earthen Armor'},
	Leviathan = {Name='Leviathan', BP='Soothing Current', Buff='Curing Conduit'},
	Garuda = {Name='Garuda', BP='Hastega II', Buff='Haste'},
	Shiva = {Name='Shiva', BP='Crystal Blessing', Buff='TP Bonus'},
	Ramuh = {Name='Ramuh', BP='Rolling Thunder', Buff='Enthunder'},
	Diabolos = {Name='Diabolos', BP='Dream Shroud', Buff='Magic Def. Boost'},
	['Cait Sith'] = {Name='Cait Sith', BP='Reraise II', Buff='Reraise'},
	Siren = {Name='Siren', BP='Wind\'s Blessing', Buff='Wind\'s Blessing'},
}

AutoWards = {
	Ward_Defense = {
		Titan = {Name='Titan', BP='Earthen Armor', Buff='Earthen Armor'},
		Siren = {Name='Siren', BP='Wind\'s Blessing', Buff='Wind\'s Blessing'},
		Diabolos = {Name='Diabolos', BP='Dream Shroud', Buff='Magic Def. Boost'},
		['Cait Sith'] = {Name='Cait Sith', BP='Reraise II', Buff='Reraise'},
	},

	Ward_Offense = {
		Garuda = {Name='Garuda', BP='Hastega II', Buff='Haste'},
		Shiva = {Name='Shiva', BP='Crystal Blessing', Buff='TP Bonus'},
		Ifrit = {Name='Ifrit', BP='Crimson Howl', Buff='Warcry'},
	},
	
	Ward_Full = {
		Garuda = {Name='Garuda', BP='Hastega II', Buff='Haste'},
		Shiva = {Name='Shiva', BP='Crystal Blessing', Buff='TP Bonus'},
		Ifrit = {Name='Ifrit', BP='Crimson Howl', Buff='Warcry'},
		Titan = {Name='Titan', BP='Earthen Armor', Buff='Earthen Armor'},
		Siren = {Name='Siren', BP='Wind\'s Blessing', Buff='Wind\'s Blessing'},
		Diabolos = {Name='Diabolos', BP='Dream Shroud', Buff='Magic Def. Boost'},
		['Cait Sith'] = {Name='Cait Sith', BP='Reraise II', Buff='Reraise'},
	},
}

gear.magic_jse_back = { name="Campestres's Cape", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Pet: Mag. Acc.+10','"Fast Cast"+10',}}
gear.phys_jse_back = { name="Campestres's Cape", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Eva.+20 /Mag. Eva.+20','Pet: Accuracy+10 Pet: Rng. Acc.+10','Pet: "Regen"+10','Phys. dmg. taken-10%',}}

send_command('bind != mc smn')
send_command('bind @= mc smn sc on')
send_command('bind !` input /pet "Assault" <t>; mc smn assault')
send_command('bind ^` input /ja "Release" <me>; mc smn release')
send_command('bind @` input /ja "Retreat" <me>; mc smn retreat')

send_command('bind ^backspace gs c toggle Avatar')
send_command('bind @f8 gs c toggle AutoBPMode;')
send_command('bind @f7 gs c toggle AutoWardMode;')
send_command('bind @f6 gs c toggle AutoAvatarMode;')

--Lockstyle + Dressup
send_command('wait 5; hb disable cure')
send_command('wait 15; input /lockstyleset 15; wait 3; lua load dressup')

select_default_macro_book()