if item_available("Brioso Justau. +3") then
	gear.brd_af_body = "Brioso Justau. +3"	
else
	gear.brd_af_body = "Brioso Justau. +2"
end

if item_available("Fili Manchettes +2") then
	gear.brd_empy_hands = "Fili Manchettes +2"
	gear.brd_melee_hands = "Fili Manchettes +2"
else
	gear.brd_empy_hands = "Fili Manchettes +1"
	gear.brd_melee_hands = "Bunzi's Gloves"
end

if item_available("Fili Hongreline +2") then
	gear.brd_empy_body = "Fili Hongreline +2"
else
	gear.brd_empy_body = "Fili Hongreline +1"
end

if item_available("Fili Cothurnes +2") then
	gear.brd_empy_feet = "Fili Cothurnes +2"
else
	gear.brd_empy_feet = "Fili Cothurnes +1"
end

if item_available("Fili Calot +2") then
	gear.brd_empy_head = "Fili Calot +2"
else
	gear.brd_empy_head = "Fili Calot +1"
end

if item_available("Fili Rhingrave +2") then
	gear.brd_empy_legs = "Fili Rhingrave +2"
else
	gear.brd_empy_legs = "Fili Rhingrave +1"
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
sets.weapons.Carnwenhan = {main="Carnwenhan",sub="Genmei Shield"}
sets.weapons.Naegling = {main="Naegling",sub="Genmei Shield"}
sets.weapons.DualAeneas = {main="Aeneas",sub="Crepuscular Knife"}
sets.weapons.DualCarn = {main="Carnwenhan",sub="Crepuscular Knife"}
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
	feet=gear.brd_empy_feet,																-- 10
	neck="Baetyl Pendant",																	-- 4
	waist="Embla Sash",																		-- 5
	left_ear="Loquacious Earring",															-- 2
	right_ear="Etiolation Earring",															-- 1
	left_ring="Weather. Ring +1",															-- 4
	right_ring="Lebeche Ring",
	back=gear.jse_back,																		-- 10
}

sets.precast.FC.Cure = set_combine(sets.precast.FC, {})
sets.precast.FC.Stoneskin = set_combine(sets.precast.FC, {})
sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})

-- 86% Song + FC combined
sets.precast.FC.BardSong = set_combine(sets.precast.FC, {
	head=gear.brd_empy_head,   												-- 14
	body=gear.brd_af_body,													-- 15
})

sets.precast.FC.Daurdabla = set_combine(sets.precast.FC.BardSong, {range=info.ExtraSongInstrument})
sets.precast.FC["Honor March"] = set_combine(sets.precast.FC.BardSong, {range="Marsyas"})

sets.precast.FC.Daurdabla.Melee = set_combine(sets.precast.FC.BardSong, {range=info.ExtraSongInstrument})
sets.precast.FC["Honor March"].Melee = set_combine(sets.precast.FC.BardSong, {range="Marsyas"})

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
	neck="Bard's Charm +1",
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
	neck="Bard's Charm +1",
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
	neck="Bard's Charm +1",
	waist="Grunfeld Rope",
	left_ear="Ishvara Earring",
	right_ear="Moonshade Earring",
	left_ring="Rufescent Ring",
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
	right_ring="Rufescent Ring",
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
	main="Carnwenhan",
	sub="Genmei Shield",					-- 10
	range="Gjallarhorn",
	head=gear.brd_empy_head,
	body=gear.brd_empy_body,
	hands=gear.brd_empy_hands,
	legs="Inyanga Shalwar +2",
	feet="Brioso Slippers +3",
	neck=gear.brd_potency_neck,
	waist="Flume Belt +1",					-- 4
	left_ear="Odnowa Earring +1",			-- 3
	right_ear="Genmei Earring",				-- 2
	left_ring="Defending Ring",				-- 10
	right_ring="Gelatinous Ring +1",		-- 7
	back=gear.jse_back,						-- 10
}

sets.midcast.SongEffect.Melee = {
	main="Carnwenhan",
	range="Gjallarhorn",
	head=gear.brd_empy_head,
	body=gear.brd_empy_body,
	hands=gear.brd_empy_hands,
	legs="Inyanga Shalwar +2",
	feet="Brioso Slippers +3",
	neck=gear.brd_potency_neck,
	waist="Flume Belt +1",					-- 4
	left_ear="Odnowa Earring +1",			-- 3
	right_ear="Genmei Earring",				-- 2
	left_ring="Defending Ring",				-- 10
	right_ring="Gelatinous Ring +1",		-- 7
	back=gear.jse_back,						-- 10	
}

-- Gear to enhance certain classes of songs.  No instruments added here since Gjallarhorn is being used.
sets.midcast.Ballad = set_combine(sets.midcast.SongEffect, {}) --{legs=gear.brd_empy_legs})
sets.midcast.Madrigal = set_combine(sets.midcast.SongEffect, {head=gear.brd_empy_head})
sets.midcast.March = set_combine(sets.midcast.SongEffect, {hands=gear.brd_empy_hands})
sets.midcast.Minuet = set_combine(sets.midcast.SongEffect, {body=gear.brd_empy_body})
sets.midcast.Minne = set_combine(sets.midcast.SongEffect, {legs="Mousai Seraweels +1"})
sets.midcast.Etude = set_combine(sets.midcast.SongEffect, {head="Mousai Turban +1", feet=gear.brd_empy_feet})
sets.midcast.Paeon = set_combine(sets.midcast.SongEffect, {head="Brioso Roundlet +3"})
sets.midcast.Carol = set_combine(sets.midcast.SongEffect, {head=gear.brd_empy_head, hands="Mousai Gages +1"})
sets.midcast["Sentinel's Scherzo"] = set_combine(sets.midcast.SongEffect, {feet=gear.brd_empy_feet})
sets.midcast.Mazurka = {range=info.ExtraSongInstrument}
sets.midcast["Honor March"] = set_combine(sets.midcast.SongEffect, {range="Marsyas"})

sets.midcast.Ballad.Melee = set_combine(sets.midcast.SongEffect.Melee, {}) --{legs=gear.brd_empy_legs})
sets.midcast.Madrigal.Melee = set_combine(sets.midcast.SongEffect.Melee, {head=gear.brd_empy_head})
sets.midcast.March.Melee = set_combine(sets.midcast.SongEffect.Melee, {hands=gear.brd_empy_hands})
sets.midcast.Minuet.Melee = set_combine(sets.midcast.SongEffect.Melee, {body=gear.brd_empy_body})
sets.midcast.Minne.Melee = set_combine(sets.midcast.SongEffect.Melee, {legs="Mousai Seraweels +1"})
sets.midcast.Etude.Melee = set_combine(sets.midcast.SongEffect.Melee, {head="Mousai Turban +1", feet=gear.brd_empy_feet})
sets.midcast.Paeon.Melee = set_combine(sets.midcast.SongEffect.Melee, {head="Brioso Roundlet +3"})
sets.midcast.Carol.Melee = set_combine(sets.midcast.SongEffect.Melee, {head=gear.brd_empy_head, hands="Mousai Gages +1"})
sets.midcast["Sentinel's Scherzo"].Melee = set_combine(sets.midcast.SongEffect.Melee, {feet=gear.brd_empy_feet})
sets.midcast.Mazurka.Melee = {range=info.ExtraSongInstrument}
sets.midcast["Honor March"].Melee = set_combine(sets.midcast.SongEffect.Melee, {range="Marsyas"})	

-- For song defbuffs (duration primary, accuracy secondary)
sets.midcast.SongDebuff = {
	main="Carnwenhan",
	sub="Ammurapi Shield",
	range="Gjallarhorn",
	head="Brioso Roundlet +3",
	body="Brioso Justaucorps +3",
	hands="Brioso Cuffs +3",
	legs="Brioso Cannions +3",
	feet="Brioso Slippers +3",
	neck=gear.brd_potency_neck,
	waist="Obstin. Sash",
	left_ear="Regal Earring",
	right_ear=gear.empy_earring,
	left_ring="Metamorph Ring +1",
	right_ring="Weather. Ring +1",
	back=gear.jse_back,
}

sets.midcast.Lullaby = set_combine(sets.midcast.SongDebuff, {
	range=info.ExtraSongInstrument, 
	hands="Brioso Cuffs +3",
})

sets.midcast.Threnody = set_combine(sets.midcast.SongDebuff, {
	body="Mousai Manteel +1",
})

sets.midcast.SongDebuff.Melee = {
	main="Carnwenhan",
	range="Gjallarhorn",
	head="Brioso Roundlet +3",
	body="Brioso Justaucorps +3",
	hands="Brioso Cuffs +3",
	legs="Brioso Cannions +3",
	feet="Brioso Slippers +3",
	neck=gear.brd_potency_neck,
	waist="Obstin. Sash",
	left_ear="Regal Earring",
	right_ear=gear.empy_earring,
	left_ring="Metamorph Ring +1",
	right_ring="Weather. Ring +1",
	back=gear.jse_back,
}

sets.midcast.Lullaby.Melee = set_combine(sets.midcast.SongDebuff.Melee, {
	range=info.ExtraSongInstrument, 
	hands="Brioso Cuffs +3",
})

sets.midcast.Threnody.Melee = set_combine(sets.midcast.SongDebuff.Melee, {
	body="Mousai Manteel +1",
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
	main=gear.gada_enhancing_club, 													-- 6%
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
	main="Carnwenhan",
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
	waist="Flume Belt +1",
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
	waist="Flume Belt +1",
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
	range="Terpander",
	head=gear.chironic_refresh_head,		-- 2
	body="Annoint. Kalasiris",				-- 2
	hands=gear.chironic_refresh_hands,		-- 2
	legs=gear.chironic_refresh_legs,		-- 2
	feet=gear.brd_empy_feet,
	neck="Sanctity Necklace",
	waist="Flume Belt +1",
	left_ear="Infused Earring",
	right_ear="Etiolation Earring",
	left_ring="Defending Ring",
	right_ring="Gelatinous Ring +1",
	back=gear.tp_back,
}

sets.idle.Town = {
	main="Carnwenhan",
	sub="Ammurapi Shield",
	range="Daurdabla",
	head="Nyame Helm",
	body="Nyame Mail",
	hands="Nyame Gauntlets",
	legs="Nyame Flanchard",
	feet="Nyame Sollerets",
	neck=gear.brd_potency_neck,
	waist="Flume Belt +1",
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
	range="Terpander",
	head="Inyanga Tiara +2",
	body="Annoint. Kalasiris",
	hands="Nyame Gauntlets",
	legs="Inyanga Shalwar +2",
	feet=gear.brd_empy_feet,
	neck="Loricate Torque +1",
	waist="Flume Belt +1",	
	left_ear="Infused Earring",
	right_ear="Etiolation Earring",
	left_ring="Defending Ring",
	right_ring="Inyanga Ring",
	back=gear.tp_back,
}

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

sets.Kiting = {feet=gear.brd_empy_feet}
sets.latent_refresh = {waist="Fucho-no-obi"}

-- Engaged sets
sets.engaged = {
	range=gear.tp_linos,
	head=gear.brd_empy_head,
	body="Nyame Mail",
	hands=gear.brd_melee_hands,
	legs="Nyame Flanchard",
	feet=gear.brd_empy_feet,
	neck="Bard's Charm +1",
	waist="Windbuffet Belt +1",
	left_ear="Telos Earring",
	right_ear=gear.empy_earring,
	left_ring="Ilabrat Ring",
	right_ring="Chirich Ring +1",
	back=gear.tp_back,
}

-- Set if dual-wielding
sets.engaged.DW = set_combine(sets.engaged, {waist="Reiki Yotai", left_ear="Suppanomimi"})