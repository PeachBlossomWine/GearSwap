autows_list = {['DualMurCea']='Savage Blade',['DualMurgleis']='Savage Blade',['DualCrocea']='Seraph Blade',['DualCroDay']='Seraph Blade',['DualSequence']='Savage Blade',['DualSavage']='Savage Blade',['DualEvis']='Evisceration',['DualClubs']='Black Halo',['Murgleis']='Savage Blade',['Crocea']='Seraph Blade',['Sequence']='Savage Blade',['Naegling']='Savage Blade',['Maxentius']='Black Halo',}

--Burst
if item_available("Ea Hat +1") then
	gear.BurstHead = 'Ea Hat +1'
elseif item_available("Leth. Chappel +3") then
	gear.BurstHead = "Leth. Chappel +3"
else
	gear.BurstHead = "Leth. Chappel +2"
end

if item_available("Crepuscular Cloak") then
	gear.impact_body = "Crepuscular Cloak"
else
	gear.impact_body = "Twilight Cloak"
end

-- JSE AF
if item_available("Atrophy Tights +3") then
	gear.jse_af_legs = "Atrophy Tights +3"
else
	gear.jse_af_legs = "Atrophy Tights +2"
end

-- JSE Empy
if item_available("Lethargy Sayon +3") then
	gear.jse_empy_body = "Lethargy Sayon +3"
else
	gear.jse_empy_body = "Lethargy Sayon +2"
end

if item_available("Leth. Ganth. +3") then
	gear.jse_empy_hands = "Leth. Ganth. +3"
else
	gear.jse_empy_hands = "Leth. Ganth. +2"
end

if item_available("Leth. Houseaux +3") then
	gear.jse_empy_feet = "Leth. Houseaux +3"
else
	gear.jse_empy_feet = "Leth. Houseaux +2"
end

if item_available("Leth. Fuseau +3") then
	gear.jse_empy_legs = "Leth. Fuseau +3"
else
	gear.jse_empy_legs = "Leth. Fuseau +2"
end

if item_available("Leth. Chappel +3") then
	gear.jse_empy_head = "Leth. Chappel +3"
else
	gear.jse_empy_head = "Leth. Chappel +2"
end

if item_available("Leth. Earring +2") then
	gear.empy_earring = "Leth. Earring +2"
	gear.empy_debuff_earring = "Leth. Earring +2"
elseif item_available("Leth. Earring +1") then
	gear.empy_earring = "Leth. Earring +1"
	gear.empy_debuff_earring = "Regal Earring"
else
	gear.empy_earring = "Lethargy Earring"
	gear.empy_debuff_earring = "Regal Earring"
end

--Idle
if item_available("Lethargy Sayon +3") then
	gear.idle_body = "Lethargy Sayon +3"
elseif item_available("Shamash Robe") then
	gear.idle_body = "Shamash Robe"
else
	gear.idle_body = "Atrophy Tabard +3"
end

-- Weapons sets
sets.weapons.Murgleis = {main="Murgleis",sub="Ammurapi Shield"}
sets.weapons.Crocea = {main="Crocea Mors",sub="Ammurapi Shield"}
sets.weapons.Sequence = {main="Sequence",sub="Ammurapi Shield"}
sets.weapons.Naegling = {main="Naegling",sub="Ammurapi Shield"}
sets.weapons.Maxentius = {main="Maxentius",sub="Ammurapi Shield"}
-- DW
sets.weapons.DualMurCea = {main="Murgleis",sub="Crocea Mors"}
sets.weapons.DualMurgleis = {main="Murgleis",sub="Gleti's Knife"}
sets.weapons.DualCrocea = {main="Crocea Mors",sub="Gleti's Knife"}
sets.weapons.DualCroDay = {main="Crocea Mors",sub="Daybreak"}
sets.weapons.DualSequence = {main="Sequence",sub="Gleti's Knife"}
sets.weapons.DualSavage = {main="Naegling",sub="Gleti's Knife"}
sets.weapons.DualEvis = {main="Tauret",sub="Gleti's Knife"}
sets.weapons.DualClubs = {main="Maxentius",sub="Bunzi's Rod"}


-- Precast Sets
sets.precast.JA['Chainspell'] = {body="Viti. Tabard +3"}
sets.precast.JA['Convert'] = {main="Murgleis"}

-- Waltz set (chr and vit)
sets.precast.Waltz = {}
	
-- Don't need any special gear for Healing Waltz.
sets.precast.Waltz['Healing Waltz'] = {}

-- Fast cast sets for spells
-- Traits: 30%
-- 52% FC
-- 6% QC
sets.precast.FC = {
	ammo={name="Impatiens", priority=1},													-- QC 2
	ranged=empty,
	head="Nyame Helm",
	body="Viti. Tabard +3",																	-- 15
	hands="Leyline Gloves",																	-- 8
	legs="Psycloth Lappas",																	-- 7
	feet="Nyame Sollerets",
	neck="Baetyl Pendant",  																-- 4
	waist="Embla Sash",																		-- 5
	left_ear="Malignance Earring",															-- 4
	right_ear=gear.empy_earring,															-- 8
	left_ring=gear.weather_ring,															-- 6 QC 4
	right_ring="Kishar Ring",																-- 4
	back="Perimede Cape",																	-- QC 4
}
	
sets.precast.FC.Impact = set_combine(sets.precast.FC, {head=empty,body=gear.impact_body, left_ring="Medada's Ring", ammo="Sapience Orb",back="Solemnity Cape"})
sets.precast.FC.Dispelga = set_combine(sets.precast.FC, {main="Daybreak",sub="Genmei Shield"})

sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {ammo="Sapience Orb", left_ring="Petrov Ring", back=gear.jse_mab_back})
   
-- Weaponskill sets
sets.precast.WS = {
	range=empty,
	ammo="Crepuscular Pebble",
	head="Nyame Helm",
	body="Nyame Mail",
	hands="Nyame Gauntlets",
	legs="Nyame Flanchard",
	feet=gear.jse_empy_feet,
	neck="Fotia Gorget",
	waist="Fotia Belt",
	left_ear="Ishvara Earring",
	right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
	left_ring="Petrov Ring",
	right_ring="Rufescent Ring",
	back=gear.jse_str_back,
}

sets.precast.WS.SubtleBlow = set_combine(sets.precast.WS, {
	waist="Sarissapho. Belt",
    left_ear="Digni. Earring",
	right_ring="Chirich Ring +1",
})

sets.precast.WS['Death Blossom'] = set_combine(sets.precast.WS, {
	neck="Dls. Torque +2",
	waist="Sailfi Belt +1",
	left_ear="Regal Earring",
	left_ring="Rufescent Ring",																		
	right_ring="Metamor. Ring +1",
	back=gear.jse_mnd_back,
})
sets.precast.WS['Requiescat'] = set_combine(sets.precast.WS, {})
sets.precast.WS['Chant Du Cygne'] = set_combine(sets.precast.WS, {})

sets.precast.WS['Savage Blade'] = {
	range=empty,
	ammo="Crepuscular Pebble",
	head="Nyame Helm",
	body="Nyame Mail",
	hands="Nyame Gauntlets",
	legs="Nyame Flanchard",
	feet=gear.jse_empy_feet,
	neck="Fotia Gorget",
	waist="Grunfeld Rope",
	left_ear="Ishvara Earring",
	right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
	left_ring="Petrov Ring",
	right_ring="Rufescent Ring",
	back=gear.jse_str_back,
}
	
sets.precast.WS['Seraph Blade'] = {
	range=empty,
	ammo="Sroda Tathlum",
	head="Nyame Helm",
	body="Nyame Mail",
	hands="Nyame Gauntlets",
	legs="Nyame Flanchard",
	feet=gear.jse_empy_feet,
	neck="Baetyl Pendant",
	waist="Sacro Cord",
	left_ear="Regal Earring",
	right_ear="Malignance Earring",
	left_ring=gear.weather_ring,																		
	right_ring="Medada's Ring",
	back=gear.jse_mnd_back,
}

sets.precast.WS['Black Halo'] = {
	range=empty,
	ammo="Crepuscular Pebble",
	head="Nyame Helm",
	body="Nyame Mail",
	hands="Nyame Gauntlets",
	legs="Nyame Flanchard",
	feet=gear.jse_empy_feet,
	neck="Combatant's Torque",
	waist="Sailfi Belt +1",
	left_ear="Regal Earring",
	right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
	left_ring="Rufescent Ring",																		
	right_ring="Metamor. Ring +1",
	back=gear.jse_str_back,
}

sets.precast.WS['Black Halo'].SubtleBlow = set_combine(sets.precast.WS['Black Halo'], {
	neck="Null Loop",
	waist="Null Belt",
    left_ear="Digni. Earring",
	left_ring={name="Chirich Ring +1", bag="wardrobe3"},
	right_ring={name="Chirich Ring +1", bag="wardrobe4"},
})
	
sets.precast.WS['Sanguine Blade'] = set_combine(sets.precast.WS['Seraph Blade'], {head="Pixie Hairpin +1",left_ring="Archon Ring",back=gear.jse_mab_back})
	
sets.precast.WS['Evisceration'] = sets.precast.WS['Chant Du Cygne']
sets.precast.WS['Aeolian Edge'] = set_combine(sets.precast.WS['Seraph Blade'], {})

-- Midcast Sets
sets.TreasureHunter = set_combine(sets.TreasureHunter, {})

-- Gear that converts elemental damage done to recover MP.	
sets.RecoverMP = {body="Seidr Cotehardie"}

-- Gear for Magic Burst mode.
sets.MagicBurst = {
	main="Bunzi's Rod",																			-- 10
	sub="Ammurapi Shield",
	range=empty,
	ammo="Ghastly Tathlum +1",
	head=gear.BurstHead,																		-- 7 / 7II
	body=gear.jse_empy_body,
	hands="Bunzi's Gloves",																		-- 8 / 5 II
	legs=gear.jse_empy_legs,																	-- 15
	feet=gear.jse_empy_feet,
	neck="Mizu. Kubikazari",																	-- 10
	waist="Sacro Cord",
	left_ear="Regal Earring",
	right_ear="Malignance Earring",
	left_ring="Medada's Ring",
	right_ring="Freke Ring",
	back=gear.jse_mab_back,
}

sets.midcast.FastRecast = sets.precast.FC

sets.midcast.Cure = {
    main="Bunzi's Rod",
    sub="Ammurapi Shield",
    ammo=gear.dt_ammo,
    head=gear.jse_empy_head,
    body=gear.jse_empy_body,
    hands=gear.jse_empy_hands,
    legs=gear.jse_af_legs,
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Incanter's Torque",
    waist="Luminary Sash",
    left_ear="Regal Earring",
    right_ear="Mendi. Earring",
    left_ring="Defending Ring",
    right_ring=gear.stikini_ring,
    back="Solemnity Cape",
}
	
sets.midcast.LightWeatherCure = {
    main="Chatoyant Staff",
    sub="Enki Strap",
    ammo=gear.dt_ammo,
    head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},
    body=gear.jse_empy_body,
    hands=gear.jse_empy_hands,
    legs=gear.jse_af_legs,
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Nodens Gorget",
    waist="Korin Obi",
    left_ear="Regal Earring",
    right_ear="Mendi. Earring",
    left_ring="Defending Ring",
    right_ring="Lebeche Ring",
    back="Solemnity Cape",
}

sets.midcast.LightDayCure = set_combine(sets.midcast.LightWeatherCuree, {})
	
sets.midcast.Cursna =  set_combine(sets.midcast.Cure, {neck="Debilis Medallion",left_ring="Haoma's Ring",right_ring="Menelaus's Ring"})
sets.midcast.StatusRemoval = set_combine(sets.midcast.FastRecast, {})
	
sets.midcast.Curaga = sets.midcast.Cure
sets.Self_Healing = {waist="Gishdubar Sash"}
sets.Cure_Received = {waist="Gishdubar Sash"}
sets.Self_Refresh = {waist="Gishdubar Sash"}

-- 110 total Enhancing Magic Skill; caps even without Light Arts
-- Duration gear
-- 70%
sets.midcast['Enhancing Magic'] = {
	main=gear.colada_enhancing_sword,												-- 4% 	
	sub="Ammurapi Shield",															-- 10%
	head=gear.telchine_enhancing_head,												-- 9%
	body="Viti. Tabard +3",															-- 15%
	hands="Atrophy Gloves +3",														-- 20%
	legs=gear.telchine_enhancing_legs,												-- 9%
	feet=gear.jse_empy_feet,														-- 30%
	neck=gear.rdm_jse_neck,															-- ?
	waist="Embla Sash",																-- 10%
	left_ear="Etiolation Earring",
	right_ear=gear.empy_earring,
	left_ring="Defending Ring",
	right_ring="Gelatinous Ring +1",
	back=gear.jse_macc_back,														-- 20%
}

--Atrophy Gloves are better than Lethargy for me despite the set bonus for duration on others.		
sets.buff.ComposureOther = --set_combine(sets.midcast['Enhancing Magic'], {
{		
	head=gear.jse_empy_head,
	body=gear.jse_empy_body,
	--hands=gear.jse_empy_hands,
	hands="Atrophy Gloves +3",
	legs=gear.jse_empy_legs,
	feet=gear.jse_empy_feet,
}

	
--Red Mage enhancing sets are handled in a different way from most, layered on due to the way Composure works
--Don't set combine a full set with these spells, they should layer on Enhancing Set > Composure (If Applicable) > Spell
sets.EnhancingSkill = {
	sub="Ammurapi Shield",
	range=empty,
	ammo=gear.dt_ammo,
	head="Befouled Crown",
	body="Viti. Tabard +3",
	hands="Viti. Gloves +3",
	legs=gear.jse_af_legs,
	feet=gear.jse_empy_feet,
	neck="Incanter's Torque",
	waist=gear.dt_waist,
	left_ear="Andoaa Earring",			-- 5
	right_ear="Mimir Earring",			-- 10
	left_ring="Defending Ring",
	right_ring=gear.stikini_ring,
	back=gear.jse_skill_back,
}

sets.midcast.Refresh = {head="Amalric Coif +1",body="Atrophy Tabard +3",hands="Atrophy Gloves +3",legs=gear.jse_empy_legs}
sets.midcast.Aquaveil = {head="Amalric Coif +1",hands=gear.rdm_regal_hands}
sets.midcast.BarElement = {}
sets.midcast.Temper = sets.EnhancingSkill
sets.midcast.Temper.DW = set_combine(sets.midcast.Temper, {})
sets.midcast.Enspell = set_combine(sets.EnhancingSkill, {legs="Viti. Tights +3"})
sets.midcast.Enspell.DW = set_combine(sets.midcast.Enspell, {})
sets.midcast.BoostStat = {hands="Viti. Gloves +3"}
sets.midcast.Stoneskin = {neck="Nodens Gorget",waist="Siegel Sash"}
sets.midcast.Protect = {}
sets.midcast.Shell = {}

sets.midcast['Phalanx'] = {
	sub="Ammurapi Shield",
	range=empty,
	ammo=gear.dt_ammo,
	head=gear.taeon_phalanx_head,		-- Phalanx +3
	body=gear.taeon_phalanx_body,		-- Phalanx +3
	hands=gear.taeon_phalanx_hands,		-- Phalanx +3
	legs=gear.taeon_phalanx_legs,		-- Phalanx +3
	feet=gear.taeon_phalanx_feet,		-- Phalanx +3
	neck="Incanter's Torque",			-- 10
	waist=gear.dt_waist,
	left_ear="Andoaa Earring",			-- 5
	right_ear="Mimir Earring",			-- 10
	left_ring="Defending Ring",
	right_ring=gear.stikini_ring,		-- 8
	back=gear.jse_macc_back,
}


-- Main enfeebling with duration/potency
-- INT:	Sleep/Gravity/Bind/Distract/Frazzle/Blind/Poison/Dispel/Break
-- MND: Addle/Inundation/Paralyze/Slow/Silence/Dia

-- 45% Duration
sets.midcast['Enfeebling Magic'] = {
	main="Daybreak",
	sub="Ammurapi Shield",
	range=empty,
	ammo={name="Regal Gem", priority=500},	-- E
	head="Viti. Chapeau +3",
	body=gear.jse_empy_body,				-- E
	hands=gear.rdm_regal_hands,
	legs=gear.chironic_enfeeble_legs,
	feet="Vitiation Boots +3",				-- E
	neck=gear.rdm_jse_neck,					-- E
	waist="Obstin. Sash",
	left_ear="Snotra Earring",
	right_ear=gear.empy_debuff_earring,
	left_ring="Kishar Ring",
	right_ring={name="Metamorph Ring +1", priority=500},
	back=gear.jse_macc_back,				-- E
}
	
-- -20% Duration
-- -24% Potency
-- +92 Macc/skill
sets.midcast['Enfeebling Magic'].Resistant = set_combine(sets.midcast['Enfeebling Magic'], {
	range={name="Ullr", priority=500},
	ammo=empty,
	body="Atrophy Tabard +3",
	hands=gear.jse_empy_hands,
	legs=gear.jse_empy_legs,
	left_ring=gear.stikini_ring,
	right_ring={name="Metamorph Ring +1", priority=500},
})

sets.midcast['Enfeebling Magic'].Resistant.INT = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {
	main="Bunzi's Rod", 
})
	
sets.midcast.DurationOnlyEnfeebling = set_combine(sets.midcast['Enfeebling Magic'], {
	range={name="Ullr", priority=500},
	ammo=empty,
	head=gear.jse_empy_head,
	legs=gear.jse_empy_legs,
	feet=gear.jse_empy_feet,
})

sets.midcast.DurationOnlyEnfeebling.INT = set_combine(sets.midcast['Enfeebling Magic'], {
	main="Bunzi's Rod",
	range={name="Ullr", priority=500},
	ammo=empty,
	head=gear.jse_empy_head,
	legs=gear.jse_empy_legs,
	feet=gear.jse_empy_feet,
})	

sets.midcast.DurationOnlyEnfeebling.Melee = set_combine(sets.midcast['Enfeebling Magic'], {
	head=gear.jse_empy_head,
	legs=gear.jse_empy_legs,
	feet=gear.jse_empy_feet,
})
	
sets.midcast.Silence = sets.midcast.DurationOnlyEnfeebling
sets.midcast.Silence.Melee = sets.midcast.DurationOnlyEnfeebling.Melee
sets.midcast.Silence.Resistant = sets.midcast['Enfeebling Magic'].Resistant
sets.midcast.Sleep = set_combine(sets.midcast.DurationOnlyEnfeebling.INT,{})
sets.midcast.Sleep.Melee = sets.midcast.DurationOnlyEnfeebling.Melee
sets.midcast.Sleep.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant.INT,{})

sets.midcast['Sleep'] = set_combine(sets.midcast.DurationOnlyEnfeebling.INT,{})
sets.midcast['Sleep'].Melee = set_combine(sets.midcast.DurationOnlyEnfeebling.Melee,{})
sets.midcast['Sleepga'] = set_combine(sets.midcast.DurationOnlyEnfeebling.INT,{})
sets.midcast['Sleepga'].Melee = set_combine(sets.midcast.DurationOnlyEnfeebling.Melee,{})
sets.midcast['Sleep II'] = set_combine(sets.midcast.DurationOnlyEnfeebling.INT,{})
sets.midcast['Sleep II'].Melee = set_combine(sets.midcast.DurationOnlyEnfeebling.Melee,{})
sets.midcast['Sleep'].Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant.INT, {})
sets.midcast['Sleepga'].Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant.INT, {})
sets.midcast['Sleep II'].Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant.INT, {})

sets.midcast.Bind = set_combine(sets.midcast.DurationOnlyEnfeebling.INT,{})
sets.midcast.Bind.Melee = set_combine(sets.midcast.DurationOnlyEnfeebling.Melee,{})
sets.midcast.Bind.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant.INT,{})
sets.midcast.Break = set_combine(sets.midcast.DurationOnlyEnfeebling.INT,{})
sets.midcast.Break.Melee = set_combine(sets.midcast.DurationOnlyEnfeebling.Melee,{})
sets.midcast.Break.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant.INT,{})

sets.midcast.Dispel = sets.midcast['Enfeebling Magic'].Resistant
sets.midcast.Dispel.Melee = sets.midcast['Enfeebling Magic']

sets.midcast['Dispelga'] = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {main="Daybreak"})
sets.midcast['Dispelga'].Melee = set_combine(sets.midcast['Enfeebling Magic'], {})

sets.midcast.SkillBasedEnfeebling = set_combine(sets.midcast['Enfeebling Magic'], {})

sets.midcast['Frazzle II'] = sets.midcast['Enfeebling Magic'].Resistant
sets.midcast['Frazzle II'].Melee = sets.midcast['Enfeebling Magic']
sets.midcast['Frazzle III'] = set_combine(sets.midcast.SkillBasedEnfeebling,{hands=gear.jse_empy_hands})
sets.midcast['Frazzle III'].Resistant = sets.midcast['Enfeebling Magic'].Resistant

sets.midcast['Distract II'] = sets.midcast['Enfeebling Magic'].Resistant
sets.midcast['Distract II'].Melee = sets.midcast['Enfeebling Magic']
sets.midcast['Distract III'] = set_combine(sets.midcast.SkillBasedEnfeebling,{hands=gear.jse_empy_hands,legs=gear.jse_empy_legs})
sets.midcast['Distract III'].Resistant = sets.midcast['Enfeebling Magic'].Resistant

sets.midcast['Gravity II'] = set_combine(sets.midcast['Enfeebling Magic'], {
	main="Bunzi's Rod",
})
sets.midcast['Gravity'] = set_combine(sets.midcast['Gravity II'], {})
sets.midcast['Gravity II'].Resistant = set_combine(sets.midcast['Gravity II'], {})
sets.midcast['Gravity'].Resistant = set_combine(sets.midcast['Gravity II'], {})

sets.midcast['Divine Magic'] = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})

--TH spells
sets.midcast.Dia = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
sets.midcast.Diaga = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
sets.midcast['Dia II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
sets.midcast['Dia III'] = set_combine(sets.midcast['Enfeebling Magic'])
sets.midcast['Dia III'].Resistant = set_combine(sets.midcast['Enfeebling Magic'], {ammo="Staunch Tathlum +1",neck="Loricate Torque +1",body="Shamash Robe",back="Null Shawl",feet=gear.jse_empy_feet})

sets.midcast.Bio = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
sets.midcast['Bio II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
sets.midcast['Bio III'] = set_combine(sets.midcast['Enfeebling Magic'], {head="Viti. Chapeau +3",waist="Chaac Belt",feet=gear.chironic_treasure_feet})

-- Store TP + Occult Acumen
sets.midcast.Impact = {
	main="Bunzi's Rod",
	sub="Ammurapi Shield",
	ammo="Ginsen",
	head=empty,
	body=gear.impact_body,
	hands=gear.jse_empy_hands,
	legs="Perdition Slops",				--30
	feet=gear.merlinic_occult_feet,		--11
	neck="Null Loop",
	waist="Oneiros Rope",				--20
	left_ear="Digni. Earring",
	right_ear="Crepuscular Earring",
	left_ring={name="Chirich Ring +1", bag="wardrobe3"},
	right_ring={name="Chirich Ring +1", bag="wardrobe4"},
	back="Null Shawl",
}

-- Elemental
sets.midcast['Elemental Magic'] = {
	main="Bunzi's Rod",
	sub="Ammurapi Shield",
	ammo="Ghastly Tathlum +1",
	head=gear.jse_empy_head,
	body=gear.jse_empy_body,
	hands=gear.jse_empy_hands,
	legs=gear.jse_empy_legs,
	feet=gear.jse_empy_feet,
	neck=gear.rdm_jse_neck,
	waist="Sacro Cord",
	left_ear="Regal Earring",
	right_ear="Malignance Earring",
	left_ring="Metamor. Ring +1",
	right_ring="Freke Ring",
	back=gear.jse_mab_back,
}
		
sets.midcast['Elemental Magic'].Resistant = set_combine(sets.midcast['Elemental Magic'], {})
		
sets.midcast['Elemental Magic'].HighTierNuke = set_combine(sets.midcast['Elemental Magic'], {})
sets.midcast['Elemental Magic'].HighTierNuke.Resistant = set_combine(sets.midcast['Elemental Magic'].Resistant, {})

-- Minimal damage gear, maximum recast gear for procs.
sets.midcast['Elemental Magic'].Proc = {
	main="Daybreak",
	sub="Genmei Shield",
	ammo=gear.dt_ammo,
	head="Befouled Crown",
	body="Shango Robe",
	hands="Shrieker's Cuffs",
	legs="Psycloth Lappas",
	feet="Vanya Clogs",
	neck="Incanter's Torque",
	waist="Luminary Sash",
	left_ear="Regal Earring",
	right_ear="Malignance Earring",
	left_ring="Metamor. Ring +1",
	right_ring=gear.stikini_ring,
	back=gear.jse_mab_back,
}

sets.midcast['Dark Magic'] = {
	main="Bunzi's Rod",
	sub="Ammurapi Shield",
	ammo="Pemphredo Tathlum",
	head="Pixie Hairpin +1",
	body="Atrophy Tabard +3",
	hands=gear.rdm_regal_hands,
	legs=gear.jse_empy_legs,
	feet=gear.jse_empy_feet,
	neck="Erra Pendant",
	waist="Fucho-no-obi",
	left_ear="Regal Earring",
	right_ear="Malignance Earring",
	left_ring="Evanescence Ring",
	right_ring="Archon Ring",
	back=gear.jse_mab_back,
}

sets.midcast.Drain = {
	main="Bunzi's Rod",
	sub="Ammurapi Shield",
	ammo="Pemphredo Tathlum",
	head=gear.jse_empy_head,
	body=gear.jse_empy_body,
	hands=gear.jse_empy_hands,
	legs=gear.jse_empy_legs,
	feet=gear.jse_empy_feet,
	neck="Null Loop",
	waist="Null Belt",
	left_ear="Regal Earring",
	right_ear=gear.empy_earring,
	left_ring="Evanescence Ring",	-- 10
	right_ring="Metamorph Ring +1",
	back="Null Shawl",
}
sets.midcast.Aspir = sets.midcast.Drain
	
sets.midcast.Stun = set_combine(sets.midcast['Enfeebling Magic'], {})
sets.midcast.Stun.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})

sets.midcast['Absorb-TP'] = {
	main="Bunzi's Rod",
	sub="Ammurapi Shield",
	ammo="Pemphredo Tathlum",
	head=gear.jse_empy_head,
	body=gear.jse_empy_body,
	hands=gear.jse_empy_hands,
	legs=gear.jse_empy_legs,
	feet=gear.jse_empy_feet,
	neck="Null Loop",
	waist="Null Belt",
	left_ear="Crep. Earring",
	right_ear=gear.empy_earring,
	left_ring=gear.stikini_ring,
	right_ring="Metamor. Ring +1",
	back="Null Shawl",
}

-- Sets for special buff conditions on spells.
sets.buff.Saboteur = {hands=gear.jse_empy_hands}
sets.buff.Stymie = {legs=gear.jse_empy_legs}
sets.buff.Doom = set_combine(sets.buff.Doom, {})

-- Idle sets
sets.idle = {
	main="Daybreak",
	sub="Genmei Shield",
	ammo="Homiliary",
	head={ name="Viti. Chapeau +3", augments={'Enfeebling Magic duration','Magic Accuracy',}},
	body=gear.idle_body,
	hands=gear.chironic_refresh_hands,
	legs="Nyame Flanchard",
	feet=gear.chironic_refresh_feet,
	neck="Sanctity Necklace",
	waist="Null Belt",
	left_ear="Infused Earring",
	right_ear="Etiolation Earring",
	left_ring={name="Defending Ring",priority=50},
	right_ring=gear.stikini_ring,
	back=gear.jse_macc_back,
}

sets.idle.DT = {
	main="Daybreak",
	sub="Genmei Shield",																		-- 10
	ammo="Homiliary",
	head={ name="Viti. Chapeau +3", augments={'Enfeebling Magic duration','Magic Accuracy',}},
	body=gear.idle_body,																		-- 14
	hands=gear.chironic_refresh_hands,
	legs="Nyame Flanchard",
	feet=gear.chironic_refresh_feet,
	neck="Sanctity Necklace",
	waist="Null Belt",
	left_ear="Infused Earring",
	right_ear="Etiolation Earring",
	left_ring={name="Defending Ring",priority=50},												-- 10
	right_ring=gear.stikini_ring,
	back=gear.jse_macc_back,																	-- 10
}

sets.idle.Town = {
	main="Murgleis",
	sub="Crocea Mors",
	ammo="Homiliary",
	head={ name="Viti. Chapeau +3", augments={'Enfeebling Magic duration','Magic Accuracy',}},
	body="Shamash Robe",
	hands="Nyame Gauntlets",
	legs="Carmine Cuisses +1",
	feet="Nyame Sollerets",
	neck=gear.rdm_jse_neck,
	waist="Obstin. Sash",
	left_ear="Telos Earring",
	right_ear="Crepuscular Earring",
	left_ring="Metamor. Ring +1",
	right_ring=gear.stikini_ring,
	back=gear.jse_macc_back,
}

-- Defense sets
sets.defense.PDT = {
	ammo=gear.dt_ammo,
	head="Nyame Helm",
	body="Adamantite Armor",
	hands="Nyame Gauntlets",
	legs="Nyame Flanchard",
	feet="Nyame Sollerets",
	neck="Loricate Torque +1",
	waist=gear.dt_waist,
	left_ear="Infused Earring",
	right_ear="Etiolation Earring",
	left_ring="Defending Ring",
	right_ring="Gelatinous Ring +1",
	back=gear.dt_moon_back,
}

sets.defense.MDT = sets.defense.PDT
sets.defense.MEVA = sets.defense.PDT

sets.Kiting = {legs="Carmine Cuisses +1"}
sets.latent_refresh = {waist="Fucho-no-obi"}
sets.latent_refresh_grip = {}
sets.TPEat = {}
sets.DayIdle = {}
sets.NightIdle = {}

sets.rollerRing = {left_ring="Roller's Ring"}
sets.buff.Sublimation = {waist="Embla Sash"}
sets.buff.DTSublimation = {waist="Embla Sash"}

-- Engaged sets
sets.engaged = {
	ammo="Coiste Bodhar",
	head="Bunzi's Hat",
	body="Malignance Tabard",
	hands="Malignance Gloves",
	legs="Malignance Tights",
	feet="Malignance Boots",
	neck="Combatant's Torque",
	waist="Windbuffet Belt +1",
	left_ear="Sherida Earring",
	right_ear=gear.empy_earring,
	left_ring="Chirich Ring +1",
	right_ring="Ilabrat Ring",
	back=gear.jse_da_back,
}
	
sets.engaged.DW = set_combine(sets.engaged, {waist="Reiki Yotai", right_ear="Suppanomimi"})		
