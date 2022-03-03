--------------------------------------
-- Start defining the sets
--------------------------------------

-- Weapons sets
sets.weapons.Caladbolg = {main="Caladbolg",sub="Utu Grip"}
sets.weapons.Apocalypse = {main="Apocalypse",sub="Utu Grip"}
sets.weapons.Anguta = {main="Anguta",sub="Utu Grip"}
sets.weapons.KajaChopper = {main="Kaja Chopper",sub="Khonsu"}
sets.weapons.Loxotic = {main="Loxotic Mace +1",sub="Blurred Shield +1"}

-- Precast Sets
-- Precast sets to enhance JAs
sets.precast.JA['Diabolic Eye'] = {}
sets.precast.JA['Arcane Circle'] = {}
sets.precast.JA['Souleater'] = {}
sets.precast.JA['Weapon Bash'] = {}
sets.precast.JA['Nether Void'] = {}
sets.precast.JA['Blood Weapon'] = {}
sets.precast.JA['Dark Seal'] = {}
sets.precast.JA['Last Resort'] = {back="Ankou's Mantle"}
			   
-- Waltz set (chr and vit)
sets.precast.Waltz = {}
			   
-- Don't need any special gear for Healing Waltz.
sets.precast.Waltz['Healing Waltz'] = {}
	   
sets.precast.Step = {}

sets.precast.Flourish1 = {}
	   
-- Fast cast sets for spells

sets.precast.FC = {
	ammo="Sapience Orb",																			-- 2
	head={ name="Carmine Mask +1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}},		-- 14
	body="Fall. Cuirass +3",																		-- 10
	hands="Leyline Gloves",																			-- 7
	legs=gear.odyssean_fc_legs,																		-- 6
	feet=gear.odyssean_fc_feet,																		-- 10
	neck="Baetyl Pendant",																			-- 4
	waist="Flume Belt +1",
	left_ear="Loquac. Earring",																		-- 2
	right_ear="Malignance Earring",																	-- 4
	left_ring="Weather. Ring +1",																	-- 5
	right_ring="Kishar Ring",																		-- 4
	back=gear.jse_FC_Back,																			-- 10
}

sets.precast.FC['Dark Magic'] = set_combine(sets.precast.FC, {})

sets.precast.FC.Impact = set_combine(sets.precast.FC, {head=empty,body="Twilight Cloak"})
	
-- Midcast Sets
sets.midcast.FastRecast = sets.precast.FC
			   
-- Specific spells

sets.midcast['Dark Magic'] = {
	ammo="Pemphredo Tathlum",
	head={ name="Fall. Burgeonet +3", augments={'Enhances "Dark Seal" effect',}},
	body="Fall. Cuirass +3",
	hands={ name="Fall. Fin. Gaunt. +3", augments={'Enhances "Diabolic Eye" effect',}},
	legs={ name="Fall. Flanchard +3", augments={'Enhances "Muted Soul" effect',}},
	feet="Nyame Sollerets",
	neck="Erra Pendant",
	waist="Eschan Stone",
	left_ear="Digni. Earring",
	right_ear="Malignance Earring",
	left_ring="Archon Ring",
	right_ring="Evanescence Ring",
	back=gear.jse_FC_Back_Back,
}
	   
sets.midcast['Enfeebling Magic'] = {
	ammo="Pemphredo Tathlum",
	head="Hjarrandi Helm",
	body="Fall. Cuirass +3",
	hands={ name="Fall. Fin. Gaunt. +3", augments={'Enhances "Diabolic Eye" effect',}},
	legs="Nyame Flanchard",
	feet="Nyame Sollerets",
	neck="Erra Pendant",
	waist="Eschan Stone",
	left_ear="Digni. Earring",
	right_ear="Malignance Earring",
	left_ring="Archon Ring",
	right_ring="Evanescence Ring",
	back=gear.jse_FC_Back_Back,
}
	   
sets.midcast['Dread Spikes'] = set_combine(sets.midcast['Dark Magic'], {})
sets.midcast.Absorb = set_combine(sets.midcast['Dark Magic'], {hands="Heathen's Gauntlets +1", feet="Ratri Sollerets +1", back="Ankou's Mantle"})
	   
sets.midcast.Stun = {}
			   
sets.midcast.Drain = set_combine(sets.midcast['Dark Magic'], {ring1="Evanescence Ring",ring2="Archon Ring", back=gear.Drain_back}) -- feet="Ratri Sollerets +1", 

--sets.DrainWeapon.FC = {main="Shukuyu's Scythe"}
sets.DrainWeapon = {main="Misanthropy",sub="Utu Grip"} --sub="Alber Strap"
			   
sets.midcast.Aspir = sets.midcast.Drain

sets.midcast.Impact = set_combine(sets.midcast['Dark Magic'], {head=empty,body="Twilight Cloak"})

sets.midcast.Cure = {}

sets.Self_Healing = {waist="Gishdubar Sash"}
sets.Cure_Received = {waist="Gishdubar Sash"}
sets.Self_Refresh = {waist="Gishdubar Sash"}
									   
-- Weaponskill sets
-- Default set for any weaponskill that isn't any more specifically defined
sets.precast.WS = {
	ammo="Knobkierrie",																	-- 6
	head="Nyame Helm",
	body="Ignominy Cuirass +3",															-- 10
	hands="Nyame Gauntlets",															-- 5
	legs="Nyame Flanchard",																-- 9
	feet="Nyame Sollerets",																-- 7
	neck="Abyssal Beads +2",
	waist="Sailfi Belt +1",
	left_ear="Thrud Earring",															-- 3
	right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
	left_ring="Regal Ring",
	right_ring="Beithir Ring",															-- 3
	back=gear.jse_STR_Back,																-- 10
}

sets.precast.WS.SubtleBlow = set_combine(sets.precast.WS, {
	hands="Sakpata's Gauntlets",
	feet="Sakpata's Leggings",
	right_ring="Niqmaddu Ring",
})

sets.precast.WS.Enmity = set_combine(sets.precast.WS, {left_ear="Schere Earring"})
sets.precast.WS.KI = set_combine(sets.precast.WS, {body="Found. Breastplate"})

-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.	
sets.precast.WS['Torcleaver'] = set_combine(sets.precast.WS, {
	ammo="Crepuscular Pebble",															-- 3
	head="Nyame Helm",
	body="Ignominy Cuirass +3",															-- 10
	hands="Nyame Gauntlets",
	legs="Nyame Flanchard",																-- 9
	feet="Nyame Sollerets",																-- 7
	neck="Abyssal Beads +2",
	waist="Fotia Belt",
	left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
	right_ear="Thrud Earring",															-- 3
	left_ring="Regal Ring",
	right_ring="Niqmaddu Ring",															-- 3
	back=gear.jse_VIT_Back,																-- 10
})
sets.precast.WS['Torcleaver'].Enmity = set_combine(sets.precast.WS['Torcleaver'], {right_ear="Schere Earring"})
sets.precast.WS['Torcleaver'].SubtleBlow = set_combine(sets.precast.WS['Torcleaver'], {
	hands="Sakpata's Gauntlets",	-- 8
	feet="Sakpata's Leggings",		-- 10
	right_ring="Niqmaddu Ring",		-- 5
})
sets.precast.WS['Torcleaver'].KI = set_combine(sets.precast.WS, {body="Found. Breastplate"})

sets.precast.WS['Resolution'] = set_combine(sets.precast.WS, {})
sets.precast.WS['Catastrophe'] = set_combine(sets.precast.WS, {})
sets.precast.WS['Cross Reaper'] = set_combine(sets.precast.WS, {})
sets.precast.WS['Entropy'] = set_combine(sets.precast.WS, {})

sets.precast.WS['Shadow of Death'] = {
	ammo="Knobkierrie",																		
	head="Pixie Hairpin +1",
	body="Fall. Cuirass +3",																
	hands={ name="Fall. Fin. Gaunt. +3", augments={'Enhances "Diabolic Eye" effect',}},
	legs="Nyame Flanchard",
	feet="Nyame Sollerets",
	neck="Abyssal Beads +2",
	waist="Hachirin-no-Obi",
	left_ear="Malignance Earring",
	right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
	left_ring="Regal Ring",
	right_ring="Archon Ring",
	back=gear.jse_STR_Back,
}

sets.precast.WS['Armor Break'] = {
	ammo="Pemphredo Tathlum",
	head="Sakpata's Helm",
	body="Sakpata's Plate",
	hands="Sakpata's Gauntlets",
	legs="Sakpata's Cuisses",
	feet="Sakpata's Leggings",	
	neck="Erra Pendant",
	waist="Eschan Stone",
	left_ear="Malignance Earring",
	--right_ear="Digni. Earring",
	right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
	left_ring="Metamor. Ring +1",
	right_ring="Weather. Ring +1",
	back=gear.jse_FC_Back,
}
	   
-- Swap to these on Moonshade using WS if at 3000 TP
sets.MaxTP = {ear1="Thrud Earring",ear2="Lugra Earring +1",}
sets.AccMaxTP = {ear1="Thrud Earring",ear2="Lugra Earring +1",}
sets.AccDayMaxTPWSEars = {ear1="Thrud Earring",ear2="Lugra Earring +1"}
sets.DayMaxTPWSEars = {ear1="Thrud Earring",ear2="Lugra Earring +1",}
sets.AccDayWSEars = {ear1="Lugra Earring +1",ear2="Moonshade Earring"}
sets.DayWSEars = {ear1="Lugra Earring +1",ear2="Moonshade Earring",}
 
-- Idle sets
	   
sets.idle = {
	ammo="Staunch Tathlum +1",
	head="Sakpata's Helm",
	body="Chozor. Coselete",
	hands="Sakpata's Gauntlets",
	legs="Sakpata's Cuisses",
	feet="Sakpata's Leggings",
	neck="Coatl Gorget +1",
	waist="Flume Belt +1",
	left_ear="Infused Earring",
	right_ear="Etiolation Earring",
	left_ring="Chirich Ring +1",
	right_ring="Gelatinous Ring +1",
	back=gear.jse_TP_Back,
}

sets.idle.Reraise = set_combine(sets.idle, {})
	   
-- Defense sets
sets.defense.PDT = {
	ammo="Staunch Tathlum +1",
	head="Nyame Helm",
	body="Nyame Mail",
	hands="Nyame Gauntlets",
	legs="Nyame Flanchard",
	feet="Nyame Sollerets",
	neck="Loricate Torque +1",
	waist="Flume Belt +1",
	left_ear="Odnowa Earring +1",
	right_ear="Etiolation Earring",
	left_ring="Defending Ring",
	right_ring="Gelatinous Ring +1",
	back="Moonbeam Cape",
}

sets.defense.MDT = sets.defense.PDT
sets.defense.MEVA = sets.defense.PDT

sets.idle.Weak = sets.defense.PDT
sets.resting = sets.defense.PDT
sets.Kiting = {legs="Carmine Cuisses +1"}
sets.passive.Reraise = {}
sets.buff.Doom = set_combine(sets.buff.Doom, {})
sets.buff['Dark Seal'] = {head="Fallen's Burgeonet +3"}

--Extra Special Sets
sets.buff.Souleater = {}
sets.buff.Doom = set_combine(sets.buff.Doom, {})
sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
 
-- Engaged sets
sets.engaged = {
	ammo="Coiste Bodhar",
	head="Flam. Zucchetto +2",
	body="Hjarrandi Breast.",
	hands="Sakpata's Gauntlets",
	legs="Ig. Flanchard +3",
	feet="Flam. Gambieras +2",
	neck="Abyssal Beads +2",
	waist="Ioskeha Belt +1",
	left_ear="Telos Earring",
	right_ear="Cessance Earring",
	left_ring="Chirich Ring +1",
	right_ring="Niqmaddu Ring",
	back=gear.jse_TP_Back;
}
	
sets.engaged.Acc = {
	ammo="Coiste Bodhar",
	head="Flam. Zucchetto +2",
	body="Hjarrandi Breast.",
	hands="Sakpata's Gauntlets",
	legs="Ig. Flanchard +3",
	feet="Flam. Gambieras +2",
	neck="Abyssal Beads +2",
	waist="Ioskeha Belt +1",
	left_ear="Telos Earring",
	right_ear="Cessance Earring",
	left_ring="Chirich Ring +1",
	right_ring="Niqmaddu Ring",
	back=gear.jse_TP_Back;
}

sets.engaged.DT ={
	ammo="Coiste Bodhar",				-- 3
	head="Sakpata's Helm",				-- 7
	body="Sakpata's Plate",				-- 10
	hands="Sakpata's Gauntlets",		-- 5
	legs="Sakpata's Cuisses",
	feet="Sakpata's Leggings",
	neck="Abyssal Beads +2",
	waist="Ioskeha Belt +1",
	left_ear="Telos Earring",
	right_ear="Crep. Earring",
	left_ring="Chirich Ring +1",		-- 10
	right_ring="Niqmaddu Ring",
	back=gear.jse_TP_Back;				-- 10
}

sets.engaged.Acc.HybridDT = set_combine(sets.engaged.HybridDT, {})

sets.engaged.SubtleBlow ={
	ammo="Staunch Tathlum +1",
	head="Sakpata's Helm",
	body="Dagon Breast.",												-- 10 II
	hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},			-- 8
	legs="Sakpata's Cuisses",
	feet="Sakpata's Leggings",											-- 6
	neck={ name="Abyssal Beads +2", augments={'Path: A',}},
	waist="Ioskeha Belt +1",
	left_ear={name="Digni. Earring",priority=500},
	right_ear="Telos Earring",											-- 5
	left_ring="Chirich Ring +1",										-- 10
	right_ring="Niqmaddu Ring",											-- 5 II
	back=gear.jse_TP_Back;			
}
sets.engaged.Acc.SubtleBlow = set_combine(sets.engaged.SubtleBlow, {})

sets.idle.Town = sets.engaged.DT