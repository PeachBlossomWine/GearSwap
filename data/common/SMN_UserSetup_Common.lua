state.OffenseMode:options('Normal','Acc')
state.CastingMode:options('Normal')
state.IdleMode:options('DT', 'Normal')
state.Weapons:options('None','Nirvana')
state.AutoBPMode = M(false, 'AutoBPMode')
state.BPWardToggle = M(false, 'BPWardToggle')
state.AutoAvatarMode = M(false, 'AutoAvatarMode')
state.AutoSMNSCMode = M(false, 'AutoSMNSCMode')
state.AutoWardMode =  M{['description']='AutoWardMode','Off','Ward_Defense','Ward_Offense','Ward_Full'}
state.AutoZergMode:reset()

state.Avatar = M{['description']='Avatar','Carbuncle','Fenrir','Ifrit','Titan','Leviathan','Garuda','Shiva','Ramuh','Diabolos','Cait Sith','Siren'}

pacts.autobp = {
        ['Carbuncle']=  {BP='Meteorite',        SpellID=516},
        ['Fenrir']=     {BP='Impact',           SpellID=539},
        ['Ifrit']=      {BP='Flaming Crush',    SpellID=550},
        ['Titan']=      {BP='Mountain Buster',  SpellID=566},
		['Leviathan']=  {BP='Tidal Roar',       SpellID=585},
        ['Garuda']=     {BP='Predator Claws',   SpellID=598},
        ['Shiva']=      {BP='Rush',             SpellID=614},
        ['Ramuh']=      {BP='Volt Strike',      SpellID=634},
        ['Diabolos']=   {BP='Night Terror',     SpellID=665},
		['Cait Sith']=  {BP='Mewing Lullaby',   SpellID=522},
        ['Siren']=      {BP='Hysteric Assault', SpellID=970},
}
		
AutoWards = {
	Ward_Defense = {
		Titan =         {Name='Titan',      BP='Earthen Armor',     Buff='Earthen Armor',       SpellID=569},
		Siren =         {Name='Siren',      BP='Wind\'s Blessing',  Buff='Wind\'s Blessing',    SpellID=969},
		Diabolos =      {Name='Diabolos',   BP='Dream Shroud',      Buff='Magic Def. Boost',    SpellID=661},
		--['Cait Sith'] = {Name='Cait Sith',  BP='Reraise II',        Buff='Reraise',             SpellID=526},
	},

	Ward_Offense = {
		Garuda =        {Name='Garuda',     BP='Hastega II',        Buff='Haste',               SpellID=602},
		Shiva =         {Name='Shiva',      BP='Crystal Blessing',  Buff='TP Bonus',            SpellID=618},
		--Ifrit =         {Name='Ifrit',      BP='Crimson Howl',      Buff='Warcry',              SpellID=548},
	},
	
	Ward_Full = {
		Garuda =        {Name='Garuda',     BP='Hastega II',        Buff='Haste',               SpellID=602},
		Shiva =         {Name='Shiva',      BP='Crystal Blessing',  Buff='TP Bonus',            SpellID=618},
		--Ifrit =         {Name='Ifrit',      BP='Crimson Howl',      Buff='Warcry',              SpellID=548},
		Titan =         {Name='Titan',      BP='Earthen Armor',     Buff='Earthen Armor',       SpellID=569},
		Siren =         {Name='Siren',      BP='Wind\'s Blessing',  Buff='Wind\'s Blessing',    SpellID=969},
		Diabolos =      {Name='Diabolos',   BP='Dream Shroud',      Buff='Magic Def. Boost',    SpellID=661},
		--['Cait Sith'] = {Name='Cait Sith',  BP='Reraise II',        Buff='Reraise',             SpellID=526},
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
send_command('wait 5; hb disable allcure')
send_command('wait 15; input /lockstyleset 15; wait 3; lua load dressup')

select_default_macro_book()