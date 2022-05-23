--------------------------------------
-- Gear selection
--------------------------------------

if item_available('Shamash Robe') then
	gear.whm_body_idle = 'Shamash Robe'
	gear.whm_dt_ring = 'Inyanga Ring'
else
	gear.whm_body_idle = 'Piety Bliaut +3'
	gear.whm_dt_ring = 'Gelatinous Ring +1'
end

if item_available('Regal Cuffs') then
	gear.whm_hands_enfeebling = 'Regal Cuffs'
else
	gear.whm_hands_enfeebling = 'Theophany Mitts +3'
end

if item_available('Kaykaus Cuffs +1') then
	gear.whm_hands_enfeebling_resist = 'Kaykaus Cuffs +1'
else
	gear.whm_hands_enfeebling_resist = 'Theophany Mitts +3'
end

if item_available('Yagrush') then
	gear.whm_aoe_weapon = 'Yagrush'
else
	gear.whm_aoe_weapon = 'Daybreak'
end

if item_available('Piety Pantaloons +3') then
	gear.whm_relic_legs = 'Piety Pantaloons +3'
elseif item_available('Piety Pantaloons +2') then
	gear.whm_relic_legs = 'Piety Pantaloons +2'
else
	gear.whm_relic_legs = 'Piety Pantaloons +1'
end

if item_available('Th. Pant. +3') then
	gear.whm_AF_legs = 'Th. Pant. +3'
else
	gear.whm_AF_legs = 'Th. Pantaloons +2'
end

if item_available('Theo. Duckbills +3') then
	gear.whm_AF_feet = 'Theo. Duckbills +3'
else
	gear.whm_AF_feet = 'Theo. Duckbills +2'
end

--Refresh set
if item_available('Chironic Hat') then
	gear.whm_idle_head = gear.chironic_refresh_head
else
	gear.whm_idle_head = 'Inyanga Tiara +2'
end

if item_available('Chironic Gloves') then
	gear.whm_idle_hands = gear.chironic_refresh_hands
else
	gear.whm_idle_hands = 'Inyanga Dastanas +2'
end

if item_available('Chironic Hose') then
	gear.whm_idle_legs = gear.chironic_refresh_legs
else
	gear.whm_idle_legs = 'Assid. Pants +1'
end

if item_available('Chironic Slippers') then
	gear.whm_idle_feet = gear.chironic_refresh_feet
else
	gear.whm_idle_feet = 'Inyanga Crackows +2'
end

if item_available('Iridal Staff') then
	gear.cure_weather_weapon = 'Iridal Staff'
	gear.cure_weather_sub = 'Enki Strap'
else
	gear.cure_weather_weapon = 'Queller Rod'
	gear.cure_weather_sub = 'Ammurapi Shield'
end

-- Weapons sets
sets.weapons.Yagrush = {main="Yagrush",sub="Genmei Shield"}
sets.weapons.Tishtrya = {main="Tishtrya",sub="Genmei Shield"}
sets.weapons.Maxentius = {main="Maxentius",sub="Genmei Shield"}
sets.weapons.DualTish = {main="Tishtrya",sub="Daybreak"}
sets.weapons.DualMaxen = {main="Maxentius",sub="Daybreak"}

-- Precast Sets
-- 83%
--
sets.precast.FC = {
	main="C. Palug Hammer",																	-- 7
	sub="Genmei Shield",																	-- 3
	ammo="Sapience Orb",																	-- 2
	head="Vanya Hood",																		-- 10
	body={name="Inyanga Jubbah +2",priority=1},												-- 14
	hands="Gende. Gages +1",																-- 7
	legs="Ayanmo Cosciales +2",																-- 6
	feet="Regal Pumps +1",																	-- 6
	neck="Cleric's Torque",																	-- 5
	waist="Embla Sash",																		-- 5
	left_ear="Loquac. Earring",																-- 2
	right_ear="Malignance Earring",															-- 4
	left_ring="Kishar Ring",																-- 4
	right_ring="Lebeche Ring",																-- QC 2
	back=gear.jse_cure_back																	-- 10
}

sets.precast.FC.MEVA = set_combine(sets.precast.FC, {back={name="Moonbeam Cape",priority=1},})

sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})
sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {})
sets.precast.FC['Healing Magic'] = set_combine(sets.precast.FC,  {main=gear.whm_aoe_weapon, legs="Ebers Pantaloons +1"})
sets.precast.FC.StatusRemoval = set_combine(sets.precast.FC['Healing Magic'],{main=gear.whm_aoe_weapon})

-- MEVA
sets.precast.FC['Enhancing Magic'].MEVA = set_combine(sets.precast.FC.MEVA, {waist="Siegel Sash"})
sets.precast.FC.Stoneskin.MEVA = set_combine(sets.precast.FC['Enhancing Magic'].MEVA, {})
sets.precast.FC['Healing Magic'].MEVA = set_combine(sets.precast.FC.MEVA,  {main=gear.whm_aoe_weapon, legs="Ebers Pantaloons +1"})
sets.precast.FC.StatusRemoval.MEVA = set_combine(sets.precast.FC['Healing Magic'].MEVA,{main=gear.whm_aoe_weapon})
--sets.precast.FC['Reraise'].MEVA = set_combine(sets.precast.FC.MEVA, {})

-- Combines FC Set + Healing/Cure casting time set.

-- FC: 2 13 7 4 2 4 10 = 42%
-- Cure/Healing: 56%
-- Total: 98% + Merits / JP
--
sets.precast.FC.Cure = set_combine(sets.precast.FC['Healing Magic'], {	
	main="Queller Rod", 				-- 7
	sub="Genmei Shield", 				
	left_ear="Mendi. Earring",			-- 4
	right_ear="Nourishing Earring +1",	-- 5
	legs="Ebers Pantaloons +1", 		-- 13
	feet="Vanya Clogs",					-- 15
})
	
sets.precast.FC.Curaga = sets.precast.FC.Cure
sets.precast.FC.CureSolace = sets.precast.FC.Cure
sets.precast.FC.Impact =  set_combine(sets.precast.FC, {head=empty,body="Twilight Cloak"})

-- MEVA
sets.precast.FC.Cure.MEVA = set_combine(sets.precast.FC['Healing Magic'].MEVA, {
	main="Queller Rod", 				-- 7
	sub="Genmei Shield", 				
	left_ear="Mendi. Earring",			-- 4
	right_ear="Nourishing Earring +1",	-- 5
	legs="Ebers Pantaloons +1", 		-- 13
	feet="Vanya Clogs",					-- 15
})

sets.precast.FC.Curaga.MEVA = sets.precast.FC.Cure.MEVA
sets.precast.FC.CureSolace.MEVA = sets.precast.FC.Cure.MEVA
sets.precast.FC.Impact.MEVA =  set_combine(sets.precast.FC.MEVA, {head=empty,body="Twilight Cloak"})

-- Precast sets to enhance JAs
sets.precast.JA.Benediction = {body="Piety Bliaut +3"}
sets.precast.JA.Devotion = {} --head="Piety Cap"
sets.precast.JA.Sublimation = {waist="Embla Sash"}

--------------------------------
-- Waltz set (chr and vit)
sets.precast.Waltz = {}

-- Weaponskill sets

sets.precast.WS = {
	ammo="Crepuscular Pebble",
	head="Nyame Helm",
	body="Nyame Mail",
	hands="Nyame Gauntlets",
	legs="Nyame Flanchard",
	feet="Nyame Sollerets",
	neck="Fotia Gorget",
	waist="Fotia Belt",
    left_ear="Ishvara Earring",
    right_ear="Moonshade Earring",
    left_ring="Vertigo Ring",
    right_ring="Karieyh Ring",
	back="Moonbeam Cape",
}

sets.precast.WS.Dagan = {}
	
sets.MaxTP = {ear1="Telos Earring",ear2="Cessance Earring"}
sets.MaxTP.Dagan = {ear1="Etiolation Earring",ear2="Malignance Earring"}


--sets.precast.WS['Flash Nova'] = {}

--sets.precast.WS['Mystic Boon'] = {}

-- Midcast Sets

sets.Kiting = {feet="Crier's Gaiters"}
sets.latent_refresh = {waist="Fucho-no-obi"}
sets.DayIdle = {}
sets.NightIdle = {}
sets.TreasureHunter = set_combine(sets.TreasureHunter, {feet=gear.chironic_treasure_feet})

--Situational sets: Gear that is equipped on certain targets
sets.Self_Healing = {waist="Gishdubar Sash"}
sets.Cure_Received = {waist="Gishdubar Sash"}
sets.Self_Refresh = {waist="Gishdubar Sash",feet="Inspirited Boots"}

-- Conserve Mp set for spells that don't need anything else, for set_combine.

sets.ConserveMP = {
	main="Malignance Pole",
	sub="Enki Strap",
	ammo="Crepuscular Pebble",
	head="Vanya Hood",																-- CMP 6
	body="Vedic Coat",																-- CMP 10
	hands="Shrieker's Cuffs",														-- CMP 7
	legs="Vanya Slops",																-- CMP 12
	feet="Vanya Clogs",																-- CMP 6
	neck="Incanter's Torque",
	waist="Luminary Sash",															-- CMP 4
	left_ear="Magnetic Earring",													-- CMP 5
	right_ear="Calamitous Earring",													-- CMP 4
	left_ring="Defending Ring",
	right_ring="Gelatinous Ring +1",
	back="Solemnity Cape",															-- CMP 5
}
	
sets.midcast.Teleport = sets.ConserveMP
sets.midcast['Arise'] = sets.ConserveMP
sets.midcast['Arise'].MEVA = set_combine(sets.ConserveMP, {

})

-- Gear for Magic Burst mode.
sets.MagicBurst = {neck="Mizu. Kubikazari",ring1="Mujin Band"}

sets.midcast.FastRecast = sets.precast.FC

-- Cure sets

sets.midcast['Full Cure'] = sets.midcast.FastRecast

-- Cure sets

-- CPI:		50
-- CPII:	6

sets.midcast.Cure = {
	main={ name="Queller Rod", augments={'Healing magic skill +15','"Cure" potency +10%','"Cure" spellcasting time -7%',}},		-- 10 / 2
	sub="Sors Shield",																											-- 3
	ammo="Hydrocera",
	head="Ebers Cap +1",																										-- 16
	body="Theo. Bliaut +3",
	hands="Theophany Mitts +3",																									-- 0  / 4
	legs="Ebers Pantaloons +1",
	feet={ name="Vanya Clogs", augments={'"Cure" potency +5%','"Cure" spellcasting time -15%','"Conserve MP"+6',}},				-- 10
	neck="Cleric's Torque",																										-- 6
	waist="Porous Rope",
	left_ear="Mendi. Earring",																								-- 0  / 2
	right_ear="Glorious Earring",																							-- 5
	left_ring="Vertigo Ring",
	right_ring="Lebeche Ring",																									-- 3
	back=gear.jse_cure_back,																											
}

sets.midcast.CureSolace = set_combine(sets.midcast.Cure, { body="Ebers Bliaut +1" } )
sets.midcast.Curaga = sets.midcast.Cure
sets.midcast.LightWeatherCure = set_combine(sets.midcast.Cure, { main={name=gear.cure_weather_weapon,priority=1}, sub=gear.cure_weather_sub, waist="Korin Obi" } )
sets.midcast.LightWeatherCureSolace = set_combine(sets.midcast.Cure, { main={name=gear.cure_weather_weapon,priority=1}, sub=gear.cure_weather_sub, body="Ebers Bliaut +1", waist="Korin Obi" } )
sets.midcast.LightDayCureSolace = set_combine(sets.midcast.Cure, { main={name=gear.cure_weather_weapon,priority=1}, sub=gear.cure_weather_sub, body="Ebers Bliaut +1", waist="Korin Obi" } )
sets.midcast.LightDayCure = set_combine(sets.midcast.Cure, { main={name=gear.cure_weather_weapon,priority=1}, sub=gear.cure_weather_sub, waist="Korin Obi" } )
sets.midcast.LightWeatherCuraga = set_combine(sets.midcast.Cure ,{ main={name=gear.cure_weather_weapon,priority=1}, sub=gear.cure_weather_sub, waist="Korin Obi" } )
sets.midcast.LightDayCuraga = set_combine(sets.midcast.Cure, { main={name=gear.cure_weather_weapon,priority=1}, sub=gear.cure_weather_sub, waist="Korin Obi" } )

--	Cure:	50% + 9% II
-- 	PDT/DT:	-50%
sets.midcast.Cure.MEVA = {																							-- Cure 	/	PDT/DT
	main="Bunzi's Rod",																									-- 30%
	sub="Genmei Shield",																								-- 			/	10
	ammo="Crepuscular Pebble",																							--			/	3
	head="Ebers Cap +1",																								-- 16%
	body="Theo. Bliaut +3",
	hands="Theophany Mitts +3",																							-- 4% II
	legs="Ebers Pantaloons +1",
	feet="Nyame Sollerets",																								--			/	7
	neck="Cleric's Torque",																								-- 6%
	waist="Porous Rope",
	left_ear={name="Odnowa Earring +1",priority=1},																		--   			3
	right_ear="Glorious Earring",																						-- 5% II
	left_ring="Defending Ring",																							--				10
	right_ring={name="Gelatinous Ring +1",priority=1},																	--				7
	back=gear.jse_cure_back,																							--				10
}

sets.midcast.CureSolace.MEVA = set_combine(sets.midcast.Cure.MEVA, { body="Ebers Bliaut +1" } )
sets.midcast.Curaga.MEVA = sets.midcast.Cure.MEVA
sets.midcast.LightWeatherCure.MEVA = sets.midcast.Cure.MEVA
sets.midcast.LightWeatherCureSolace.MEVA = sets.midcast.Cure.MEVA
sets.midcast.LightDayCureSolace.MEVA = sets.midcast.Cure.MEVA
sets.midcast.LightDayCure.MEVA = sets.midcast.Cure.MEVA
sets.midcast.LightWeatherCuraga.MEVA = sets.midcast.Cure.MEVA
sets.midcast.LightDayCuraga.MEVA = sets.midcast.Cure.MEVA

sets.midcast["Reraise"] = sets.midcast.Cure.MEVA
sets.midcast["Reraise"].MEVA = sets.midcast.Cure.MEVA

--Melee Curesets are used whenever your Weapons state is set to anything but None.
sets.midcast.MeleeCure = sets.midcast.Cure 
sets.midcast.MeleeCureSolace = set_combine(sets.midcast.MeleeCure, {body="Ebers Bliaut +1"})
sets.midcast.MeleeLightWeatherCure = set_combine(sets.midcast.MeleeCure, {waist="Korin Obi"})
sets.midcast.MeleeLightWeatherCureSolace = set_combine(sets.midcast.MeleeCure, {body="Ebers Bliaut +1",waist="Korin Obi"})
sets.midcast.MeleeLightDayCureSolace = set_combine(sets.midcast.MeleeCure, {body="Ebers Bliaut +1",waist="Korin Obi"})
sets.midcast.MeleeLightDayCure = set_combine(sets.midcast.MeleeCure, {waist="Korin Obi"})
sets.midcast.MeleeCuraga = set_combine(sets.midcast.MeleeCure, {})
sets.midcast.MeleeLightWeatherCuraga = set_combine(sets.midcast.MeleeCure, {waist="Korin Obi"})
sets.midcast.MeleeLightDayCuraga = set_combine(sets.midcast.MeleeCure, {waist="Korin Obi"})

sets.midcast.Cursna = {
	main=gear.whm_aoe_weapon, 
	sub="Genmei Shield",
	ammo="Crepuscular Pebble",
	head="Aya. Zucchetto +2",
	body="Ebers Bliaut +1",
	hands="Fanatic Gloves",
	legs=gear.whm_AF_legs,
	feet={ name="Vanya Clogs", augments={'"Cure" potency +5%','"Cure" spellcasting time -15%','"Conserve MP"+6',}},
	neck="Debilis Medallion",
	waist="Porous Rope",
	left_ear="Odnowa Earring +1",
	right_ear="Genmei Earring",
	left_ring="Haoma's Ring",
	right_ring="Menelaus's Ring",
	back=gear.jse_cure_back,
}

sets.midcast.Cursna.MEVA = sets.midcast.Cursna

sets.midcast.StatusRemoval = {
	main=gear.whm_aoe_weapon,
	sub="Genmei Shield",
	ammo="Crepuscular Pebble",
	head="Ebers Cap +1",
	body=gear.whm_body_idle,
	hands="Ebers Mitts +1",
	legs="Ebers Pantaloons +1", 
	feet="Nyame Sollerets",
	neck="Cleric's Torque",
	waist="Porous Rope",
	left_ear="Odnowa Earring +1",
	right_ear="Genmei Earring",
	left_ring="Defending Ring",
	right_ring="Gelatinous Ring +1",	
	back=gear.jse_cure_back,
}
sets.midcast.StatusRemoval.MEVA = sets.midcast.StatusRemoval
	
-- 110 total Enhancing Magic Skill; caps even without Light Arts
-- Duration gear
-- 70%
sets.midcast['Enhancing Magic'] = {
	main=gear.gada_enhancing_club, 													-- 6%
	sub="Ammurapi Shield",															-- 10%
	ammo="Hydrocera",
	head=gear.telchine_enhancing_head,												-- 8%
	neck="Incanter's Torque",														-- 10 Skill
	body=gear.telchine_enhancing_body,												-- 8%
	hands=gear.telchine_enhancing_hands,											-- 10%
	legs=gear.telchine_enhancing_legs,												-- 8%
	feet=gear.telchine_enhancing_feet,												-- 10%
	waist="Embla Sash",																-- 10%
	left_ear="Andoaa Earring",														-- 5 Skill
	right_ear="Etiolation Earring",
	left_ring="Defending Ring",
	right_ring="Gelatinous Ring +1",
}

sets.midcast['Enhancing Magic'].MEVA = set_combine(sets.midcast['Enhancing Magic'], {
	ammo="Crepuscular Pebble",
	neck="Loricate Torque +1",
	left_ear="Odnowa Earring +1",
	right_ear="Genmei Earring",
	back={name="Moonbeam Cape",priority=1},
})

sets.midcast.BarElement = set_combine(sets.midcast['Enhancing Magic'], {
	main="Beneficus",
	head="Ebers Cap +1",
	body="Ebers Bliaut +1",
	hands="Ebers Mitts +1",
	legs=gear.whm_relic_legs,
	feet="Ebers Duckbills +1",
	back=gear.jse_cure_back,
})

sets.midcast.BarElement.MEVA = set_combine(sets.midcast.BarElement, {left_ear={name="Odnowa Earring +1",priority=1},})

sets.midcast.Regen = set_combine(sets.midcast['Enhancing Magic'], {
	main="Bolelabunga",
	head="Inyanga Tiara +2",
	body="Piety Bliaut +3",
	hands="Ebers Mitts +1",
	legs=gear.whm_AF_legs,
})

sets.midcast.Regen.MEVA = set_combine(sets.midcast.Regen, {
	ammo="Crepuscular Pebble",
	neck="Loricate Torque +1",
	left_ear="Odnowa Earring +1",
	right_ear="Genmei Earring",
})

-- Buff for duration
sets.midcast.Protectra = set_combine(sets.midcast['Enhancing Magic'], {})
sets.midcast.Protectra.MEVA = set_combine(sets.midcast.Protectra, {
	ammo="Crepuscular Pebble",
	neck="Loricate Torque +1",
	left_ear="Odnowa Earring +1",
	right_ear="Genmei Earring",
	back={name="Moonbeam Cape",priority=1},
})
sets.midcast.Protect = sets.midcast.Protectra 
sets.midcast.Protect.MEVA = set_combine(sets.midcast.Protect, {
	ammo="Crepuscular Pebble",
	neck="Loricate Torque +1",
	left_ear="Odnowa Earring +1",
	right_ear="Genmei Earring",
	back={name="Moonbeam Cape",priority=1},
})
sets.midcast.Shellra = set_combine(sets.midcast['Enhancing Magic'], {})
sets.midcast.Shellra.MEVA = set_combine(sets.midcast.Shellra, {
	ammo="Crepuscular Pebble",
	neck="Loricate Torque +1",
	left_ear="Odnowa Earring +1",
	right_ear="Genmei Earring",
	back={name="Moonbeam Cape",priority=1},
})
sets.midcast.Shell = sets.midcast.Shellra
sets.midcast.Shell.MEVA = set_combine(sets.midcast.Shell, {
	ammo="Crepuscular Pebble",
	neck="Loricate Torque +1",
	left_ear="Odnowa Earring +1",
	right_ear="Genmei Earring",
	back={name="Moonbeam Cape",priority=1},
})

sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {})
sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {neck="Nodens Gorget", waist="Siegel Sash"})
sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {main="Vadose Rod", head="Chironic Hat"})
sets.midcast.Auspice = set_combine(sets.midcast['Enhancing Magic'],{feet="Ebers Duckbills +1"})

sets.midcast.Refresh.MEVA  = set_combine(sets.midcast['Enhancing Magic'].MEVA , {})
sets.midcast.Stoneskin.MEVA  = set_combine(sets.midcast['Enhancing Magic'].MEVA , {neck="Nodens Gorget", waist="Siegel Sash"})
sets.midcast.Aquaveil.MEVA  = set_combine(sets.midcast['Enhancing Magic'].MEVA , {main="Vadose Rod", head="Chironic Hat"})
sets.midcast.Auspice.MEVA = set_combine(sets.midcast['Enhancing Magic'].MEVA,{feet="Ebers Duckbills +1"})

		sets.midcast.Impact = {}

		--Elemental based magic
		sets.midcast['Elemental Magic'] = {}
		sets.midcast['Elemental Magic'].Resistant = sets.midcast['Elemental Magic']

		--Light based magic
		sets.midcast['Divine Magic'] = {}
		sets.midcast.Holy = {}

--Dark based magic
sets.midcast['Dark Magic'] = {
	main="Bunzi's Rod",
	sub="Ammurapi Shield",
	ammo="Pemphredo Tathlum",
	head="C. Palug Crown",
	body=gear.whm_body_idle,
	hands=gear.whm_hands_enfeebling,
	legs="Inyanga Shalwar +2",
	feet="Inyanga Crackows +2",
	neck="Erra Pendant",
	waist="Fucho-no-obi",
	left_ear="Regal Earring",
	right_ear="Malignance Earring",
	left_ring="Evanescence Ring",
	right_ring="Archon Ring",
	back=gear.jse_cure_back,
}

sets.midcast.Drain = sets.midcast['Dark Magic']
sets.midcast.Drain.Resistant = sets.midcast.Drain
sets.midcast.Aspir = sets.midcast.Drain
sets.midcast.Aspir.Resistant = sets.midcast.Drain.Resistant

sets.midcast['Enfeebling Magic'] = {
	main="Daybreak",
	sub="Ammurapi Shield",
	ammo="Hydrocera",
	head="C. Palug Crown",
	body="Theo. Bliaut +3",
	hands=gear.whm_hands_enfeebling,
	legs=gear.whm_AF_legs,
	feet=gear.whm_AF_feet,
	neck="Incanter's Torque",
	waist="Luminary Sash",
	left_ear="Regal Earring",
	right_ear="Malignance Earring",
	left_ring="Metamorph Ring +1",
	right_ring="Kishar Ring",
	back=gear.jse_cure_back,
}

sets.midcast['Enfeebling Magic'].Resistant = set_combine(sets.midcast['Enfeebling Magic'], {hands=gear.whm_hands_enfeebling_resist})
sets.midcast['Enfeebling Magic'].MEVA = set_combine(sets.midcast['Enfeebling Magic'], {})--{back={name="Moonbeam Cape",priority=1},})
	
sets.midcast.Dia = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
sets.midcast.Diaga = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
sets.midcast['Dia II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
sets.midcast.Bio = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
sets.midcast['Bio II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)

sets.midcast.ElementalEnfeeble = set_combine(sets.midcast['Enfeebling Magic'], {})
sets.midcast.ElementalEnfeeble.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})

sets.midcast.IntEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {})
sets.midcast.IntEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})

sets.midcast.MndEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {})
sets.midcast.MndEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})

sets.midcast.Stun = sets.midcast['Enfeebling Magic']
sets.midcast.Stun.Resistant = sets.midcast.Stun 

--MEVA
sets.midcast.Dia.MEVA = set_combine(sets.midcast['Enfeebling Magic'].MEVA, sets.TreasureHunter)
sets.midcast.Diaga.MEVA = set_combine(sets.midcast['Enfeebling Magic'].MEVA, sets.TreasureHunter)
sets.midcast['Dia II'].MEVA = set_combine(sets.midcast['Enfeebling Magic'].MEVA, sets.TreasureHunter)
sets.midcast.Bio.MEVA = set_combine(sets.midcast['Enfeebling Magic'].MEVA, sets.TreasureHunter)
sets.midcast['Bio II'].MEVA = set_combine(sets.midcast['Enfeebling Magic'].MEVA, sets.TreasureHunter)

sets.midcast.ElementalEnfeeble.MEVA = set_combine(sets.midcast['Enfeebling Magic'].MEVA, {})
sets.midcast.IntEnfeebles.MEVA = set_combine(sets.midcast['Enfeebling Magic'].MEVA, {})
sets.midcast.MndEnfeebles.MEVA = set_combine(sets.midcast['Enfeebling Magic'].MEVA, {})
sets.midcast.Stun.MEVA = sets.midcast['Enfeebling Magic'].MEVA


-- Idle sets
--
-- Refresh: 9 MP
-- DT/PDT : -31
--
sets.idle = {
	main="Daybreak",								-- 			/		/	1 MP
	sub="Genmei Shield",							--	10 PDT 	/		/
	ammo="Homiliary",
	head=gear.whm_idle_head,						--			/		/	1 MP
	body=gear.whm_body_idle,						--			/		/	3 MP
	hands=gear.whm_idle_hands,						--			/		/	0.5 MP
	legs=gear.whm_idle_legs,						--			/		/	1 MP
	feet=gear.whm_idle_feet,						--			/		/	0.5 MP
	neck="Loricate Torque +1",						--			/ 6 DT	/
	waist="Porous Rope",
	left_ear="Infused Earring",
	right_ear="Etiolation Earring",
	left_ring="Defending Ring",						--			/ 10 DT	/
	right_ring="Inyanga Ring",						--			/		/	1 MP
	back=gear.jse_cure_back,								--			/ 5 DT	/
}

-- Resting sets
sets.resting = sets.idle

sets.idle.Town = set_combine(sets.idle, {
	main=gear.whm_aoe_weapon,
})

-- Defense sets
-- PDT/DT: 		-50
-- Refresh:		7 MP

sets.idle.DT = {
	main="Daybreak",								-- 			/		/	1 MP
	sub="Genmei Shield",							-- 10 PDT	/		/
	ammo="Crepuscular Pebble",						-- 			/ 3 DT	/
	head="Inyanga Tiara +2",						--			/		/	1 MP
	body=gear.whm_body_idle,						--			/		/	3 MP
	hands="Inyanga Dastanas +2",					--			/ 3 DT	/
	legs="Inyanga Shalwar +2",						--			/ 5 DT	/
	feet="Inyanga Crackows +2",						-- 			/ 3 DT	/
	neck="Loricate Torque +1",						-- 			/ 6 DT	/
	waist="Porous Rope",
	left_ear="Odnowa Earring +1",					
	right_ear="Etiolation Earring",
	left_ring="Defending Ring",						-- 			/ 10 DT	/
	right_ring=gear.whm_dt_ring,					-- 			/		/
	back=gear.jse_cure_back,						-- 			/ 5 DT	/
}
sets.idle.Weak = sets.idle.DT

 -- Defense sets

sets.defense.PDT = {
	main="Daybreak",								-- 			/		/	1 MP
	sub="Genmei Shield",							-- 10 PDT	/		/
	ammo="Crepuscular Pebble",						-- 			/ 3 DT	/
	head="Inyanga Tiara +2",						--			/		/	1 MP
	body=gear.whm_body_idle,						--			/		/	3 MP
	hands="Inyanga Dastanas +2",					--			/ 3 DT	/
	legs="Inyanga Shalwar +2",						--			/ 5 DT	/
	feet="Inyanga Crackows +2",						-- 			/ 3 DT	/
	neck="Loricate Torque +1",						-- 			/ 6 DT	/
	waist="Porous Rope",
	left_ear="Odnowa Earring +1",					
	right_ear="Etiolation Earring",
	left_ring="Defending Ring",						-- 			/ 10 DT	/
	right_ring=gear.whm_dt_ring,					-- 			/		/
	back=gear.jse_cure_back,						-- 			/ 5 DT	/
}

sets.defense.MDT = sets.defense.PDT
sets.defense.MEVA = sets.defense.MDT
		
-- Gear for specific elemental nukes.
sets.element.Wind = {}
sets.element.Ice = {}
sets.element.Earth = {}

-- Engaged sets

sets.engaged = {
	--ammo=
	head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Combatant's Torque",
    waist="Grunfeld Rope",
    left_ear="Telos Earring",
    right_ear="Crep. Earring",
    left_ring="Petrov Ring",
    right_ring="Ilabrat Ring",
	back="Moonbeam Cape",
}

sets.engaged.DW = set_combine(sets.engaged, {
	right_ear="Suppanomimi",
})

-- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
sets.buff['Divine Caress'] = {main=gear.whm_aoe_weapon, hands="Ebers Mitts +1"}
sets.HPDown = {}
sets.HPCure = {}
sets.buff.Doom = set_combine(sets.buff.Doom, {})
