if item_available('Crepuscular Cloak') then
	gear.impact_body = "Crepuscular Cloak"
else
	gear.impact_body = "Twilight Cloak"
end

if item_available("Wicce Earring +2") then
	gear.empy_earring = "Wicce Earring +2"
else
	gear.empy_earring = "Malignance Earring"
end


-- Weapons sets
sets.weapons.Khatvanga = {main="Khatvanga",sub="Khonsu"}
sets.weapons.Marin = {main="Marin Staff +1",sub="Khonsu"}
sets.weapons.Xoanon = {main="Xoanon",sub="Khonsu"}
sets.weapons.Opashoro = {main="Opashoro",sub="Khonsu"}


sets.buff.Sublimation = {waist="Embla Sash"}
sets.buff.DTSublimation = {waist="Embla Sash"}	

-- Treasure Hunter
sets.TreasureHunter = set_combine(sets.TreasureHunter, {})

---- Precast Sets ----
sets.precast.JA['Mana Wall'] = {back=gear.jse_mab_back,feet="Wicce Sabots +3"}
sets.precast.JA.Manafont = {body="Arch. Coat +1"}
sets.precast.JA.Convert = {}


-- Fast cast sets for spells
-- BLM for elemental has -8% so 72% FC needed.

-- 81% FC
-- 3% QC
sets.precast.FC = {
    main="Daybreak",																									
	sub="Chanter's Shield",																								-- 3
	ammo="Impatiens",																									-- QC
	head=gear.merlinic_fc_head,																			 				-- 15
	body="Agwu's Robe",																									-- 8
	hands=gear.merlinic_fc_hands, 																						-- 6
	legs={ name="Psycloth Lappas", augments={'MP+80','Mag. Acc.+15','"Fast Cast"+7',}}, 								-- 7
	feet=gear.merlinic_fc_feet,																 							-- 11
	neck="Baetyl Pendant",																								-- 4
	waist="Embla Sash",																									-- 5
	left_ear="Loquac. Earring",																							-- 2
	right_ear="Malignance Earring",																						-- 4
	left_ring=gear.weather_ring,																						-- 6
	right_ring="Lebeche Ring",																							-- QC
	back=gear.jse_fc_back,																								-- 10
}

	
sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {})
sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {})
sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {ammo="Sapience Orb", left_ring="Kishar Ring", right_ring="Crepuscular Ring"})
sets.precast.FC.Cure = set_combine(sets.precast.FC, {})
sets.precast.FC.Curaga = sets.precast.FC.Cure

sets.precast.FC.Impact = set_combine(sets.precast.FC, {head=empty,body=gear.impact_body})
sets.precast.FC.Dispelga = set_combine(sets.precast.FC, {main="Daybreak",sub="Genmei Shield"})

		-- FC + MP
			sets.precast.FC.Death = set_combine(sets.precast.FC, {
			})

-- Weaponskill sets
sets.precast.WS = {
	ammo="Oshasha's Treatise",
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
    right_ring="Rufescent Ring",
	back=gear.dt_moon_back,
}

sets.precast.WS['Myrkr'] = {
	ammo=gear.dt_ammo,
	head="Nyame Helm",
	body="Nyame Mail",
	hands="Nyame Gauntlets",
	legs="Nyame Flanchard",
	feet="Nyame Sollerets",
	neck="Fotia Gorget",
	waist="Fotia Belt",
	left_ear="Ishvara Earring",
	right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
	left_ring="Vertigo Ring",
	right_ring="Rufescent Ring",
	back=gear.jse_mab_back,
}
	
sets.MaxTPMyrkr = {}


---- Midcast Sets ----

-- Burst Sets --
sets.RecoverMP = {body="Spaekona's Coat +3"}

-- Gear for Magic Burst mode.
sets.MagicBurst = {
	main="Bunzi's Rod",					-- 10								
	sub="Ammurapi Shield",
	ammo="Ghastly Tathlum +1",
	head="Ea Hat +1",					-- 7 / 7 II
	body="Wicce Coat +3",				-- 	 / 5 II
	hands="Agwu's Gages",				-- 8 / 5 II
	legs="Wicce Chausses +3",			-- 15
	feet="Wicce Sabots +3",
	neck=gear.blm_jse_neck,				-- 10/8
    waist="Sacro Cord",
	left_ear="Regal Earring",
	right_ear=gear.empy_earring,
	left_ring="Medada's Ring",
	right_ring="Freke Ring",
	back=gear.jse_mab_back,				-- 5													
}

sets.ResistantMagicBurst = set_combine(sets.MagicBurst, {main="Marin Staff +1", sub="Khonsu", hands="Spae. Gloves +3",})
sets.MagicEffectDurationBurst = set_combine(sets.MagicBurst, {legs="Wicce Chausses +3"})

sets.midcast.FastRecast = sets.precast.FC
sets.midcast.Cure = {
	main="Bunzi's Rod",																									-- 30
	sub="Ammurapi Shield",
	head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},											-- 10
	body="Vedic Coat",
	hands="Nyame Gauntlets",
	legs="Vanya Slops",
	feet={ name="Vanya Clogs", augments={'"Cure" potency +5%','"Cure" spellcasting time -15%','"Conserve MP"+6',}},		-- 10
	neck="Incanter's Torque",
	waist="Luminary Sash",																								-- CMP 4
	left_ear="Magnetic Earring",																						-- CMP 5
	right_ear="Calamitous Earring",																						-- CMP 4
	left_ring="Vertigo Ring",
	right_ring="Lebeche Ring",
	back="Solemnity Cape",																								-- CMP 5
}
	
sets.midcast.LightWeatherCure = set_combine(sets.midcast.Cure, {
	main="Chatoyant Staff",
	sub="Khonsu",
	waist="Korin Obi",
})
	
sets.midcast.LightDayCure = sets.midcast.LightWeatherCure

sets.midcast.Curaga = sets.midcast.Cure
sets.midcast.Cursna = set_combine(sets.midcast.Cure, {neck="Debilis Medallion",ring1="Haoma's Ring",ring2="Menelaus's Ring"})
sets.midcast.StatusRemoval = set_combine(sets.midcast.FastRecast, {})

sets.midcast['Enhancing Magic'] = {
	main=gear.gada_enhancing_club, 					-- 5% 	-18 Skill
	sub="Ammurapi Shield",							-- 10%
	head=gear.telchine_enhancing_head,				-- 8%
	body=gear.telchine_enhancing_body,				-- 10% 	-12 Skill
	hands=gear.telchine_enhancing_hands,			-- 8%
	legs=gear.telchine_enhancing_legs,				-- 9%
	feet=gear.telchine_enhancing_feet,				-- 9%
	neck="Incanter's Torque",						-- 		-10 Skill
	waist="Embla Sash",								-- 10%
	left_ear="Andoaa Earring",						--		-5 Skill
	right_ear="Etiolation Earring",
	left_ring="Defending Ring",
	right_ring="Gelatinous Ring +1",
	back="Solemnity Cape",
}

sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {neck="Nodens Gorget",waist="Siegel Sash"})
sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {head="Amalric Coif +1",feet="Inspirited Boots",waist="Gishdubar Sash"})
sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {main="Vadose Rod",sub="Genmei Shield",head="Amalric Coif +1",hands="Regal Cuffs"})
sets.midcast.BarElement = set_combine(sets.midcast['Enhancing Magic'], {})

sets.midcast['Enfeebling Magic'] = {
	main="Daybreak",
	sub="Ammurapi Shield",
	ammo="Pemphredo Tathlum",
	head="C. Palug Crown",
	body="Spaekona's Coat +3",
	hands="Spae. Gloves +3",
	legs="Wicce Chausses +3",
	feet="Wicce Sabots +3",
	neck=gear.blm_jse_neck,
	waist="Sacro Cord",
	left_ear="Regal Earring",
	right_ear=gear.empy_earring,
	left_ring="Kishar Ring",
	right_ring={name="Metamorph Ring +1",priority=500},
	back=gear.jse_mab_back,
}
	
sets.midcast['Enfeebling Magic'].Resistant = set_combine(sets.midcast['Enfeebling Magic'], {
	left_ring="Vertigo Ring",
})
	
sets.midcast.IntEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {main="Bunzi's Rod", waist="Sacro Cord",})
sets.midcast.IntEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {main="Bunzi's Rod", waist="Sacro Cord",})
sets.midcast.MndEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {waist="Luminary Sash"})
sets.midcast.MndEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {waist="Luminary Sash"})

sets.midcast.Dia = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
sets.midcast['Dia II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
sets.midcast.Bio = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
sets.midcast['Bio II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)

sets.midcast['Dispelga'] = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {main="Daybreak"})
sets.midcast['Divine Magic'] = set_combine(sets.midcast['Enfeebling Magic'], {})

sets.midcast['Dark Magic'] = {
	main="Bunzi's Rod",
	sub="Ammurapi Shield",
	ammo="Pemphredo Tathlum",
	head="Pixie Hairpin +1",
	body="Spaekona's Coat +3",
	hands="Agwu's Gages",
	legs="Wicce Chausses +3",
	feet="Wicce Sabots +3",
	neck="Erra Pendant",
	waist="Sacro Cord",
	left_ear="Regal Earring",
	right_ear=gear.empy_earring,
	left_ring="Evanescence Ring",
	right_ring="Archon Ring",
	back=gear.jse_mab_back,
}

sets.midcast.Drain = set_combine(sets.midcast['Dark Magic'], {waist="Fucho-no-obi", feet="Agwu's Pigaches"})
sets.midcast.Aspir = set_combine(sets.midcast['Dark Magic'], {waist="Fucho-no-obi", feet="Agwu's Pigaches"})
		
					sets.midcast.Aspir.Death = set_combine(sets.midcast.Aspir, {})
		
sets.midcast.Death = set_combine(sets.MagicBurst, {
	head="Pixie Hairpin +1",
	right_ring="Archon Ring",
})

sets.midcast.Stun = set_combine(sets.midcast['Enfeebling Magic'], {})
sets.midcast.Stun.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})

sets.midcast.BardSong = {}
	
sets.midcast.Impact = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {
	main="Bunzi's Rod",
	head=empty,
	body=gear.impact_body,
})
	
-- Elemental Magic sets
sets.midcast['Elemental Magic'] = {
	main="Bunzi's Rod",
	sub="Ammurapi Shield",
	ammo="Pemphredo Tathlum",
	head="Arch. Petasos +3",
	body="Wicce Coat +3",
	hands="Agwu's Gages",
	legs="Wicce Chausses +3",
	feet="Wicce Sabots +3",
	neck=gear.blm_jse_neck,
	waist="Sacro Cord",
	left_ear="Regal Earring",
	right_ear=gear.empy_earring,
	left_ring="Medada's Ring",
	right_ring="Freke Ring",
	back=gear.jse_mab_back,
}
	
sets.midcast['Elemental Magic'].Resistant = set_combine(sets.midcast['Elemental Magic'], {
	hands="Spae. Gloves +3",
})
	
sets.midcast['Elemental Magic'].HighTierNuke = set_combine(sets.midcast['Elemental Magic'], {})
sets.midcast['Elemental Magic'].HighTierNuke.Resistant = set_combine(sets.midcast['Elemental Magic'].Resistant, {})

sets.midcast.ElementalEnfeeble = set_combine(sets.midcast['Elemental Magic'], {hands="Spae. Gloves +3",legs="Agwu's Slops",feet="Arch. Sabots +3"})
sets.midcast.ElementalEnfeeble.Resistant = set_combine(sets.midcast.ElementalEnfeeble, {})
sets.midcast.Helix = sets.midcast['Elemental Magic']
sets.midcast.Helix.Resistant = sets.midcast['Elemental Magic'].Resistant
	
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
	

-- Normal refresh idle set
sets.idle = {
	main="Daybreak",
	sub="Genmei Shield",
	ammo=gear.dt_ammo,
	head=gear.merlinic_refresh_head,
	body="Wicce Coat +3",
	hands="Nyame Gauntlets",
	legs="Assid. Pants +1",
	feet="Wicce Sabots +3",
	neck="Sanctity Necklace",
	waist="Porous Rope",
	left_ear="Infused Earring",
	right_ear="Etiolation Earring",
	left_ring="Defending Ring",
	right_ring=gear.stikini_ring,
	back=gear.jse_mab_back,
}

sets.idle.DT = {
	main="Daybreak",
	sub="Genmei Shield",
	ammo=gear.dt_ammo,
	head=gear.merlinic_refresh_head,
	body="Wicce Coat +3",
	hands="Nyame Gauntlets",
	legs="Assid. Pants +1",
	feet="Wicce Sabots +3",
	neck="Loricate Torque +1",
	waist="Porous Rope",
	left_ear="Odnowa Earring +1",
	right_ear="Etiolation Earring",
	left_ring="Defending Ring",
	right_ring=gear.stikini_ring,
	back=gear.jse_mab_back,
}
	
				sets.idle.Death = {}

sets.idle.Town = set_combine(sets.idle.DT, {
	body="Shamash Robe",
})

-- Defense sets
sets.defense.PDT = {
	main="Daybreak",
	sub="Genmei Shield",
	ammo=gear.dt_ammo,
	head="Nyame Helm",
	body="Adamantite Armor",
	hands="Nyame Gauntlets",
	legs="Nyame Flanchard",
	feet="Nyame Sollerets",
	neck="Loricate Torque +1",
	waist="Porous Rope",
	left_ear="Odnowa Earring +1",
	right_ear="Etiolation Earring",
	left_ring="Defending Ring",
	right_ring="Gelatinous Ring +1",
	back=gear.dt_moon_back,
}

sets.defense.MDT = sets.defense.PDT
sets.defense.MEVA = sets.defense.MDT 

sets.idle.Weak = sets.defense.PDT
sets.resting = sets.defense.PDT

sets.Kiting = {feet=gear.movement_gaiters_feet}
sets.latent_refresh = {waist="Fucho-no-obi"}
sets.latent_refresh_grip = {}
sets.TPEat = {}
sets.DayIdle = {}
sets.NightIdle = {}

-- Buff sets: Gear that needs to be worn to actively enhance a current player buff.

sets.HPDown = {}
sets.HPCure = {}
sets.buff.Doom = set_combine(sets.buff.Doom, {})
sets.buff['Mana Wall'] = {back=gear.jse_mab_back,feet="Wicce Sabots +3"}

-- Gear for specific elemental nukes.
sets.element.Dark = {head="Pixie Hairpin +1",ring2="Archon Ring"}

-- Engaged sets
sets.engaged = {
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Combatant's Torque",
    waist="Grunfeld Rope",
    left_ear="Telos Earring",
    right_ear="Crepuscular Earring",
    left_ring="Chirich Ring +1",
    right_ring="Petrov Ring",
    back=gear.dt_moon_back,
}

--Situational sets: Gear that is equipped on certain targets
sets.Self_Healing = {waist="Gishdubar Sash"}
sets.Cure_Received = {waist="Gishdubar Sash"}
sets.Self_Refresh = {waist="Gishdubar Sash",feet="Inspirited Boots"}