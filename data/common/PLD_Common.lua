sets.weapons.Ochain = {main="Burtgang", sub="Ochain"}
sets.weapons.Aegis = {main="Burtgang", sub="Aegis"}
sets.weapons.Duban = {main="Burtgang", sub="Duban"}
sets.weapons.Srivatsa = {main="Burtgang", sub="Srivatsa"}
sets.weapons.Sakpata = {main="Sakpata's Sword",sub="Duban"}
sets.weapons.Naegling = {main="Naegling",sub="Blurred Shield +1"}

if item_available("Chevalier's Earring +2") then
	gear.empy_earring = "Chevalier's Earring +2"
elseif item_available("Chevalier's Earring +1") then
	gear.empy_earring = "Chevalier's Earring +1"
else
	gear.empy_earring = "Chevalier's Earring"
end

if item_available("Crepuscular Mail") then
	gear.idle_body = "Crepuscular Mail"
elseif item_available("Sacro Breastplate") then
	gear.idle_body = "Sacro Breastplate"
else
	gear.idle_body = "Sakpata's Plate"
end

if item_available("Crepuscular Mail") then
	gear.idle_refresh_body = "Crepuscular Mail"
else
	gear.idle_refresh_body = "Sakpata's Plate"
end

--------------------------------------
-- Precast sets
--------------------------------------
-- 128 Enmity

sets.Enmity = {
	ammo="Staunch Tathlum +1",
	head={name="Souveran Schaller +1",priority=280},														-- 9
	body={name="Souveran Cuirass +1",priority=171},															-- 20
	hands={name="Souv. Handsch. +1",priority=239},
	legs={name="Souv. Diechlings +1",priority=162},
	feet={name="Souveran Schuhs +1",priority=227},
	neck="Moonlight Necklace",																				-- 15	
	waist="Flume Belt +1",
	left_ear={name="Cryptic Earring",priority=40},															-- 4
	right_ear={name="Odnowa Earring +1",priority=110},
	left_ring="Defending Ring",
	right_ring={name="Eihwaz Ring",priority=70},															-- 5
	back=gear.tank_jse_back,																				-- 10
}
	
-- Merits 10%
-- 50%+ DT/PDT
-- 106% SIRD
-- 109 Enmity

sets.Enmity.SIRD = {																						-- SIRD	/	PDT	/ Enmity
	ammo="Staunch Tathlum +1",																				-- 11	/	3	/
	head={name="Souveran Schaller +1",priority=280},														-- 20			/	9
	body={name="Souveran Cuirass +1",priority=171},															--		/	10	/	20
	hands={name="Regal Gauntlets",priority=205},															-- 10
	legs={name="Founder's Hose",priority=54},																-- 30		5	/	 
	feet={name="Souveran Schuhs +1",priority=227},															--		/	5	/	9
	neck="Moonlight Necklace",																				-- 15	/		/	15
	waist="Audumbla Sash",																					-- 10	/	4
	left_ear={name="Cryptic Earring",priority=40},															--		/		/	4
	right_ear={name="Odnowa Earring +1",priority=110},														--		/	3
	left_ring={name="Moonlight Ring", priority=110},														--		/	5
	right_ring={name="Gelatinous Ring +1",priority=125},													-- 		/	7	/	
	back=gear.tank_jse_back,																				--		/	10	/	10
}
	
-- Precast sets to enhance JAs
sets.precast.JA['Invincible'] = set_combine(sets.Enmity,{legs={name="Cab. Breeches +2",priority=52}, left_ear={name="Tuisto Earring",priority=150},})
sets.precast.JA['Holy Circle'] = set_combine(sets.Enmity,{feet="Rev. Leggings +1"})
sets.precast.JA['Sentinel'] = set_combine(sets.Enmity,{feet="Cab. Leggings +3", left_ear={name="Tuisto Earring",priority=150},})
sets.precast.JA['Rampart'] = set_combine(sets.Enmity,{head={name="Cab. Coronet +2",priority=96}, left_ear={name="Tuisto Earring",priority=150},})
sets.precast.JA['Fealty'] = set_combine(sets.Enmity,{body={name="Cab. Surcoat +2",priority=118}, left_ear={name="Tuisto Earring",priority=150},})
sets.precast.JA['Divine Emblem'] = set_combine(sets.Enmity,{feet={name="Chev. Sabatons +3",priority=22}, left_ear={name="Tuisto Earring",priority=150},})
sets.precast.JA['Cover'] = set_combine(sets.Enmity, {body={name="Cab. Surcoat +2",priority=118}, left_ear={name="Tuisto Earring",priority=150},}) 	-- head="Rev. Coronet +1", 
sets.precast.JA['Shield Bash'] = set_combine(sets.Enmity, {hands="Cab. Gauntlets +3",})
sets.precast.JA['Palisade'] = set_combine(sets.Enmity, {})
sets.precast.JA['Intervene'] = set_combine(sets.Enmity, {})

-- add mnd for Chivalry
sets.precast.JA['Chivalry'] = {
	ammo="Hydrocera",
	head={name="Hjarrandi Helm",priority=114},
	body={name="Nyame Mail",priority=136},
	hands={name="Cab. Gauntlets +3",priority=124},
	legs={name="Nyame Flanchard",priority=114},
	feet={name="Nyame Sollerets",priority=68},
	neck={name="Unmoving Collar +1", priority=200},			-- For HP
	waist="Luminary Sash",
	left_ear="Nourish. Earring +1",
	right_ear={name="Odnowa Earring +1", priority=110},
	left_ring={name="Moonlight Ring", priority=110},
	right_ring={name="Gelatinous Ring +1",priority=125},
	back=gear.dt_moon_back,
}

sets.precast.JA['Provoke'] = set_combine(sets.Enmity, {})
sets.precast.JA['Warcry'] = set_combine(sets.Enmity, {})
sets.precast.JA['Defender'] = set_combine(sets.Enmity, {})
sets.precast.JA['Berserk'] = set_combine(sets.Enmity, {})
sets.precast.JA['Aggressor'] = set_combine(sets.Enmity, {})
sets.precast.JA['Chain Affinity'] = set_combine(sets.Enmity, {})
sets.precast.JA['Burst Affinity'] = set_combine(sets.Enmity, {})

-- Waltz set (chr and vit)
sets.precast.Waltz = {}
sets.precast.Waltz['Healing Waltz'] = {}
sets.precast.Step = {}
sets.precast.JA['Violent Flourish'] = {}
sets.precast.JA['Animated Flourish'] = set_combine(sets.Enmity, {})

-- Fast cast sets for spells
-- 75% FC 
-- 43% PDT 
sets.precast.FC = {
	ammo="Sapience Orb",																		-- 2%
	head={name="Carmine Mask +1",priority=38},													-- 14%
	body={name="Rev. Surcoat +3",priority=254},													-- 10%
	hands={name="Leyline Gloves",priority=5},													-- 8%
	legs={name="Enif Cosciales",priority=45},													-- 8%
	feet={name="Chev. Sabatons +3",priority=42},												-- 13%
	neck={name="Unmoving Collar +1", priority=500},												
	waist={name="Plat. Mog. Belt",priority=500},
	left_ear={name="Tuisto Earring",priority=500},
	right_ear={name="Odnowa Earring +1", priority=500},
	left_ring={name=gear.weather_ring ,priority=5},												-- 6%
	right_ring={name="Kishar Ring",priority=20},												-- 4%
	back=gear.tank_fc_back,																		-- 10%
}
	
sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {})--{waist="Siegel Sash"})

sets.precast.FC.Cure = set_combine(sets.precast.FC, {})

-- Weaponskill sets
-- Default set for any weaponskill that isn't any more specifically defined
sets.precast.WS = {
	ammo="Oshasha's Treatise",
	head="Nyame Helm",
	body="Nyame Mail",
	hands="Nyame Gauntlets",
	legs="Nyame Flanchard",
	feet="Nyame Sollerets",
	neck="Fotia Gorget",
	waist="Fotia Belt",
	left_ear="Moonshade Earring",
	right_ear="Thrud Earring",
	left_ring="Regal Ring",
	right_ring="Beithir Ring",
	back=gear.jse_wsd_back,
}
	
sets.precast.WS.Tank = {
	ammo="Oshasha's Treatise",
	head={name="Nyame Helm", priority=91},
	body={name="Nyame Mail", priority=136},
	hands={name="Regal Gauntlets", priority=250},
	legs={name="Nyame Flanchard", priority=114},
	feet={name="Nyame Sollerets", priority=68},
	neck={name="Unmoving Collar +1", priority=200},
	waist={name="Plat. Mog. Belt",priority=330},
	left_ear={name="Tuisto Earring",priority=150},
	right_ear={name="Odnowa Earring +1", priority=110},
	left_ring={name="Moonlight Ring", priority=110},
	right_ring={name="Gelatinous Ring +1", priority=125},
	back=gear.jse_wsd_back,
 }

-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
sets.precast.WS['Requiescat'] = set_combine(sets.precast.WS, {})
sets.precast.WS['Chant du Cygne'] = set_combine(sets.precast.WS, {})
sets.precast.WS['Savage Blade'] = set_combine(sets.precast.WS, {})
sets.precast.WS['Flat Blade'] = set_combine(sets.precast.WS, {})
sets.precast.WS['Sanguine Blade'] = set_combine(sets.precast.WS, {})

sets.precast.WS['Requiescat'].Tank = set_combine(sets.precast.WS.Tank, {})
sets.precast.WS['Chant du Cygne'].Tank = set_combine(sets.precast.WS.Tank, {})
sets.precast.WS['Savage Blade'].Tank = set_combine(sets.precast.WS.Tank, {})
sets.precast.WS['Flat Blade'].Tank = set_combine(sets.precast.WS.Tank, {})
sets.precast.WS['Sanguine Blade'].Tank = set_combine(sets.precast.WS.Tank, {})

sets.precast.WS['Atonement'] = {
	ammo="Staunch Tathlum +1",
	head={name="Souveran Schaller +1",priority=280},
	body={name="Souveran Cuirass +1",priority=171},
	hands={name="Souv. Handsch. +1",priority=239},
	legs={name="Souv. Diechlings +1",priority=162},
	feet={name="Souveran Schuhs +1",priority=227},
	neck="Moonlight Necklace",
	waist="Fotia Belt",
	left_ear="Moonshade Earring",
	right_ear={name="Odnowa Earring +1", priority=110},
	left_ring="Defending Ring",
	right_ring={name="Eihwaz Ring",priority=70},
	back=gear.tank_jse_back,
}

sets.precast.WS['Atonement'].Tank = sets.precast.WS['Atonement']

sets.precast.WS['Spirits Within'] = sets.precast.WS['Atonement']
sets.precast.WS['Spirits Within'].Tank = sets.precast.WS['Atonement']

-- Swap to these on Moonshade using WS if at 3000 TP

sets.MaxTP = {ear1={name="Tuisto Earring",priority=150},ear2={name="Odnowa Earring +1", priority=110},}
sets.AccMaxTP = {ear1={name="Tuisto Earring",priority=150},ear2={name="Odnowa Earring +1", priority=110},}
sets.AccDayMaxTPWSEars = {ear1={name="Tuisto Earring",priority=150},ear2={name="Odnowa Earring +1", priority=110},}
sets.DayMaxTPWSEars = {ear1={name="Tuisto Earring",priority=150},ear2={name="Odnowa Earring +1", priority=110},}
sets.AccDayWSEars = {ear1={name="Tuisto Earring",priority=150},ear2={name="Odnowa Earring +1", priority=110},}
sets.DayWSEars = {ear1={name="Tuisto Earring",priority=150},ear2={name="Odnowa Earring +1", priority=110},}


--------------------------------------
-- Midcast sets
--------------------------------------

sets.midcast.FastRecast = sets.precast.FC
	
sets.midcast.Flash = set_combine(sets.Enmity, {})
sets.midcast.Flash.SIRD = set_combine(sets.Enmity.SIRD, {})
sets.midcast.Stun = set_combine(sets.Enmity, {})
sets.midcast.Stun.SIRD = set_combine(sets.Enmity.SIRD, {})

sets.midcast['Blue Magic'] = set_combine(sets.Enmity.SIRD, {})
sets.midcast['Blue Magic'].SIRD = set_combine(sets.Enmity.SIRD, {})
sets.midcast.Cocoon = set_combine(sets.Enmity.SIRD, {})

-- 55% Cure potency
-- 39% PDT/DT
sets.midcast.Cure = {
	ammo="Sapience Orb",
	head={name="Souveran Schaller +1",priority=280},
	body={name="Souveran Cuirass +1",priority=171},				-- 11%
	hands={name="Regal Gauntlets", priority=205},
	legs={name="Souv. Diechlings +1",priority=162},
	feet=gear.odyssean_cure_feet,								-- 13%
	neck={name="Sacro Gorget", priority=50},					-- 10%
	waist={name="Carrier's Sash", priority=20},
	left_ear="Nourish. Earring +1",								-- 6%
	right_ear=gear.empy_earring,								-- 10%
	left_ring={name="Moonlight Ring", priority=110},
	right_ring={name="Eihwaz Ring",priority=70},
	back=gear.tank_cure_back,									-- 10%
}
	
-- SIRD: 96% + 10% Merits = 106%
-- Cure: 50%
-- 39% PDT/DT
sets.midcast.Cure.SIRD = {
	ammo="Staunch Tathlum +1",									-- 11
	head={name="Souveran Schaller +1",priority=380},			-- 20
	body={name="Souveran Cuirass +1",priority=171},				--		/	11%
	hands={name="Souv. Handsch. +1",priority=350},
	legs={name="Founder's Hose",priority=54},					-- 30
	feet=gear.odyssean_cure_feet,								-- 20	/	13%
	neck={name="Sacro Gorget", priority=50},					--		/	10%
	waist="Audumbla Sash",										-- 10				
	left_ear={name="Tuisto Earring",priority=500},
	right_ear="Nourish. Earring +1",							-- 5	/	6%		
	left_ring={name="Moonlight Ring", priority=110},
	right_ring={name="Gelatinous Ring +1", priority=500},
	back=gear.tank_cure_back,									--		/ 	10%
}

sets.Self_Healing = set_combine(sets.midcast.Cure, {})
sets.Self_Healing.SIRD = set_combine(sets.midcast.Cure.SIRD, {})	

sets.midcast.Reprisal = {
	ammo="Staunch Tathlum +1",	
	head={name="Carmine Mask +1",priority=38},													-- 14%
	body={name="Shab. Cuirass +1",priority=5},
	hands={name="Regal Gauntlets", priority=5},
	legs={name="Sakpata's Cuisses", priority=114},
	feet={name="Carmine Greaves +1",priority=95},												-- 8%
	neck={name="Unmoving Collar +1", priority=200},
	waist="Sailfi Belt +1",
	left_ear={name="Tuisto Earring",priority=150},
	right_ear={name="Odnowa Earring +1", priority=110},
	left_ring={name="Moonlight Ring", priority=110},
	right_ring={name="Gelatinous Ring +1",priority=125},
	back=gear.tank_fc_back,																		-- 10%
}
	
sets.Cure_Received = {waist="Gishdubar Sash"}
sets.Self_Refresh = {waist="Gishdubar Sash"}
sets.Regen_Received = {waist="Sroda Belt"}

sets.midcast['Enhancing Magic'] = {
	ammo="Staunch Tathlum +1",																				-- 11	/	3	/
	head={name="Souveran Schaller +1",priority=280},														-- 20			/	9
	body={name="Shab. Cuirass +1",priority=115},															--		/	10	/	20
	hands={name="Regal Gauntlets",priority=205},															-- 10
	legs={name="Founder's Hose",priority=54},																-- 30
	feet={name="Souveran Schuhs +1",priority=500},															-- 20
	neck={name="Moonlight Necklace",priority=5},															-- 15	/		/	15
	waist={name="Audumbla Sash",priority=5},																-- 10	/	4
	left_ear={name="Andoaa Earring",priority=5},
	right_ear={name="Odnowa Earring +1",priority=500},														--		/	3
	left_ring={name="Defending Ring",priority=5},															--		/	5
	right_ring={name="Gelatinous Ring +1",priority=500},													-- 		/	7	/	
	back=gear.dt_moon_back,	
}
	
sets.midcast['Enhancing Magic'].SIRD = set_combine(sets.midcast['Enhancing Magic'], {})

sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {waist="Siegel Sash"})
sets.midcast.Stoneskin.SIRD = set_combine(sets.midcast['Enhancing Magic'], {waist="Siegel Sash"})
sets.midcast['Protect V'] = set_combine(sets.midcast['Enhancing Magic'], {main="Burtgang",sub="Srivatsa",neck="Loricate Torque +1",feet={name="Odyssean Greaves",priority=20},})
sets.midcast['Protect V'].SIRD = set_combine(sets.midcast['Enhancing Magic'], {main="Burtgang",sub="Srivatsa",neck="Loricate Torque +1",feet={name="Odyssean Greaves",priority=20},})
sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {})
sets.midcast.Shell.SIRD = set_combine(sets.midcast['Enhancing Magic'], {})

sets.midcast.Phalanx = {
	ammo="Staunch Tathlum +1",																				-- 11	/	3	/
	head={name="Souveran Schaller +1",priority=280},														-- 20			/	9
	body={name="Shab. Cuirass +1",priority=115},															--		/	10	/	20
	--body={name="Valorous Mail",priority=55},
	hands={name="Souv. Handsch. +1",priority=239},															-- 10
	legs={name="Sakpata's Cuisses", priority=114},
	feet={name="Souveran Schuhs +1",priority=227},
	neck="Incanter's Torque",																				-- 15	/		/	15
	waist="Audumbla Sash",																					-- 10	/	4
	left_ear={name="Tuisto Earring",priority=500},
	right_ear={name="Odnowa Earring +1",priority=500},														--		/	3
	left_ring="Defending Ring",																				--		/	5
	right_ring={name="Gelatinous Ring +1",priority=500},													-- 		/	7	/	
	back=gear.phalanx_jse_back,	
}
	
sets.midcast.Phalanx.SIRD = sets.midcast.Phalanx

sets.midcast['Divine Magic'] = set_combine(sets.Enmity.SIRD, {})
sets.midcast['Divine Magic'].SIRD = sets.midcast['Divine Magic']

--------------------------------------
-- Idle/resting/defense/etc sets
--------------------------------------
sets.idle = {
	ammo="Homiliary",												-- 1MP
	head={name="Crepuscular Helm", priority=114},
	body=gear.idle_body,
	hands={name="Regal Gauntlets", priority=205},					-- 1MP
	legs={name="Sakpata's Cuisses", priority=114},
	feet={name="Sakpata's Leggings", priority=68},
	neck="Sanctity Necklace",
	waist={name="Carrier's Sash", priority=20},
	left_ear={name="Tuisto Earring", priority=150},
	right_ear={name="Odnowa Earring +1", priority=110},
	left_ring={name="Moonlight Ring", priority=110},
	right_ring={name="Gelatinous Ring +1", priority=125},
	back=gear.tank_jse_back,
}

sets.idle.Town = {
	main="Burtgang", sub="Ochain"
}
	
sets.idle.DT = {
	ammo="Staunch Tathlum +1",
	head={name="Sakpata's Helm", priority=5},
	body={name="Sakpata's Plate", priority=300},
	hands={name="Sakpata's Gauntlets", priority=5},
	legs={name="Sakpata's Cuisses", priority=300},
	feet={name="Sakpata's Leggings", priority=5},
	neck={name="Unmoving Collar +1", priority=500},
	waist={name="Carrier's Sash", priority=5},
	left_ear={name="Tuisto Earring", priority=500},
	right_ear={name="Odnowa Earring +1", priority=500},
	left_ring={name="Moonlight Ring", priority=500},
	right_ring={name="Gelatinous Ring +1", priority=500},
	back=gear.tank_jse_back,
}
	
sets.idle.Weak = sets.idle.Tank
sets.resting = sets.idle
sets.Kiting = {legs="Carmine Cuisses +1"}

sets.latent_refresh = {body=gear.idle_refresh_body, waist="Fucho-no-obi"}
sets.latent_refresh_grip = {}
sets.latent_regen = {}
sets.DayIdle = {}
sets.NightIdle = {}

--------------------------------------
-- Defense sets
--------------------------------------

-- Extra defense sets.  Apply these on top of melee or defense sets.
sets.Knockback = {}
sets.MP = {}
sets.passive.AbsorbMP = {}
sets.MP_Knockback = {}
sets.Twilight = {}
sets.TreasureHunter = set_combine(sets.TreasureHunter, {})

sets.defense.PDT = {
	ammo="Staunch Tathlum +1",
	head={name="Sakpata's Helm", priority=91},
	body={name="Sakpata's Plate", priority=136},
	hands={name="Sakpata's Gauntlets", priority=91},
	legs={name="Sakpata's Cuisses", priority=114},
	feet={name="Sakpata's Leggings", priority=68},
	neck={name="Unmoving Collar +1", priority=200},
	waist={name="Carrier's Sash", priority=20},
	left_ear={name="Tuisto Earring", priority=150},
	right_ear={name="Odnowa Earring +1", priority=110},
	left_ring={name="Moonlight Ring", priority=110},
	right_ring={name="Gelatinous Ring +1", priority=125},
	back=gear.dt_moon_back,
}

sets.defense.MEVA = sets.defense.PDT
sets.defense.MDT = sets.defense.MEVA

--------------------------------------
-- Engaged sets
--------------------------------------

sets.engaged = {
	ammo="Ginsen",
	head={name="Sakpata's Helm", priority=91},
	body={name="Sakpata's Plate", priority=136},
	hands={name="Sakpata's Gauntlets", priority=91},
	legs={name="Sakpata's Cuisses", priority=114},
	feet={name="Sakpata's Leggings", priority=68},
	neck="Combatant's Torque",
	waist="Windbuffet Belt +1",
	left_ear="Telos Earring",
	right_ear="Crep. Earring",
	left_ring={name="Moonlight Ring", priority=110},
	right_ring="Petrov Ring",
	--back=tp cape
}

sets.engaged.Acc = set_combine(sets.engaged, {})

sets.engaged.DW = set_combine(sets.engaged, {right_ear="Suppanomimi"})
sets.engaged.DW.Acc = set_combine(sets.engaged.Acc, {right_ear="Suppanomimi"})

sets.engaged.Tank = {
	ammo="Staunch Tathlum +1",
	head={name="Sakpata's Helm", priority=91},
	body={name="Sakpata's Plate", priority=136},
	hands={name="Sakpata's Gauntlets", priority=91},
	legs={name="Sakpata's Cuisses", priority=114},
	feet={name="Sakpata's Leggings", priority=68},
	neck={name="Unmoving Collar +1", priority=200},
	waist={name="Carrier's Sash", priority=20},
	left_ear={name="Tuisto Earring", priority=150},
	right_ear={name="Odnowa Earring +1", priority=110},
	left_ring={name="Moonlight Ring", priority=110},
	right_ring={name="Gelatinous Ring +1", priority=125},
	back=gear.tank_jse_back,
}

sets.engaged.DTLite = {
	ammo="Ginsen",
	head={name="Sakpata's Helm", priority=91},
	body={name="Sakpata's Plate", priority=136},
	hands={name="Sakpata's Gauntlets", priority=91},
	legs={name="Sakpata's Cuisses", priority=114},
	feet={name="Sakpata's Leggings", priority=68},
	neck="Combatant's Torque",
	waist="Sailfi Belt +1",
	left_ear="Cessance Earring",
	right_ear="Telos Earring",
	left_ring="Moonlight Ring",
	right_ring="Regal Ring",
		back=gear.tank_jse_back,
}
	
sets.engaged.Reraise = set_combine(sets.engaged.Tank, sets.Reraise)
sets.engaged.Acc.Reraise = set_combine(sets.engaged.Acc.Tank, sets.Reraise)
	
--------------------------------------
-- Custom buff sets
--------------------------------------
sets.buff.Doom = set_combine(sets.buff.Doom, {})
sets.buff.Sleep = {}
sets.buff.Cover = {body="Cab. Surcoat +2"}
