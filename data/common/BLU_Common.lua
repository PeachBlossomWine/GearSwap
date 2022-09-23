autows_list = {['TizThib']='Expiacion',['TizThib']='Expiacion',['NaegThib']='Savage Blade',['NaegZan']='Savage Blade',['Maxentius']='Black Halo',}

if item_available('Shamash Robe') then
	gear.body_idle = 'Shamash Robe'
else
	gear.body_idle = "Hashishin Mintan +2"
end

if item_available("Hashi. Earring +2") then
	gear.empy_earring = "Hashi. Earring +2"
	gear.empy_nuke_earring = "Hashi. Earring +2"
elseif item_available("Hashi. Earring +1") then
	gear.empy_earring = "Hashi. Earring +1"
	gear.empy_nuke_earring = "Friomisi Earring"
elseif item_available("Hashishin Earring") then
	gear.empy_earring = "Hashishin Earring"
	gear.empy_nuke_earring = "Friomisi Earring"
else
	gear.empy_earring = "Telos Earring"
	gear.empy_nuke_earring = "Friomisi Earring"
end

-- Weapons sets
sets.weapons.TizThib = {main="Tizona",sub="Thibron"}
sets.weapons.TizZan = {main="Tizona",sub="Zantetsuken"}
sets.weapons.NaegThib = {main="Naegling",sub="Thibron"}
sets.weapons.NaegZan = {main="Naegling",sub="Zantetsuken"}
sets.weapons.TizBunzi = {main="Tizona",sub="Bunzi's Rod"}
sets.weapons.SequenceThib = {main="Sequence",sub="Thibron"}
sets.weapons.SequenceZan = {main="Sequence",sub="Zantetsuken"}
sets.weapons.Maxentius = {main="Maxentius",sub="Thibron"}
sets.weapons.Magic = {main="Maxentius",sub="Bunzi's Rod"}
sets.weapons.MACC = {main="Sakpata's Sword",sub="Bunzi's Rod"}

sets.weapons.Learn = {main="Nihility",sub="Qutrub Knife"}

-- Buff sets
sets.buff['Burst Affinity'] = {feet="Hashi. Basmak +2"}
sets.buff['Chain Affinity'] = {} --feet="Assim. Charuqs +2"
sets.buff.Convergence = {} --head="Luh. Keffiyeh +1"
sets.buff.Diffusion = {feet="Luhlaza Charuqs +3"}
sets.buff.Enchainment = {}
sets.buff.Efflux = {back=gear.jse_da_back} --legs="Hashishin Tayt +1"
sets.buff.Doom = set_combine(sets.buff.Doom, {})
sets.buff.Sleep = set_combine(sets.buff.Sleep, {})

	sets.HPDown = {}

-- Precast Sets
sets.precast.JA['Azure Lore'] = {} --hands="Luh. Bazubands +1"

-- Waltz set (chr and vit)
sets.precast.Waltz = {}
sets.Self_Waltz = {}
sets.precast.Waltz['Healing Waltz'] = {}
sets.precast.Step = {}
sets.precast.Flourish1 = {}

-- Fast cast sets for spells

-- 67%
-- BLU Spells: 71%
-- 15% RDM or Traits
-- Total: 82% / 86%

sets.precast.FC = {
	ammo="Sapience Orb",																								-- 2
	head={ name="Carmine Mask +1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}},							-- 14
	body={ name="Adhemar Jacket +1", augments={'HP+105','"Fast Cast"+10','Magic dmg. taken -4',}},						-- 10
	hands="Leyline Gloves",																								-- 8
	legs="Psycloth Lappas",																								-- 7
	feet={ name="Carmine Greaves +1", augments={'HP+80','MP+80','Phys. dmg. taken -4',}},								-- 8
	neck="Baetyl Pendant",																								-- 4
	waist="Witful Belt",																								-- 3
	left_ear="Loquac. Earring",																							-- 2
	right_ear="Etiolation Earring",																						-- 1
	left_ring="Kishar Ring",																							-- 4
	right_ring="Weather. Ring +1",																							-- 5 + QC
	back="Perimede Cape",
}

sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {})
sets.precast.FC['Blue Magic'] = set_combine(sets.precast.FC, {}) -- body="Hashishin Mintan +1"

sets.precast.RA = {ranged="Aureole"}

-- Weaponskill sets

-- For Savage and Expiacion
-- WSD:
sets.precast.WS = {
	ammo="Oshasha's Treatise",
	head="Nyame Helm",
	body="Nyame Mail",																						-- 10
	hands="Nyame Gauntlets",																				-- 7
	legs="Nyame Flanchard",																					-- 10
	feet="Nyame Sollerets",
	neck=gear.blu_jse_neck,
	waist="Sailfi Belt +1",
	left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
	right_ear="Ishvara Earring",																			-- 2
	left_ring="Rufescent Ring",
	right_ring="Beithir Ring",																				-- 3
	back=gear.jse_str_back,																					-- 10
}

sets.precast.WS['Chant du Cygne'] = {
	ammo="Coiste Bodhar",
	head="Gleti's Mask",
	body="Gleti's Cuirass",
	hands="Gleti's Gauntlets",
	legs="Gleti's Breeches",
	feet="Gleti's Boots",
	neck=gear.blu_jse_neck,
	waist="Fotia Belt",
	left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
	right_ear="Odr Earring",
	left_ring="Begrudging Ring",
	right_ring="Beithir Ring",
	--right_ring="Epona's Ring",
	back=gear.jse_crit_back,
}

sets.precast.WS['Black Halo'] = {
	ammo="Oshasha's Treatise",
	head="Nyame Helm",
	body="Nyame Mail",
	hands="Nyame Gauntlets",
	legs="Luhlaza Shalwar +3",
	feet="Nyame Sollerets",
	neck="Fotia Gorget",
	waist="Fotia Belt",
	left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
	right_ear="Regal Earring",
	left_ring="Metamorph Ring +1",
	right_ring="Beithir Ring",
	back=gear.jse_hybrid_back,
}

sets.precast.WS['Seraph Blade'] = {
	ammo="Pemphredo Tathlum",
	head="Nyame Helm",
	body="Nyame Mail",
	hands="Nyame Gauntlets",
	legs="Luhlaza Shalwar +3",
	feet="Nyame Sollerets",
	neck=gear.blu_jse_neck,
	waist="Sacro Cord",
	left_ear="Moonshade Earring",
	right_ear="Regal Earring",
	left_ring="Metamorph Ring +1",
	right_ring="Beithir Ring",
	back=gear.jse_hybrid_back
}

sets.precast.WS['Sanguine Blade'] = {
	ammo="Pemphredo Tathlum",
	head="Pixie Hairpin +1",
	body="Nyame Mail",
	hands="Nyame Gauntlets",
	legs="Luhlaza Shalwar +3",
	feet="Nyame Sollerets",
	neck=gear.blu_jse_neck,
	waist="Sacro Cord",
	left_ear="Friomisi Earring",
	right_ear="Regal Earring",
	left_ring="Metamorph Ring +1",
	right_ring="Archon Ring",
	back=gear.jse_hybrid_back
}


-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
sets.precast.WS['Requiescat'] = set_combine(sets.precast.WS, {})
sets.precast.WS['Realmrazer'] = set_combine(sets.precast.WS, {})
sets.precast.WS['Savage Blade'] = set_combine(sets.precast.WS, {})
sets.precast.WS['Vorpal Blade'] = sets.precast.WS['Chant du Cygne']
sets.precast.WS['Expiacion'] = set_combine(sets.precast.WS,{})
sets.precast.WS['Flash Nova'] = set_combine(sets.precast.WS, {})

-- Swap to these on Moonshade using WS if at 3000 TP
sets.MaxTP = {left_ear="Telos Earring"}

-- Midcast Sets
sets.midcast.FastRecast = sets.precast.FC

sets.midcast['Blue Magic'] = {}

-- Physical Spells --

sets.midcast['Blue Magic'].Physical = {
	ammo={ name="Coiste Bodhar", augments={'Path: A',}},
	head="Malignance Chapeau",
	body="Assim. Jubbah +3",
	hands="Malignance Gloves",
	legs="Malignance Tights",
	feet="Malignance Boots",
	neck=gear.blu_jse_neck,
	waist="Grunfeld Rope",
	left_ear="Telos Earring",
	right_ear="Digni. Earring",
	left_ring="Ilabrat Ring",
	right_ring="Chirich Ring +1",
	back=gear.jse_str_back,
}

sets.midcast['Blue Magic'].Physical.Resistant = set_combine(sets.midcast['Blue Magic'].Physical, {})

sets.midcast['Blue Magic'].PhysicalAcc = set_combine(sets.midcast['Blue Magic'].Physical, {})
sets.midcast['Blue Magic'].PhysicalAcc.Resistant = set_combine(sets.midcast['Blue Magic'].PhysicalAcc, {})

sets.midcast['Blue Magic'].PhysicalStr = set_combine(sets.midcast['Blue Magic'].Physical, {})
sets.midcast['Blue Magic'].PhysicalStr.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})

sets.midcast['Blue Magic'].PhysicalDex = set_combine(sets.midcast['Blue Magic'].Physical, {})
sets.midcast['Blue Magic'].PhysicalDex.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})

sets.midcast['Blue Magic'].PhysicalVit = set_combine(sets.midcast['Blue Magic'].Physical, {})
sets.midcast['Blue Magic'].PhysicalVit.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})

sets.midcast['Blue Magic'].PhysicalAgi = set_combine(sets.midcast['Blue Magic'].Physical, {})
sets.midcast['Blue Magic'].PhysicalAgi.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})

sets.midcast['Blue Magic'].PhysicalInt = set_combine(sets.midcast['Blue Magic'].Physical, {})
sets.midcast['Blue Magic'].PhysicalInt.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})

sets.midcast['Blue Magic'].PhysicalMnd = set_combine(sets.midcast['Blue Magic'].Physical, {})
sets.midcast['Blue Magic'].PhysicalMnd.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})

sets.midcast['Blue Magic'].PhysicalChr = set_combine(sets.midcast['Blue Magic'].Physical, {})
sets.midcast['Blue Magic'].PhysicalChr.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})

sets.midcast['Blue Magic'].PhysicalHP = set_combine(sets.midcast['Blue Magic'].Physical, {})
sets.midcast['Blue Magic'].PhysicalHP.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})


-- Magical Spells --
sets.midcast['Blue Magic'].Magical = {
	ammo="Pemphredo Tathlum",
	head="Nyame Helm",
	body="Hashishin Mintan +2",
	hands="Hashi. Bazu. +2",
	--legs="Luhlaza Shalwar +3",
	legs="Hashishin Tayt +2",
	feet="Hashi. Basmak +2",
	neck=gear.blu_jse_neck,
	waist="Sacro Cord",
	left_ear="Regal Earring",
	right_ear=gear.empy_nuke_earring,
	left_ring="Metamorph Ring +1",
	right_ring="Weather. Ring +1",
	back=gear.jse_mab_back,
}
				 
-- For MACC / Recast
-- 427 MACC
-- 39% FC
-- 523 Blue Magic
-- +243 INT
sets.midcast['Blue Magic'].Magical.Resistant = {
	ammo="Pemphredo Tathlum",
	head="Carmine Mask +1",					-- 14% FC
	body="Luhlaza Jubbah +3",				-- 9% FC
	hands="Nyame Gauntlets",
	legs="Assim. Shalwar +3",
	feet="Luhlaza Charuqs +3",
	neck=gear.blu_jse_neck,
	waist="Acuity Belt +1",
	left_ear="Digni. Earring",
	right_ear="Regal Earring",
	left_ring="Metamorph Ring +1",
	right_ring="Weather. Ring +1",			-- 6% FC
	back=gear.jse_macc_fc_back,				-- 10% FC
}
sets.midcast['Tenebral Crush'] = set_combine(sets.midcast['Blue Magic'].Magical, {})

sets.midcast['Tenebral Crush'].Resistant = set_combine(sets.midcast['Blue Magic'].Magical.Resistant, {
	head="Assim. Keffiyeh +3",
	back="Aurist's Cape +1",
})


sets.midcast['Blue Magic'].MagicalMnd = set_combine(sets.midcast['Blue Magic'].Magical, {})
sets.midcast['Blue Magic'].MagicalChr = set_combine(sets.midcast['Blue Magic'].Magical, {})
sets.midcast['Blue Magic'].MagicalVit = set_combine(sets.midcast['Blue Magic'].Magical, {})
sets.midcast['Blue Magic'].MagicalDex = set_combine(sets.midcast['Blue Magic'].Magical, {})

sets.midcast['Blue Magic'].MagicAccuracy = sets.midcast['Blue Magic'].Magical.Resistant

sets.midcast['Enfeebling Magic'] = {
	ammo="Pemphredo Tathlum",
	head="Malignance Chapeau",
	body="Hashishin Mintan +2",
	hands="Malignance Gloves",
	legs="Malignance Tights",
	feet="Malignance Boots",
	neck=gear.blu_jse_neck,
	waist="Luminary Sash",
	left_ear="Digni. Earring",
	right_ear="Regal Earring",
	left_ring="Kishar Ring",
	right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
	back=gear.jse_mab_back,
}

sets.midcast['Dark Magic'] = set_combine(sets.midcast['Enfeebling Magic'], {
	head="Pixie Hairpin +1", 
	left_ring="Evanescence Ring",
	right_ring="Archon Ring",
})

sets.midcast['Enhancing Magic'] = {
	ammo="Hydrocera",
	head=gear.telchine_enhancing_head,												-- 8%
	neck="Incanter's Torque",														-- 10 Skill
	body=gear.telchine_enhancing_body,												-- 8%
	hands=gear.telchine_enhancing_hands,											-- 10%
	legs=gear.telchine_enhancing_legs,												-- 8%
	feet=gear.telchine_enhancing_feet,												-- 10%
	waist="Flume Belt +1",
	left_ear="Andoaa Earring",														-- 5 Skill
	right_ear="Etiolation Earring",
	left_ring="Defending Ring",
	right_ring="Gelatinous Ring +1",
}
	
		sets.midcast['Phalanx'] = set_combine(sets.midcast['Enhancing Magic'],{})

sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {head="Amalric Coif +1"})
sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {head="Amalric Coif +1",hands="Regal Cuffs"})
sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {waist="Siegel Sash"})
sets.midcast.BarElement = set_combine(sets.precast.FC['Enhancing Magic'], {})

sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {})
sets.midcast.Protectra = set_combine(sets.midcast['Enhancing Magic'], {})
sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {})
sets.midcast.Shellra = set_combine(sets.midcast['Enhancing Magic'], {})

sets.midcast['Divine Magic'] = set_combine(sets.midcast['Enfeebling Magic'], {})
sets.midcast['Elemental Magic'] = set_combine(sets.midcast['Blue Magic'].Magical, {})
sets.midcast['Elemental Magic'].Resistant = set_combine(sets.midcast['Elemental Magic'], {})

sets.midcast.Helix = sets.midcast['Elemental Magic']
sets.midcast.Helix.Resistant = sets.midcast['Elemental Magic'].Resistant

sets.element.Dark = {head="Pixie Hairpin +1",ring2="Archon Ring"}

sets.element.Light = {}

sets.midcast.Cure = {
	ammo="Hydrocera",
	head="Nyame Helm",
	body="Hashishin Mintan +2",
	hands=gear.telchine_enhancing_hands,
	legs="Nyame Flanchard",
	feet="Nyame Sollerets",
	neck="Incanter's Torque",
	waist="Luminary Sash",
	left_ear="Mendi. Earring",
	right_ear="Regal Earring",
	left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
	right_ring="Lebeche Ring",
	back="Solemnity Cape",
}

sets.midcast.Cursna =  set_combine(sets.midcast.Cure, {
	waist="Witful Belt"
})

-- Breath Spells --

sets.midcast['Blue Magic'].Breath = set_combine(sets.midcast['Blue Magic'].Magical, {})

-- Physical Added Effect Spells most notably "Stun" spells --

sets.midcast['Blue Magic'].Stun = {
	ammo="Hydrocera",
	head="Malignance Chapeau",
	body="Malignance Tabard",
	hands="Malignance Gloves",
	legs="Luhlaza Shalwar +3",
	feet="Malignance Boots",
	neck=gear.blu_jse_neck,
	waist="Luminary Sash",
	left_ear="Digni. Earring",
	right_ear="Regal Earring",
	left_ring="Metamorph Ring +1",
	right_ring="Vertigo Ring",
	back=gear.jse_mab_back,
}

sets.midcast['Blue Magic'].Stun.Resistant = set_combine(sets.midcast['Blue Magic'].Stun , {})


-- Other Specific Spells --


sets.midcast['Blue Magic']['White Wind'] = {
	ammo="Hydrocera",
	head="Nyame Helm",
	body="Hashishin Mintan +2",
	hands=gear.telchine_enhancing_hands,
	legs="Nyame Flanchard",
	feet="Nyame Sollerets",
	neck="Incanter's Torque",
	waist="Luminary Sash",
	left_ear="Mendi. Earring",
	right_ear="Odnowa Earring +1",
	left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
	right_ring="Lebeche Ring",
	back="Solemnity Cape",
}
				
sets.midcast['Blue Magic']['Healing Breeze'] = sets.midcast['Blue Magic']['White Wind']

sets.midcast['Blue Magic'].Healing = {
	ammo="Hydrocera",
	head="Nyame Helm",
	body="Hashishin Mintan +2",
	hands=gear.telchine_enhancing_hands,
	legs="Nyame Flanchard",
	feet="Nyame Sollerets",
	neck="Incanter's Torque",
	waist="Luminary Sash",
	left_ear="Mendi. Earring",
	right_ear="Odnowa Earring +1",
	left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
	right_ring="Lebeche Ring",
	back="Solemnity Cape",
}

--Overwrite certain spells with these peices even if the day matches, because of resource inconsistancies.
sets.NonElementalCure = {waist="Luminary Sash"}

sets.midcast['Blue Magic'].SkillBasedBuff = {
	ammo="Pemphredo Tathlum",
	head="Assim. Keffiyeh +3",
	body="Assim. Jubbah +3",
	hands="Malignance Gloves",
	legs="Assim. Shalwar +3",
	feet={ name="Luhlaza Charuqs +3", augments={'Enhances "Diffusion" effect',}},
	neck=gear.blu_jse_neck,
	waist="Luminary Sash",
	left_ear="Regal Earring",
	right_ear=gear.empy_nuke_earring,
	left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
	right_ring="Weather. Ring +1",
	back=gear.jse_mab_back,
}

sets.midcast['Blue Magic'].Buff = set_combine(sets.midcast['Blue Magic'].SkillBasedBuff, {})

sets.midcast['Blue Magic']['Battery Charge'] = set_combine(sets.midcast['Blue Magic'].Buff, {head="Amalric Coif +1",waist="Gishdubar Sash"})
sets.midcast['Blue Magic']['Carcharian Verve'] = set_combine(sets.midcast['Blue Magic'].Buff, {head="Amalric Coif +1",hands="Regal Cuffs"})

-- Sets to return to when not performing an action.

sets.latent_refresh = {waist="Fucho-no-obi"}
sets.latent_refresh_grip = {}
sets.DayIdle = {}
sets.NightIdle = {}

-- Gear for learning spells: +skill and AF hands.
sets.Learning = {}

-- Idle sets

sets.idle = {
	ammo="Staunch Tathlum +1",
	head="Gleti's Mask",
	body=gear.body_idle,		
	hands="Gleti's Gauntlets",
	legs="Gleti's Breeches",
	feet="Gleti's Boots",
	neck="Sanctity Necklace",
	waist="Flume Belt +1",
	left_ear="Infused Earring",
	right_ear="Etiolation Earring",
	left_ring="Defending Ring",
	right_ring="Gelatinous Ring +1",
	back=gear.jse_da_back,
}

sets.idle.DT = set_combine(sets.idle, {
	head="Nyame Helm",
	body=gear.body_idle,
	hands="Nyame Gauntlets",
	legs="Carmine Cuisses +1",
	feet="Nyame Sollerets",
})

sets.idle.Town = {
	ammo="Staunch Tathlum +1",
	head="Nyame Helm",
	body="Nyame Mail",
	hands="Nyame Gauntlets",
	legs="Nyame Flanchard",
	feet="Nyame Sollerets",
	neck=gear.blu_jse_neck,
	waist="Flume Belt +1",
	left_ear="Telos Earring",
	right_ear="Suppanomimi",
	left_ring="Petrov Ring",
	right_ring="Chirich Ring +1",
	back=gear.jse_da_back,
}

sets.idle.Refresh = set_combine(sets.idle, {head="Rawhide Mask", legs="Rawhide Trousers"})
sets.resting = sets.idle

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
	left_ear="Etiolation Earring",
	right_ear="Odnowa Earring +1",
	left_ring="Defending Ring",
	right_ring="Gelatinous Ring +1",
	back=gear.dt_moon_back,
}

sets.defense.MDT = sets.defense.PDT
sets.defense.MEVA = sets.defense.MDT

sets.defense.NukeLock = sets.midcast['Blue Magic'].Magical

sets.Kiting = {legs="Carmine Cuisses +1"}

-- Extra Melee sets.  Apply these on top of melee sets.
sets.Knockback = {}
sets.MP = {}
sets.MP_Knockback = {}
sets.SuppaBrutal = {}
sets.DWEarrings = {}
sets.DWMax = {}
sets.TreasureHunter = set_combine(sets.TreasureHunter, {})


-- Engaged sets

sets.engaged = {
	ammo="Ginsen",
	head="Malignance Chapeau",
	body="Malignance Tabard",
	hands="Adhemar Wrist. +1",
	legs="Samnuha Tights",
	feet="Malignance Boots",
	neck=gear.blu_jse_neck,
	waist="Reiki Yotai",
	left_ear="Suppanomimi",
	right_ear=gear.empy_earring,
	left_ring="Petrov Ring",
	right_ring="Chirich Ring +1",
	back=gear.jse_da_back
}

sets.engaged.DT = {
	ammo="Staunch Tathlum +1",
	head="Malignance Chapeau",
	body="Malignance Tabard",
	hands="Malignance Gloves",
	legs="Malignance Tights",
	feet="Malignance Boots",
	neck=gear.blu_jse_neck,
	waist="Reiki Yotai",
	left_ear="Suppanomimi",
	right_ear=gear.empy_earring,
	left_ring="Petrov Ring",
	right_ring="Chirich Ring +1",
	back=gear.jse_da_back
}


sets.engaged.AM = sets.engaged 
sets.engaged.DT.AM = sets.engaged.DT

sets.Self_Healing = {waist="Gishdubar Sash"}
sets.Cure_Received = {waist="Gishdubar Sash"}
sets.Self_Refresh = {waist="Gishdubar Sash"}
sets.MagicBurst = {hands="Amalric Gages +1",ring1="Mujin Band"}
sets.Phalanx_Received = {} -- Taeon set
