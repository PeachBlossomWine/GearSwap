if item_available('Ea Hat +1') then
  gear.BurstHead = 'Ea Hat +1'
else
  gear.BurstHead = 'Nyame Helm'
end

if item_available('Ea Houppelande') then
  gear.BurstBody = 'Ea Houppelande'
else
  gear.BurstBody = 'Jhakri Robe +2'
end

if item_available('Ea Slops +1') then
	gear.BurstLegs = 'Ea Slops +1'
elseif item_available('Ea Slops') then
	gear.BurstLegs = 'Ea Slops'
else
	gear.BurstLegs = 'Nyame Flanchard'
end

if item_available('Crepuscular Cloak') then
	gear.impact_body = "Crepuscular Cloak"
else
	gear.impact_body = "Twilight Cloak"
end

sets.EaStuff = {head="Ea Hat +1", body="Ea Houppelande", legs="Ea Slops +1"}
sets.EaStuffNQ = {legs="Ea Slops"}

-- Weapons sets
sets.weapons.Murgleis = {main="Murgleis",sub="Ammurapi Shield"}
sets.weapons.Crocea = {main="Crocea Mors",sub="Ammurapi Shield"}
sets.weapons.Sequence = {main="Sequence",sub="Ammurapi Shield"}
sets.weapons.Naegling = {main="Naegling",sub="Ammurapi Shield"}
-- DW
sets.weapons.DualMurCea = {main="Murgleis",sub="Crocea Mors"}
sets.weapons.DualMurgleis = {main="Murgleis",sub="Gleti's Knife"}
sets.weapons.DualMurDegen = {main="Murgleis",sub="Demers. Degen +1"}
sets.weapons.DualCrocea = {main="Crocea Mors",sub="Gleti's Knife"}
sets.weapons.DualCroDegen = {main="Crocea Mors",sub="Demers. Degen +1"}
sets.weapons.DualSequence = {main="Sequence",sub="Gleti's Knife"}
sets.weapons.DualSavage = {main="Naegling",sub="Gleti's Knife"}
sets.weapons.DualEvis = {main="Tauret",sub="Gleti's Knife"}
sets.weapons.DualClubs = {main="Kaja Rod",sub="Bunzi's Rod"}

sets.weapons.DualTrial = {main="Murgleis",sub="Qutrub Knife"}


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
	head=gear.merlinic_fc_head,																-- 15
	body="Vitiation Tabard +3",																-- 15
	neck="Voltsurge Torque",																-- 4
	legs="Aya. Cosciales +2",																-- 6	
	waist="Embla Sash",																		-- 5
	left_ear="Loquac. Earring",																-- 2
	right_ear="Etiolation Earring",															-- 1
	left_ring="Weather. Ring +1",																-- 4
	right_ring="Lebeche Ring",																-- QC 2
	back="Perimede Cape",																	-- QC 4
}
	
sets.precast.FC.Impact = set_combine(sets.precast.FC, {head=empty,body=gear.impact_body})
sets.precast.FC.Dispelga = set_combine(sets.precast.FC, {main="Daybreak",sub="Genmei Shield"})
   
-- Weaponskill sets
sets.precast.WS = {
	range=empty,
	ammo="Crepuscular Pebble",
	head="Nyame Helm",
	body="Nyame Mail",
	hands="Nyame Gauntlets",
	legs="Nyame Flanchard",
	feet="Nyame Sollerets",
	neck="Fotia Gorget",
	waist="Fotia Belt",
	left_ear="Ishvara Earring",
	right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
	left_ring="Petrov Ring",
	right_ring="Rufescent Ring",
	back=gear.jse_str_back,
}

sets.precast.WS['Death Blossom'] = set_combine(sets.precast.WS, {})
sets.precast.WS['Requiescat'] = set_combine(sets.precast.WS, {})
sets.precast.WS['Chant Du Cygne'] = set_combine(sets.precast.WS, {})

sets.precast.WS['Savage Blade'] = {
	range=empty,
	ammo="Crepuscular Pebble",
	head="Nyame Helm",
	body="Nyame Mail",
	hands="Nyame Gauntlets",
	legs="Nyame Flanchard",
	feet="Nyame Sollerets",
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
	ammo="Pemphredo Tathlum",
	head="Nyame Helm",
	body="Nyame Mail",
	hands="Nyame Gauntlets",
	legs="Nyame Flanchard",
	feet="Nyame Sollerets",
	neck="Baetyl Pendant",
	waist="Sacro Cord",
	left_ear="Regal Earring",
	right_ear="Malignance Earring",
	left_ring="Weather. Ring +1",																		
	right_ring="Freke Ring",
	back=gear.jse_mab_back,
}
	
sets.precast.WS['Sanguine Blade'] = set_combine(sets.precast.WS['Seraph Blade'], {head="Pixie Hairpin +1",left_ring="Archon Ring"})
	
sets.precast.WS['Evisceration'] = sets.precast.WS['Chant Du Cygne']
sets.precast.WS['Aeolian Edge'] = set_combine(sets.precast.WS['Seraph Blade'], {})

-- Midcast Sets
sets.TreasureHunter = set_combine(sets.TreasureHunter, {})

-- Gear that converts elemental damage done to recover MP.	
sets.RecoverMP = {body="Seidr Cotehardie"}

-- Gear for Magic Burst mode.
sets.MagicBurst = {
	main="Bunzi's Rod",																			-- 7
	sub="Ammurapi Shield",
	range=empty,
	ammo="Pemphredo Tathlum",
	head=gear.BurstHead,																		-- 8
	body=gear.BurstBody,
	hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
	legs=gear.BurstLegs,																		-- 8
	feet="Jhakri Pigaches +2",																	-- 7
	neck="Mizu. Kubikazari",																	-- 10
	waist=gear.ElementalObi,
	left_ear="Regal Earring",
	right_ear="Malignance Earring",
	left_ring="Mujin Band",																		
	right_ring="Freke Ring",
	back=gear.jse_mab_back,
}

sets.midcast.FastRecast = sets.precast.FC

sets.midcast.Cure = {
	main="Bunzi's Rod",										-- 30
	sub="Ammurapi Shield",
	range=empty,
	ammo="Hydrocera",
	head="Nyame Helm",
	body="Nyame Mail",
	hands="Kaykaus Cuffs +1",								-- 11
	legs="Nyame Flanchard",
	feet="Vanya Clogs",
	neck="Incanter's Torque",
	waist="Luminary Sash",
	left_ear="Regal Earring",
	right_ear="Mendi. Earring",								-- 5
	left_ring="Stikini Ring +1",
	right_ring={name="Lebeche Ring",priority=500},
	back="Solemnity Cape",									-- 7
}
	
sets.midcast.LightWeatherCure = set_combine(sets.midcast.Cure, { main="Chatoyant Staff", sub="Enki Strap", waist="Korin Obi" })
sets.midcast.LightDayCure = set_combine(sets.midcast.Cure, { main="Chatoyant Staff", sub="Enki Strap", waist="Korin Obi" })
	
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
	feet="Leth. Houseaux +1",														-- 30%
	neck="Dls. Torque +2",															-- ?
	waist="Embla Sash",																-- 10%
	left_ear="Genmei Earring",
	right_ear="Etiolation Earring",
	left_ring="Defending Ring",
	right_ring="Gelatinous Ring +1",
	back=gear.jse_macc_back,														-- 20%
}

--Atrophy Gloves are better than Lethargy for me despite the set bonus for duration on others.		
sets.buff.ComposureOther = --set_combine(sets.midcast['Enhancing Magic'], {
{		
	head="Leth. Chappel +1",
	body="Lethargy Sayon +1",
	hands="Leth. Gantherots +1",
	legs="Leth. Fuseau +1",
	feet="Leth. Houseaux +1",
}

	
--Red Mage enhancing sets are handled in a different way from most, layered on due to the way Composure works
--Don't set combine a full set with these spells, they should layer on Enhancing Set > Composure (If Applicable) > Spell
sets.EnhancingSkill = {
	sub="Ammurapi Shield",
	range=empty,
	ammo="Staunch Tathlum +1",
	head="Befouled Crown",
	body={ name="Viti. Tabard +3", augments={'Enhances "Chainspell" effect',}},
	hands={ name="Viti. Gloves +3", augments={'Enhancing Magic duration',}},
	legs="Atrophy Tights +3",
	feet="Leth. Houseaux +1",
	neck="Incanter's Torque",
	waist="Flume Belt +1",
	left_ear="Andoaa Earring",			-- 5
	right_ear="Mimir Earring",			-- 10
	left_ring="Defending Ring",
	right_ring="Stikini Ring +1",
	back=gear.jse_skill_back,
}

sets.midcast.Refresh = {head="Amalric Coif +1",body="Atrophy Tabard +3",hands="Atrophy Gloves +3",legs="Leth. Fuseau +1"}
sets.midcast.Aquaveil = {head="Amalric Coif +1",hands="Regal Cuffs"}
sets.midcast.BarElement = {}
sets.midcast.Temper = sets.EnhancingSkill
sets.midcast.Temper.DW = set_combine(sets.midcast.Temper, {})
sets.midcast.Enspell = sets.midcast.Temper
sets.midcast.Enspell.DW = set_combine(sets.midcast.Enspell, {})
sets.midcast.BoostStat = {hands="Viti. Gloves +3"}
sets.midcast.Stoneskin = {neck="Nodens Gorget",waist="Siegel Sash"}
sets.midcast.Protect = {}
sets.midcast.Shell = {}

sets.midcast['Phalanx'] = {
	sub="Ammurapi Shield",
	range=empty,
	ammo="Staunch Tathlum +1",
	head=gear.taeon_phalanx_head,		-- Phalanx +3
	body=gear.taeon_phalanx_body,		-- Phalanx +3
	hands=gear.taeon_phalanx_hands,		-- Phalanx +3
	legs=gear.taeon_phalanx_legs,		-- Phalanx +3
	feet=gear.taeon_phalanx_feet,		-- Phalanx +3
	neck="Incanter's Torque",			-- 10
	waist="Flume Belt +1",
	left_ear="Andoaa Earring",			-- 5
	right_ear="Mimir Earring",			-- 10
	left_ring="Defending Ring",
	right_ring="Stikini Ring +1",		-- 8
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
	ammo={name="Regal Gem", priority=15},
	head={ name="Viti. Chapeau +3", augments={'Enfeebling Magic duration','Magic Accuracy',}},
	body="Lethargy Sayon +1",
	hands="Regal Cuffs",
	legs=gear.chironic_enfeeble_legs,
	feet={ name="Vitiation Boots +3", augments={'Immunobreak Chance',}},
	neck="Dls. Torque +2",
	waist="Obstin. Sash",
	left_ear="Regal Earring",
	right_ear="Snotra Earring",
	left_ring={name="Kishar Ring", priority=15},
	right_ring="Stikini Ring +1",
	back=gear.jse_macc_back,
}
	
-- -20% Duration
-- -24% Potency
-- +92 Macc/skill
sets.midcast['Enfeebling Magic'].Resistant = set_combine(sets.midcast['Enfeebling Magic'], {
	range={name="Ullr", priority=1},
	ammo=empty,
	body="Atrophy Tabard +3",
	hands={ name="Kaykaus Cuffs +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
	left_ring="Metamorph Ring +1",
	right_ring="Stikini Ring +1",
})

sets.midcast['Enfeebling Magic'].Resistant.INT = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {
	main="Bunzi's Rod", 
	left_ring={name="Metamorph Ring +1", priority=1},
})
	
sets.midcast.DurationOnlyEnfeebling = set_combine(sets.midcast['Enfeebling Magic'], {
	range={name="Ullr", priority=1},
	ammo=empty,
	body="Atrophy Tabard +3", 
})

sets.midcast.DurationOnlyEnfeebling.INT = set_combine(sets.midcast['Enfeebling Magic'], {
	range={name="Ullr", priority=1},
	ammo=empty,
	main="Bunzi's Rod", 
	body="Atrophy Tabard +3", 
})	
	
sets.midcast.Silence = sets.midcast.DurationOnlyEnfeebling
sets.midcast.Silence.Resistant = sets.midcast['Enfeebling Magic'].Resistant
sets.midcast.Sleep = set_combine(sets.midcast.DurationOnlyEnfeebling.INT,{})
sets.midcast.Sleep.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant.INT,{})

sets.midcast['Sleep'] = set_combine(sets.midcast.DurationOnlyEnfeebling.INT,{})
sets.midcast['Sleepga'] = set_combine(sets.midcast.DurationOnlyEnfeebling.INT,{})
sets.midcast['Sleep II'] = set_combine(sets.midcast.DurationOnlyEnfeebling.INT,{})
sets.midcast['Sleep'].Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant.INT, {})
sets.midcast['Sleepga'].Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant.INT, {})
sets.midcast['Sleep II'].Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant.INT, {})

sets.midcast.Bind = set_combine(sets.midcast.DurationOnlyEnfeebling.INT,{})
sets.midcast.Bind.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant.INT,{})
sets.midcast.Break = set_combine(sets.midcast.DurationOnlyEnfeebling.INT,{})
sets.midcast.Break.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant.INT,{})

sets.midcast.Dispel = sets.midcast['Enfeebling Magic'].Resistant

sets.midcast.SkillBasedEnfeebling = set_combine(sets.midcast['Enfeebling Magic'], {})

sets.midcast['Frazzle II'] = sets.midcast['Enfeebling Magic'].Resistant
sets.midcast['Frazzle III'] = sets.midcast.SkillBasedEnfeebling
sets.midcast['Frazzle III'].Resistant = sets.midcast['Enfeebling Magic'].Resistant

sets.midcast['Distract II'] = sets.midcast['Enfeebling Magic'].Resistant
sets.midcast['Distract III'] = sets.midcast.SkillBasedEnfeebling
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
sets.midcast['Dia III'] = set_combine(sets.midcast['Enfeebling Magic'], {waist="Chaac Belt"})

sets.midcast.Bio = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
sets.midcast['Bio II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
sets.midcast['Bio III'] = set_combine(sets.midcast['Enfeebling Magic'], {head="Viti. Chapeau +3",waist="Chaac Belt",feet=gear.chironic_treasure_feet})

-- Elemental
sets.midcast['Elemental Magic'] = {
	main="Bunzi's Rod",
	sub="Ammurapi Shield",
	ammo="Pemphredo Tathlum",
	head="C. Palug Crown",
	body="Shamash Robe",
	hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
	legs="Ea Slops +1",
	feet="Vitiation Boots +3",
	neck="Dls. Torque +2",
	waist=gear.ElementalObi,
	left_ear="Regal Earring",
	right_ear="Malignance Earring",
	left_ring="Metamor. Ring +1",
	right_ring="Freke Ring",
	back=gear.jse_mab_back,
}
		
sets.midcast['Elemental Magic'].Resistant = set_combine(sets.midcast['Elemental Magic'], {})
		
sets.midcast['Elemental Magic'].HighTierNuke = set_combine(sets.midcast['Elemental Magic'], {})
sets.midcast['Elemental Magic'].HighTierNuke.Resistant = set_combine(sets.midcast['Elemental Magic'].Resistant, {})

sets.midcast.Impact = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {head=empty, body=gear.impact_body})

sets.midcast['Dark Magic'] = {
	main="Bunzi's Rod",
	sub="Ammurapi Shield",
	ammo="Pemphredo Tathlum",
	head="Pixie Hairpin +1",
	body="Atrophy Tabard +3",
	hands="Regal Cuffs",
	legs="Ea Slops +1",
	feet="Jhakri Pigaches +2",
	neck="Erra Pendant",
	waist="Fucho-no-obi",
	left_ear="Regal Earring",
	right_ear="Malignance Earring",
	left_ring="Evanescence Ring",
	right_ring="Archon Ring",
	back=gear.jse_mab_back,
}

sets.midcast.Drain = sets.midcast['Dark Magic']
sets.midcast.Aspir = sets.midcast.Drain
	
sets.midcast.Stun = set_combine(sets.midcast['Enfeebling Magic'], {})
sets.midcast.Stun.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})

-- Sets for special buff conditions on spells.
sets.buff.Saboteur = {hands="Leth. Gantherots +1"}
sets.buff.Doom = set_combine(sets.buff.Doom, {})

-- Idle sets
sets.idle = {
	main="Daybreak",
	sub="Genmei Shield",
	ammo="Homiliary",
	head={ name="Viti. Chapeau +3", augments={'Enfeebling Magic duration','Magic Accuracy',}},
	body="Shamash Robe",
	hands=gear.chironic_refresh_hands,
	legs="Nyame Flanchard",
	feet=gear.chironic_refresh_feet,
	neck="Sanctity Necklace",
	waist="Flume Belt +1",
	left_ear="Infused Earring",
	right_ear="Etiolation Earring",
	left_ring={name="Defending Ring",priority=50},
	right_ring="Stikini Ring +1",
	back=gear.jse_macc_back,
}

sets.idle.DT = 
{
	main="Daybreak",
	sub="Genmei Shield",																		-- 10
	ammo="Homiliary",
	head={ name="Viti. Chapeau +3", augments={'Enfeebling Magic duration','Magic Accuracy',}},
	body="Shamash Robe",																		-- 10
	hands="Nyame Gauntlets",
	legs="Nyame Flanchard",
	feet="Nyame Sollerets",
	neck="Sanctity Necklace",
	waist="Flume Belt +1",																		-- 4
	left_ear="Infused Earring",
	right_ear="Etiolation Earring",
	left_ring={name="Defending Ring",priority=50},												-- 10
	right_ring="Stikini Ring +1",
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
	neck="Dls. Torque +2",
	waist="Obstin. Sash",
	left_ear="Telos Earring",
	right_ear="Crepuscular Earring",
	left_ring="Metamor. Ring +1",
	right_ring="Stikini Ring +1",
	back=gear.jse_macc_back,
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

sets.idle.Weak = sets.idle.DT
sets.resting = sets.idle	

sets.Kiting = {legs="Carmine Cuisses +1"}
sets.latent_refresh = {waist="Fucho-no-obi"}
sets.latent_refresh_grip = {}
sets.TPEat = {}
sets.DayIdle = {}
sets.NightIdle = {}

sets.buff.Sublimation = {waist="Embla Sash"}
sets.buff.DTSublimation = {waist="Embla Sash"}

-- Engaged sets
sets.engaged = {
	ammo="Ginsen",
	head="Malignance Chapeau",
	body="Malignance Tabard",
	hands="Malignance Gloves",
	legs="Malignance Tights",
	feet="Malignance Boots",
	neck="Combatant's Torque",
	waist="Windbuffet Belt +1",
	left_ear="Sherida Earring",
	right_ear="Telos Earring",
	left_ring="Petrov Ring",
	right_ring="Ilabrat Ring",
	back=gear.jse_da_back,
}
	
sets.engaged.DW = set_combine(sets.engaged, {waist="Reiki Yotai", right_ear="Suppanomimi"})		
