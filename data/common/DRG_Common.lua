if item_available("Pel. Earring +2") then
	gear.empy_earring = "Pel. Earring +2"
elseif item_available("Pel. Earring +1") then
	gear.empy_earring = "Pel. Earring +1"
else
	gear.empy_earring = "Pel. Earring"
end

if item_available("Pel. Vambraces +3") then
	gear.jse_empy_hands = "Pel. Vambraces +3"
elseif item_available("Pel. Vambraces +2") then
	gear.jse_empy_hands = "Pel. Vambraces +2"
else
	gear.jse_empy_hands = "Pel. Vambraces +1"
end

if item_available("Pelt. Cuissots +3") then
	gear.jse_empy_legs = "Pelt. Cuissots +3"
elseif item_available("Pelt. Cuissots +2") then
	gear.jse_empy_legs = "Pelt. Cuissots +2"
else
	gear.jse_empy_legs = "Pelt. Cuissots +1"
end

if item_available("Pelt. Schyn. +3") then
	gear.jse_empy_feet = "Pelt. Schyn. +3"
elseif item_available("Pelt. Schyn. +2") then
	gear.jse_empy_feet = "Pelt. Schyn. +2"
else
	gear.jse_empy_feet = "Pelt. Schyn. +1"
end



-- Weapons sets
sets.weapons.Trishula = {main="Trishula",sub="Utu Grip"}
sets.weapons.GaeBuide = {main="Gae Buide",sub="Utu Grip"}
sets.weapons.ShiningOne = {main="Shining One",sub="Utu Grip"}
sets.weapons.Malignance = {main="Malignance Pole",sub="Utu Grip"}
sets.weapons.Naegling = {main="Naegling",sub="Legion Scutum"}
sets.weapons.DualSavage = {main="Naegling",sub="Kraken Club"}


-- Precast Sets
sets.precast.JA.Angon = {ammo="Angon", hands="Ptero. Fin. G. +3"}
sets.precast.JA['Ancient Circle'] = {legs="Vishap Brais +3"}

sets.precast.Jump = {
	ammo="Coiste Bodhar",
	head="Hjarrandi Helm",
	body="Ptero. Mail +3",
	hands="Vis. Fng. Gaunt. +3",
	legs="Ptero. Brais +3",
	feet=gear.jse_empy_feet,
	neck="Dgn. Collar +2",
	waist="Ioskeha Belt +1",
	left_ear="Sherida Earring",
	right_ear=gear.empy_earring,
	left_ring="Petrov Ring",
	right_ring="Niqmaddu Ring",
	back=gear.TPBack,
}
sets.precast.JA['High Jump'] = set_combine(sets.precast.Jump, {})
sets.precast.JA['Spirit Jump'] = set_combine(sets.precast.Jump, {legs=gear.jse_empy_legs, feet=gear.jse_empy_feet})
sets.precast.JA['Soul Jump'] = set_combine(sets.precast.Jump, {legs=gear.jse_empy_legs, body="Vishap Mail +3"})

sets.precast.JA['Super Jump'] = {}
sets.precast.JA['Spirit Link'] = {head="Vishap Armet +3", hands=gear.jse_empy_hands, feet="Ptero. Greaves +3"}
sets.precast.JA['Call Wyvern'] = {body="Ptero. Mail +3", neck="Dgn. Collar +2", right_ear=gear.empy_earring}
sets.precast.JA['Deep Breathing'] = {} 
sets.precast.JA['Spirit Surge'] = {body="Ptero. Mail +3"}
sets.precast.JA['Steady Wing'] = {legs="Vishap Brais +3", feet="Ptero. Greaves +3"}

-- Breath sets
sets.precast.JA['Restoring Breath'] = {head="Ptero. Armet +3", legs="Vishap Brais +3", feet="Ptero. Greaves +3", neck="Dgn. Collar +2", back="Brigantia's Mantle"}
sets.precast.JA['Smiting Breath'] = {back="Brigantia's Mantle"}
sets.HealingBreath = {back="Brigantia's Mantle"}
sets.SmitingBreath = {back="Brigantia's Mantle"}

-- Fast cast sets for spells

sets.precast.FC = {
	ammo="Impatiens",
	head="Carmine Mask +1",
	neck="Baetyl Pendant",
	ear2="Loquacious Earring",
	hands="Leyline Gloves",
	ring1="Medada's Ring",
	feet="Carmine Greaves +1"
}

-- Waltz set (chr and vit)
sets.precast.Waltz = {}
	
-- Don't need any special gear for Healing Waltz.
sets.precast.Waltz['Healing Waltz'] = {}

sets.midcast.Cure = {}

sets.Self_Healing = {waist="Gishdubar Sash"}
sets.Cure_Received = {waist="Gishdubar Sash"}
sets.Self_Refresh = {waist="Gishdubar Sash"}

-- Midcast Sets
sets.midcast.FastRecast = sets.precast.FC
	
-- Put HP+ gear and the AF head to make healing breath trigger more easily with this set.
sets.midcast.HB_Trigger = set_combine(sets.midcast.FastRecast, {head="Vishap Armet +3"})

-- Weaponskill sets

-- WS with WSD
-- 52% WSD
sets.precast.WS = {
	ammo="Knobkierrie",
	head="Nyame Helm",
	body="Nyame Mail",
	hands="Nyame Gauntlets",
	legs="Nyame Flanchard",
	feet="Nyame Sollerets",
	neck="Dgn. Collar +2",
	waist={ name="Sailfi Belt +1", augments={'Path: A',}},
	left_ear="Thrud Earring",
	right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
	left_ring="Regal Ring",
	right_ring="Beithir Ring",
	back=gear.jse_wsd_back,
}
	
sets.precast.WS.SubtleBlow = set_combine(sets.precast.WS, {
    left_ear="Sherida Earring",
	right_ring="Niqmaddu Ring",
})
sets.precast.WS.KI = set_combine(sets.precast.WS, {body="Found. Breastplate"})
sets.precast.WS.KI.SubtleBlow = set_combine(sets.precast.WS.SubtleBlow, {body="Found. Breastplate"})

sets.precast.WS['Savage Blade'] = set_combine(sets.precast.WS, {})
sets.precast.WS['Savage Blade'].SubtleBlow = set_combine(sets.precast.WS.SubtleBlow, {})
sets.precast.WS['Savage Blade'].KI = set_combine(sets.precast.WS.KI, {})
sets.precast.WS['Savage Blade'].KI.SubtleBlow = set_combine(sets.precast.WS.KI.SubtleBlow, {})

-- Stardiver - DA%
sets.precast.WS['Stardiver'] = {
	ammo="Coiste Bodhar",
	head="Ptero. Armet +3",
	body="Gleti's Cuirass",
	hands="Nyame Gauntlets",
	legs="Nyame Flanchard",
	feet="Nyame Sollerets",
	neck="Dgn. Collar +2",
	waist="Fotia Belt",
	left_ear="Sherida Earring",
	right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
	left_ring="Regal Ring",
	right_ring="Niqmaddu Ring",
	back=gear.jse_str_back,	
}

sets.precast.WS['Impulse Drive'] = {
	ammo="Knobkierrie",
	head="Ptero. Armet +3",
	body="Gleti's Cuirass",
	hands="Nyame Gauntlets",
	legs=gear.jse_empy_legs,
	feet="Nyame Sollerets",
	neck="Dgn. Collar +2",
	waist={ name="Sailfi Belt +1", augments={'Path: A',}},
	left_ear="Sherida Earring",
	right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
	left_ring="Regal Ring",
	right_ring="Niqmaddu Ring",
	back=gear.jse_str_back,	
}

sets.precast.WS['Drakesbane'] = {
	ammo="Coiste Bodhar",
	head="Ptero. Armet +3",
	body="Gleti's Cuirass",
	hands="Gleti's Gauntlets",
	legs=gear.jse_empy_legs,
	feet="Nyame Sollerets",
	neck="Dgn. Collar +2",
	waist={ name="Sailfi Belt +1", augments={'Path: A',}},
	left_ear="Sherida Earring",
	right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
	left_ring="Regal Ring",
	right_ring="Niqmaddu Ring",
	back=gear.jse_str_back,	
}

sets.precast.WS['Sonic Thrust'] = set_combine(sets.precast.WS, {
	left_ring="Regal Ring",
	right_ring="Niqmaddu Ring",
})


-- Idle sets
-- 40% DT/PDT
sets.idle = {
	ammo="Staunch Tathlum +1",																		-- 3%
    head="Crepuscular Helm",
    body="Crepuscular Mail",
    hands="Gleti's Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
	neck="Dgn. Collar +2",
	waist="Flume Belt +1",																			-- 4%
	left_ear="Infused Earring",
	right_ear=gear.empy_earring,
	left_ring="Defending Ring",																		-- 10%
	right_ring="Gelatinous Ring +1",
	back=gear.jse_da_back,																			-- 10%
}

sets.idle.DT = set_combine(sets.idle, {
	hands="Nyame Gauntlets",
})

sets.idle.Town = sets.idle
	
sets.idle.Refresh = set_combine(sets.idle, {
	head="Nyame Helm",
	body="Crepuscular Mail",
	hands="Nyame Gauntlets",
	legs="Nyame Flanchard",
	right_ring=gear.stikini_ring,
})

-- Defense sets
sets.defense.PDT = {
	ammo="Staunch Tathlum +1",
	head="Nyame Helm",
	body="Adamantite Armor",
	hands="Nyame Gauntlets",
	legs="Nyame Flanchard",
	feet="Nyame Sollerets",
	neck="Dgn. Collar +2",
	waist="Flume Belt +1",
	left_ear="Etiolation Earring",
	right_ear="Odnowa Earring +1",
	left_ring="Defending Ring",
	right_ring="Gelatinous Ring +1",
	back=gear.dt_moon_back,
}
	
sets.defense.MDT = sets.defense.PDT 
sets.defense.MEVA = sets.defense.PDT 

sets.resting = sets.defense.PDT
sets.idle.Weak = sets.defense.PDT

sets.Kiting = {legs="Carmine Cuisses +1"}
sets.Reraise = {}
sets.buff.Doom = set_combine(sets.buff.Doom, {})

-- Extra defense sets.  Apply these on top of melee or defense sets.
sets.TreasureHunter = set_combine(sets.TreasureHunter, {})

-- Swap to these on Moonshade using WS if at 3000 TP
sets.MaxTP = {}
sets.AccMaxTP = {}
sets.AccDayMaxTPWSEars = {}
sets.DayMaxTPWSEars = {}
sets.AccDayWSEars = {}
sets.DayWSEars = {}

-- Engaged sets

--1282 ACC
--40% DA
--46% PDT/DT
--379 MEVA
sets.engaged = {
	ammo="Hesperiidae",
	head="Hjarrandi Helm",
	body="Gleti's Cuirass",
	hands=gear.jse_empy_hands,
	legs=gear.jse_empy_legs,
	feet=gear.jse_empy_feet,
	neck="Dgn. Collar +2",
	waist="Ioskeha Belt +1",
	left_ear="Sherida Earring",
	right_ear=gear.empy_earring,
	left_ring="Chirich Ring +1",
	right_ring="Niqmaddu Ring",
	back=gear.jse_da_back,
}

-- Pet LV 1+ / -33 DT
-- 49 DT/PDT
-- 1264 ACC
-- 599 MEVA
sets.engaged.DT = {
	ammo="Hesperiidae",
	head="Nyame Helm",
	body="Gleti's Cuirass",
	hands="Gleti's Gauntlets",
	legs="Nyame Flanchard",
	feet="Nyame Sollerets",
	neck="Dgn. Collar +2",
	waist="Ioskeha Belt +1",
	left_ear="Sherida Earring",
	right_ear=gear.empy_earring,
	left_ring="Moonlight Ring",
	right_ring="Niqmaddu Ring",
	back=gear.jse_da_back,		
}

sets.engaged.AM = sets.engaged
sets.engaged.AM.DT = sets.engaged.DT

sets.engaged.DW = set_combine(sets.engaged, {waist="Reiki Yotai", left_ear="Suppanomimi"})
sets.engaged.DW.DT = set_combine(sets.engaged.DT, {waist="Reiki Yotai", left_ear="Suppanomimi"})
