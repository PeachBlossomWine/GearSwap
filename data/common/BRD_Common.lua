--Weapons
if item_available("Carnwenhan") then
	gear.song_dagger = "Carnwenhan"
	gear.town_dagger = "Carnwenhan"
else
	gear.song_dagger = "Kali"
	gear.town_dagger = "Aeneas"
end

--Idle body
if item_available("Annoint. Kalasiris") then
	gear.idle_body = "Annoint. Kalasiris"
else
	gear.idle_body = "Inyanga Jubbah +2"
end

--Melee body
if item_available("Ashera Harness") then
	gear.melee_body = "Ashera Harness"
else
	gear.melee_body = "Nyame Mail"
end
 
--Empy
if item_available("Fili Calot +3") then
	gear.jse_empy_head = "Fili Calot +3"
elseif item_available("Fili Calot +2") then
	gear.jse_empy_head = "Fili Calot +2"
else
	gear.jse_empy_head = "Fili Calot +1"
end

if item_available("Fili Hongreline +3") then
	gear.jse_empy_body = "Fili Hongreline +3"
elseif item_available("Fili Hongreline +2") then
	gear.jse_empy_body = "Fili Hongreline +2"
else
	gear.jse_empy_body = "Fili Hongreline +1"
end

if item_available("Fili Manchettes +3") then
	gear.jse_empy_hands = "Fili Manchettes +3"
elseif item_available("Fili Manchettes +2") then
	gear.jse_empy_hands = "Fili Manchettes +2"
else
	gear.jse_empy_hands = "Fili Manchettes +1"
end

if item_available("Fili Rhingrave +3") then
	gear.jse_empy_legs = "Fili Rhingrave +3"
elseif item_available("Fili Rhingrave +2") then
	gear.jse_empy_legs = "Fili Rhingrave +2"
else
	gear.jse_empy_legs = "Fili Rhingrave +1"
end

if item_available("Fili Cothurnes +3") then
	gear.jse_empy_feet = "Fili Cothurnes +3"
elseif item_available("Fili Cothurnes +2") then
	gear.jse_empy_feet = "Fili Cothurnes +2"
else
	gear.jse_empy_feet = "Fili Cothurnes +1"
end

--JSE

if item_available("Mousai Turban +1") then
	gear.jse_brd_head = "Mousai Turban +1"
else
	gear.jse_brd_head = "Mousai Turban"
end

if item_available("Mousai Manteel +1") then
	gear.jse_brd_body = "Mousai Manteel +1"
else
	gear.jse_brd_body = "Mousai Manteel"
end

if item_available("Mousai Seraweels +1") then
	gear.jse_brd_legs = "Mousai Seraweels +1"
else
	gear.jse_brd_legs = "Mousai Seraweels"
end

if item_available("Mousai Gages +1") then
	gear.jse_brd_hands = "Mousai Gages +1"
else
	gear.jse_brd_hands = "Mousai Gages"
end

if item_available("Fili Earring +2") then
	gear.empy_earring = "Fili. Earring +2"
elseif item_available("Fili Earring +1") then
	gear.empy_earring = "Fili Earring +1"
elseif item_available("Fili Earring") then
	gear.empy_earring = "Fili Earring"
else
	gear.empy_earring = "Crep. Earring"
end

-- Weapons sets
sets.weapons.Aeneas = {main="Aeneas",sub="Genmei Shield"}
sets.weapons.Carnwenhan = {main=gear.song_dagger,sub="Genmei Shield"}
sets.weapons.Naegling = {main="Naegling",sub="Genmei Shield"}
sets.weapons.MpuGandring = {main="Mpu Gandring",sub="Genmei Shield"}
sets.weapons.DualAeneas = {main="Aeneas",sub="Crepuscular Knife"}
sets.weapons.DualCarn = {main=gear.song_dagger,sub="Crepuscular Knife"}
sets.weapons.DualSavage = {main="Naegling", sub="Crepuscular Knife"}
-- Precast Sets

-- 78%
-- Fast cast sets for spells
sets.precast.FC = {
	--range="Gjallarhorn",
	head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},				-- 10
	body="Inyanga Jubbah +2",																-- 14
	hands="Gende. Gages +1",																-- 7
	legs="Aya. Cosciales +2",																-- 6
	feet=gear.jse_empy_feet,																-- 10
	neck="Baetyl Pendant",																	-- 4
	waist="Embla Sash",																		-- 5
	left_ear="Loquacious Earring",															-- 2
	right_ear="Etiolation Earring",															-- 1
	left_ring=gear.weather_ring,															-- 6
	right_ring="Lebeche Ring",
	back=gear.jse_back,																		-- 10
}

sets.precast.FC.Cure = set_combine(sets.precast.FC, {})
sets.precast.FC.Stoneskin = set_combine(sets.precast.FC, {})
sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})

-- 86% Song + FC combined
sets.precast.FC.BardSong = set_combine(sets.precast.FC, {
	head=gear.jse_empy_head,   												-- 14
	body="Brioso Justau. +3",													-- 15
})

sets.precast.FC.BardSong.Tank = set_combine(sets.precast.FC, {
	waist={name="Plat. Mog. Belt",priority=500},
	left_ear={name="Odnowa Earring +1",priority=500},
	right_ear={name="Tuisto Earring",priority=500},
	right_ring={name="Gelatinous Ring +1",priority=500},
	back={name="Moonbeam Cape",priority=500},
})

sets.precast.FC.Daurdabla = set_combine(sets.precast.FC.BardSong, {range=info.ExtraSongInstrument})
sets.precast.FC["Honor March"] = set_combine(sets.precast.FC.BardSong, {range="Marsyas"})
sets.precast.FC["Aria of Passion"] = set_combine(sets.precast.FC.BardSong, {range="Loughnashade"})

sets.precast.FC.Daurdabla.Melee = set_combine(sets.precast.FC.BardSong, {range=info.ExtraSongInstrument})
sets.precast.FC["Honor March"].Melee = set_combine(sets.precast.FC.BardSong, {range="Marsyas"})
sets.precast.FC["Aria of Passion"].Melee = set_combine(sets.precast.FC.BardSong, {range="Loughnashade"})

-- Precast sets to enhance JAs

sets.precast.JA['Nightingale'] = {feet="Bihu Slippers +3"}
sets.precast.JA['Troubadour'] = {body="Bihu Justaucorps +3"}
sets.precast.JA['Soul Voice'] = {legs="Bihu Cannions +2"}

-- Waltz set (chr and vit)
sets.precast.Waltz = {}
	
sets.precast.FC['Dispelga'] = set_combine(sets.precast.FC, {main="Daybreak"})

   
-- Weaponskill sets
-- Default set for any weaponskill that isn't any more specifically defined
sets.precast.WS = {
	range=gear.wsd_linos,																		-- 3
	head="Nyame Helm",
	body="Nyame Mail",					-- 10%
	hands="Nyame Gauntlets",
	legs="Nyame Flanchard",
	feet="Nyame Sollerets",
	neck=gear.brd_jse_neck,
	waist="Fotia Belt",
	left_ear="Ishvara Earring",			    -- 2%
	right_ear="Moonshade Earring",
	left_ring="Ilabrat Ring",
	right_ring="Rufescent Ring",			-- 3%
	back=gear.wsd_back,					    -- 10%
}

-- 20 SB
sets.precast.WS.SubtleBlow = set_combine(sets.precast.WS, {
	waist="Sarissapho. Belt",
    left_ear="Digni. Earring",
	right_ring="Chirich Ring +1",
})

sets.precast.WS['Rudra\'s Storm'] = {
	range=gear.wsd_linos,
	head="Nyame Helm",
	body="Nyame Mail",	
	hands="Nyame Gauntlets",
	legs="Nyame Flanchard",
	feet="Nyame Sollerets",
	neck=gear.brd_jse_neck,
	waist="Fotia Belt",
	left_ear="Ishvara Earring",
	right_ear="Moonshade Earring",
	left_ring="Ilabrat Ring",
	right_ring="Rufescent Ring",
	back=gear.wsd_back,
}

-- 20 SB
sets.precast.WS['Rudra\'s Storm'].SubtleBlow = set_combine(sets.precast.WS['Rudra\'s Storm'] , {
	waist="Sarissapho. Belt",
    left_ear="Digni. Earring",
	right_ring="Chirich Ring +1",
})


sets.precast.WS['Savage Blade'] = {
	range=gear.wsd_str_linos,
	head="Nyame Helm",
	body="Nyame Mail",	
	hands="Nyame Gauntlets",
	legs="Nyame Flanchard",
	feet="Nyame Sollerets",
	neck=gear.brd_jse_neck,
	waist="Sailfi Belt +1",
	left_ear="Ishvara Earring",
	right_ear="Moonshade Earring",
	left_ring="Ilabrat Ring",
	right_ring="Rufescent Ring",
	back=gear.wsd_str_back,
}

-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.

sets.precast.WS['Evisceration'] = set_combine(sets.precast.WS)
sets.precast.WS['Mordant Rime'] = set_combine(sets.precast.WS)

sets.precast.WS['Aeolian Edge'] = {
	range=gear.wsd_linos,
	head="Nyame Helm",
	body="Nyame Mail",
	hands="Nyame Gauntlets",
	legs="Nyame Flanchard",
	feet="Nyame Sollerets",
	neck="Sanctity Necklace",
	waist="Eschan Stone",
	left_ear="Regal Earring",
	right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',},priority=1},
	left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
	right_ring="Medada's Ring",
	back=gear.wsd_mab_back,
}

-- Midcast Sets

-- General set for recast times.
sets.midcast.FastRecast = sets.precast.FC
	
-- dummy songs:
sets.DummySong = {
	range=info.ExtraSongInstrument,
	--main="Aeneas",
	head="Nyame Helm",
	body="Nyame Mail",
	hands="Nyame Gauntlets",
	legs="Nyame Flanchard",
	feet="Nyame Sollerets",
	neck="Sanctity Necklace", 
}

sets.midcast["Puppet's Operetta"] =	sets.DummySong
sets.midcast["Scop's Operetta"] = sets.DummySong
sets.midcast["Goblin Gavotte"] = sets.DummySong
sets.midcast["Shining Fantasia"] = sets.DummySong

-- For song buffs (duration and AF3 set bonus)
sets.midcast.SongEffect = {
	main=gear.song_dagger,
	sub="Genmei Shield",					-- 10
	range="Gjallarhorn",
	head=gear.jse_empy_head,
	body=gear.jse_empy_body,
	hands=gear.jse_empy_hands,
	legs="Inyanga Shalwar +2",
	feet="Brioso Slippers +3",
	neck=gear.brd_potency_neck,
	waist=gear.dt_waist,					-- 4
	left_ear="Odnowa Earring +1",			-- 3
	right_ear="Genmei Earring",				-- 2
	left_ring="Defending Ring",				-- 10
	right_ring="Gelatinous Ring +1",		-- 7
	back=gear.jse_back,						-- 10
}

sets.midcast.SongEffect.Melee = {
	main=gear.song_dagger,
	range="Gjallarhorn",
	head=gear.jse_empy_head,
	body=gear.jse_empy_body,
	hands=gear.jse_empy_hands,
	legs="Inyanga Shalwar +2",
	feet="Brioso Slippers +3",
	neck=gear.brd_potency_neck,
	waist=gear.dt_waist,					-- 4
	left_ear="Odnowa Earring +1",			-- 3
	right_ear="Genmei Earring",				-- 2
	left_ring="Defending Ring",				-- 10
	right_ring="Gelatinous Ring +1",		-- 7
	back=gear.jse_back,						-- 10	
}

sets.midcast.SongEffect.Pianissimo = {
	main=gear.song_dagger,
	range="Gjallarhorn",
	head=gear.jse_empy_head,
	body=gear.jse_empy_body,
	hands=gear.jse_empy_hands,
	legs="Inyanga Shalwar +2",
	feet="Brioso Slippers +3",
	neck=gear.brd_potency_neck,
	waist=gear.dt_waist,					-- 4
	left_ear="Odnowa Earring +1",			-- 3
	right_ear="Genmei Earring",				-- 2
	left_ring="Defending Ring",				-- 10
	right_ring="Gelatinous Ring +1",		-- 7
	back=gear.jse_back,						-- 10	
}

-- Gear to enhance certain classes of songs.  No instruments added here since Gjallarhorn is being used.
sets.midcast.Ballad = set_combine(sets.midcast.SongEffect, {}) --{legs=gear.jse_empy_legs})
sets.midcast.Madrigal = set_combine(sets.midcast.SongEffect, {head=gear.jse_empy_head})
sets.midcast.March = set_combine(sets.midcast.SongEffect, {hands=gear.jse_empy_hands})
sets.midcast.Minuet = set_combine(sets.midcast.SongEffect, {body=gear.jse_empy_body})
sets.midcast.Minne = set_combine(sets.midcast.SongEffect, {legs=gear.jse_brd_legs})
sets.midcast.Etude = set_combine(sets.midcast.SongEffect, {head=gear.jse_brd_head, feet=gear.jse_empy_feet})
sets.midcast.Paeon = set_combine(sets.midcast.SongEffect, {head="Brioso Roundlet +3"})
sets.midcast.Carol = set_combine(sets.midcast.SongEffect, {head=gear.jse_empy_head, hands=gear.jse_brd_hands})
sets.midcast["Sentinel's Scherzo"] = set_combine(sets.midcast.SongEffect, {feet=gear.jse_empy_feet})
sets.midcast.Mazurka = {range=info.ExtraSongInstrument}
sets.midcast["Honor March"] = set_combine(sets.midcast.SongEffect, {range="Marsyas"})
sets.midcast["Aria of Passion"] = set_combine(sets.midcast.SongEffect, {range="Loughnashade"})

sets.midcast.Ballad.Melee = set_combine(sets.midcast.SongEffect.Melee, {}) --{legs=gear.jse_empy_legs})
sets.midcast.Madrigal.Melee = set_combine(sets.midcast.SongEffect.Melee, {head=gear.jse_empy_head})
sets.midcast.March.Melee = set_combine(sets.midcast.SongEffect.Melee, {hands=gear.jse_empy_hands})
sets.midcast.Minuet.Melee = set_combine(sets.midcast.SongEffect.Melee, {body=gear.jse_empy_body})
sets.midcast.Minne.Melee = set_combine(sets.midcast.SongEffect.Melee, {legs=gear.jse_brd_legs})
sets.midcast.Etude.Melee = set_combine(sets.midcast.SongEffect.Melee, {head=gear.jse_brd_head, feet=gear.jse_empy_feet})
sets.midcast.Paeon.Melee = set_combine(sets.midcast.SongEffect.Melee, {head="Brioso Roundlet +3"})
sets.midcast.Carol.Melee = set_combine(sets.midcast.SongEffect.Melee, {head=gear.jse_empy_head, hands=gear.jse_brd_hands})
sets.midcast["Sentinel's Scherzo"].Melee = set_combine(sets.midcast.SongEffect.Melee, {feet=gear.jse_empy_feet})
sets.midcast.Mazurka.Melee = {range=info.ExtraSongInstrument}
sets.midcast["Honor March"].Melee = set_combine(sets.midcast.SongEffect.Melee, {range="Marsyas"})	
sets.midcast["Aria of Passion"].Melee = set_combine(sets.midcast.SongEffect, {range="Loughnashade"})

sets.midcast.Ballad.Pianissimo = set_combine(sets.midcast.SongEffect.Pianissimo, {}) --{legs=gear.jse_empy_legs})
sets.midcast.Madrigal.Pianissimo = set_combine(sets.midcast.SongEffect.Pianissimo, {head=gear.jse_empy_head})
sets.midcast.March.Pianissimo = set_combine(sets.midcast.SongEffect.Pianissimo, {hands=gear.jse_empy_hands})
sets.midcast.Minuet.Pianissimo = set_combine(sets.midcast.SongEffect.Pianissimo, {body=gear.jse_empy_body})
sets.midcast.Minne.Pianissimo = set_combine(sets.midcast.SongEffect.Pianissimo, {legs=gear.jse_brd_legs})
sets.midcast.Etude.Pianissimo = set_combine(sets.midcast.SongEffect.Pianissimo, {head=gear.jse_brd_head, feet=gear.jse_empy_feet})
sets.midcast.Paeon.Pianissimo = set_combine(sets.midcast.SongEffect.Pianissimo, {head="Brioso Roundlet +3"})
sets.midcast.Carol.Pianissimo = set_combine(sets.midcast.SongEffect.Pianissimo, {head=gear.jse_empy_head, hands=gear.jse_brd_hands})
sets.midcast["Sentinel's Scherzo"].Pianissimo = set_combine(sets.midcast.SongEffect.Pianissimo, {feet=gear.jse_empy_feet})
sets.midcast.Mazurka.Pianissimo = {range=info.ExtraSongInstrument}
sets.midcast["Honor March"].Pianissimo = set_combine(sets.midcast.SongEffect.Pianissimo, {range="Marsyas"})
sets.midcast["Aria of Passion"].Pianissimo = set_combine(sets.midcast.SongEffect.Pianissimo, {range="Loughnashade"})	

-- For song defbuffs (duration primary, accuracy secondary)
sets.midcast.SongDebuff = {
	main=gear.song_dagger,
	sub="Ammurapi Shield",
	range="Gjallarhorn",
	head="Brioso Roundlet +3",
	body=gear.jse_empy_body,
	hands=gear.jse_empy_hands,
	legs=gear.jse_empy_legs,
	feet="Brioso Slippers +3",
	neck=gear.brd_potency_neck,
	waist="Obstin. Sash",
	left_ear="Regal Earring",
	right_ear=gear.empy_earring,
	left_ring="Metamorph Ring +1",
	right_ring=gear.weather_ring,
	back=gear.jse_back,
}

sets.midcast.Lullaby = set_combine(sets.midcast.SongDebuff, {
	range=info.ExtraSongInstrument, 
	hands="Brioso Cuffs +3",
})

sets.midcast.Threnody = set_combine(sets.midcast.SongDebuff, {
	body=gear.jse_brd_body,
})

sets.midcast.SongDebuff.Melee = {
	main=gear.song_dagger,
	range="Gjallarhorn",
	head="Brioso Roundlet +3",
	body=gear.jse_empy_body,
	hands=gear.jse_empy_hands,
	legs=gear.jse_empy_legs,
	feet="Brioso Slippers +3",
	neck=gear.brd_potency_neck,
	waist="Obstin. Sash",
	left_ear="Regal Earring",
	right_ear=gear.empy_earring,
	left_ring="Metamorph Ring +1",
	right_ring=gear.weather_ring,
	back=gear.jse_back,
}

sets.midcast.SongDebuff.Tank = {
    main="Daybreak",
    sub="Genmei Shield",
    range={ name="Terpander", augments={'HP+30','Mag. Acc.+10','Damage Taken -3%',}},
    head={ name="Nyame Helm", augments={'Path: B',}},
    body="Fili Hongreline +3",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Fili Cothurnes +3",
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Plat. Mog. Belt",
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    right_ear="Etiolation Earring",
    left_ring="Defending Ring",
    right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
    back="Moonbeam Cape",
}

sets.midcast.Lullaby.Melee = set_combine(sets.midcast.SongDebuff.Melee, {
	range=info.ExtraSongInstrument, 
	hands="Brioso Cuffs +3",
})

sets.midcast.Lullaby.Tank = {
    main="Daybreak",
    sub="Genmei Shield",
    range={ name="Terpander", augments={'HP+30','Mag. Acc.+10','Damage Taken -3%',}},
    head={ name="Nyame Helm", augments={'Path: B',}},
    body="Fili Hongreline +3",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Fili Cothurnes +3",
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Plat. Mog. Belt",
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    right_ear="Etiolation Earring",
    left_ring="Defending Ring",
    right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
    back="Moonbeam Cape",
}

sets.midcast.Threnody.Melee = set_combine(sets.midcast.SongDebuff.Melee, {
	body=gear.jse_brd_body,
})

-- Song-specific recast reduction
sets.midcast.SongRecast = {}

-- Cast spell with normal gear, except using Daurdabla instead
sets.midcast.Daurdabla = {range=info.ExtraSongInstrument}

-- Dummy song with Daurdabla; minimize duration to make it easy to overwrite.
sets.midcast.DaurdablaDummy = sets.DummySong

-- Other general spells and classes.
sets.midcast['Dispelga'] = set_combine(sets.midcast.SongDebuff, {main="Daybreak"})

-- Duration gear
-- 70%
sets.midcast['Enhancing Magic'] = {
	main="Daybreak",
	sub="Ammurapi Shield",															-- 10%
	head=gear.telchine_enhancing_head,												-- 8%
	body=gear.telchine_enhancing_body,												-- 8%
	hands=gear.telchine_enhancing_hands,											-- 10%
	legs=gear.telchine_enhancing_legs,												-- 8%
	feet=gear.telchine_enhancing_feet,												-- 10%
	waist="Embla Sash",																-- 10%
	left_ear="Genmei Earring",
	right_ear="Etiolation Earring",
	left_ring="Defending Ring",
	right_ring="Gelatinous Ring +1",
}

sets.midcast['Enhancing Magic'].Melee = {
	head=gear.telchine_enhancing_head,												-- 8%
	body=gear.telchine_enhancing_body,												-- 8%
	hands=gear.telchine_enhancing_hands,											-- 10%
	legs=gear.telchine_enhancing_legs,												-- 8%
	feet=gear.telchine_enhancing_feet,												-- 10%
	waist="Embla Sash",																-- 10%
	left_ear="Genmei Earring",
	right_ear="Etiolation Earring",
	left_ring="Defending Ring",
	right_ring="Gelatinous Ring +1",
}

sets.midcast['Enfeebling Magic'] = {
	main=gear.song_dagger,
	sub="Ammurapi Shield",
	range="Gjallarhorn",
	head="Brioso Roundlet +3",
	body="Brioso Justaucorps +3",
	hands="Brioso Cuffs +3",
	legs="Brioso Cannions +3",
	feet="Brioso Slippers +3",
	neck=gear.brd_potency_neck,
	waist="Obstin. Sash",
	left_ear="Dignitary's Earring",
	right_ear="Regal Earring",
	left_ring="Vertigo Ring",
	right_ring="Metamorph Ring +1",
	back=gear.jse_back,
}

sets.midcast['Enfeebling Magic'].Melee = {
	range="Gjallarhorn",
	head="Brioso Roundlet +3",
	body="Brioso Justaucorps +3",
	hands="Brioso Cuffs +3",
	legs="Brioso Cannions +3",
	feet="Brioso Slippers +3",
	neck=gear.brd_potency_neck,
	waist="Obstin. Sash",
	left_ear="Dignitary's Earring",
	right_ear="Regal Earring",
	left_ring="Vertigo Ring",
	right_ring="Metamorph Ring +1",
	back=gear.jse_back,
}

-- 53% Cure Potency
-- +20 Skill
sets.midcast.Cure = {
	main="Daybreak",								-- 30%
	sub="Ammurapi Shield",
	head="Vanya Hood",								-- 10%
	body="Nyame Mail",
	hands="Inyan. Dastanas +2",						-- 20 Skill
	legs="Nyame Flanchard",
	feet="Vanya Clogs",								-- 10% + Skill
	neck="Loricate Torque +1",
	waist=gear.dt_waist,
	left_ear="Mendi. Earring",						-- 5%
	right_ear="Regal Earring",
	left_ring="Defending Ring",
	right_ring="Lebeche Ring",						-- 3%
	back=gear.jse_back,
}

sets.midcast.Cure.Melee = {
	head="Vanya Hood",								-- 10%
	body="Annoint. Kalasiris",						-- 10%
	hands="Inyan. Dastanas +2",						-- 20 Skill
	legs="Nyame Flanchard",
	feet="Vanya Clogs",								-- 10% + Skill
	neck="Nodens Gorget",							-- 5%
	waist=gear.dt_waist,
	left_ear="Mendi. Earring",						-- 5%
	right_ear="Regal Earring",
	left_ring="Defending Ring",
	right_ring="Lebeche Ring",						-- 3%
	back="Solemnity Cape",							-- 7%
}

sets.midcast.Curaga = sets.midcast.Cure
sets.midcast.Curaga.Melee = sets.midcast.Cure.Melee
	
sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {})
sets.midcast.Stoneskin.Melee = set_combine(sets.midcast['Enhancing Magic'].Melee, {})
	
sets.midcast.Cursna = set_combine(sets.midcast.Cure, {
	neck="Debilis Medallion",
	ring1="Haoma's Ring"
})

sets.midcast.Cursna.Melee = set_combine(sets.midcast.Cure.Melee, {
	neck="Debilis Medallion",
	ring1="Haoma's Ring"
})

-- Idle sets
-- 11 MP Refresh
sets.idle = {
	main="Daybreak",						-- 1
	sub="Genmei Shield",
	range="Nibiru Harp",
	head=gear.chironic_refresh_head,		-- 2
	body="Annoint. Kalasiris",				-- 2
	hands=gear.chironic_refresh_hands,		-- 2
	legs=gear.chironic_refresh_legs,		-- 2
	feet=gear.jse_empy_feet,
	neck="Sanctity Necklace",
	waist=gear.dt_waist,
	left_ear="Infused Earring",
	right_ear="Etiolation Earring",
	left_ring="Defending Ring",
	right_ring="Gelatinous Ring +1",
	back=gear.tp_back,
}

sets.idle.Town = {
	main=gear.town_dagger,
	sub="Ammurapi Shield",
	range=info.ExtraSongInstrument,
	head="Nyame Helm",
	body="Nyame Mail",
	hands="Nyame Gauntlets",
	legs="Nyame Flanchard",
	feet="Nyame Sollerets",
	neck=gear.brd_potency_neck,
	waist=gear.dt_waist,
	left_ear="Dignitary's Earring",
	right_ear="Regal Earring",
	left_ring="Defending Ring",
	right_ring="Inyanga Ring",
	back=gear.jse_back,
}

-- 6 MP Refresh
-- 707 MEVA
-- 50 PDT/DT
sets.idle.DT = {
	main="Daybreak",
	sub="Genmei Shield",
	range="Nibiru Harp",
	head="Inyanga Tiara +2",
	body="Annoint. Kalasiris",
	hands="Nyame Gauntlets",
	legs="Inyanga Shalwar +2",
	feet=gear.jse_empy_feet,
	neck="Loricate Torque +1",
	waist=gear.dt_waist,	
	left_ear="Infused Earring",
	right_ear="Etiolation Earring",
	left_ring="Defending Ring",
	right_ring="Inyanga Ring",
	back=gear.tp_back,
}

sets.idle.Tank = {
    main="Daybreak",
    sub="Genmei Shield",
    range={ name="Terpander", augments={'HP+30','Mag. Acc.+10','Damage Taken -3%',}},
    head={ name="Nyame Helm", augments={'Path: B',}},
    body="Fili Hongreline +3",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Fili Cothurnes +3",
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Plat. Mog. Belt",
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    right_ear="Etiolation Earring",
    left_ring="Defending Ring",
    right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
    back="Moonbeam Cape",
}

-- Defense sets
sets.defense.PDT = {
	ammo=gear.dt_ammo,
	head="Nyame Helm",
	body="Nyame Mail",
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

sets.resting = sets.idle
sets.idle.Weak = sets.idle.DT

sets.Kiting = {feet=gear.jse_empy_feet}
sets.latent_refresh = {waist="Fucho-no-obi"}

-- Engaged sets
sets.engaged = {
	range=gear.tp_linos,
	head="Bunzi's Hat",
	body=gear.melee_body,
	hands="Bunzi's Gloves",
	legs=gear.jse_empy_legs,
	feet="Nyame Sollerets",
	neck=gear.brd_jse_neck,
	waist="Windbuffet Belt +1",
	left_ear="Telos Earring",
	right_ear=gear.empy_earring,
	left_ring="Ilabrat Ring",
	right_ring="Chirich Ring +1",
	back=gear.tp_back,
}

-- Set if dual-wielding
sets.engaged.DW = set_combine(sets.engaged, {waist="Reiki Yotai", left_ear="Suppanomimi"})