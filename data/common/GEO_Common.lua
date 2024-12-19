--------------------------------------
-- Gear selection
--------------------------------------

if item_available('Shamash Robe') then
	gear.town_body_idle = 'Shamash Robe'
else
	gear.town_body_idle = "Agwu's Robe"
end

if item_available('Crepuscular Cloak') then
	gear.impact_body = "Crepuscular Cloak"
else
	gear.impact_body = "Twilight Cloak"
end

--Burst gear
if item_available("Ea Hat +1") then
	gear.BurstHead = "Ea Hat +1"
else
	gear.BurstHead = "Agwu's Cap"
end

--Empy
if item_available("Azimuth Hood +3") then
	gear.jse_empy_head = "Azimuth Hood +3"
elseif item_available("Azimuth Hood +2") then
	gear.jse_empy_head = "Azimuth Hood +2"
else
	gear.jse_empy_head = "Azimuth Hood +1"
end

if item_available("Azimuth Coat +3") then
	gear.jse_empy_body = "Azimuth Coat +3"
elseif item_available("Azimuth Coat +2") then
	gear.jse_empy_body = "Azimuth Coat +2"
else
	gear.jse_empy_body = "Azimuth Coat +1"
end

if item_available("Azimuth Tights +3") then
	gear.jse_empy_legs = "Azimuth Tights +3"
elseif item_available("Azimuth Tights +2") then
	gear.jse_empy_legs = "Azimuth Tights +2"
else
	gear.jse_empy_legs = "Azimuth Tights +1"
end

if item_available("Azimuth Gaiters +3") then
	gear.jse_empy_feet = "Azimuth Gaiters +3"
elseif item_available("Azimuth Gaiters +2") then
	gear.jse_empy_feet = "Azimuth Gaiters +2"
else
	gear.jse_empy_feet = "Azimuth Gaiters +1"
end

if item_available("Azimuth Earring +2") then
	gear.empy_earring = "Azimuth Earring +2"
else
	gear.empy_earring = "Azimuth Earring +1"
end

--------------------------------------
-- Precast sets
--------------------------------------

-- Precast sets to enhance JAs
sets.precast.JA.Bolster = {body="Bagua Tunic"}
sets.precast.JA['Life Cycle'] = {body="Geomancy Tunic +3", back=gear.jse_pet_back}
sets.precast.JA['Radial Arcana'] = {feet="Bagua Sandals +3"}
sets.precast.JA['Mending Halation'] = {legs="Bagua Pants +3"}
sets.precast.JA['Full Circle'] = {head=gear.jse_empy_head,hands="Bagua Mitaines +3"}

sets.weapons.Idris = {main="Idris",sub="Genmei Shield"}
sets.weapons.LorgMor = {main="Lorg Mor",sub="Genmei Shield"}
sets.weapons.IdrisAmmurapi = {main="Idris",sub="Ammurapi Shield"}
sets.weapons.DualClub = {main="Idris",sub="Bunzi's Rod"}

-- Indi Duration in slots that would normally have skill here to make entrust more efficient.

-- Relic hat for Blaze of Glory HP increase.
sets.buff['Blaze of Glory'] = {}

-- Fast cast sets for spells
-- RDM sub = %15
--
-- 89%

sets.precast.FC = {
	main="Solstice",																								-- 5
	sub="Chanter's Shield",																							-- 3
	range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},										-- 3
	head=gear.merlinic_fc_head,																						-- 15
	body="Shango Robe",																								-- 8
	hands=gear.merlinic_fc_hands,																					-- 6
	legs="Geomancy Pants +3",																						-- 15
	feet=gear.merlinic_fc_feet,																						-- 11
	neck="Baetyl Pendant",	    																					-- 4
	waist="Embla Sash",																								-- 5
	left_ear="Loquac. Earring",																						-- 2
	right_ear="Etiolation Earring",																					-- 1
	left_ring=gear.weather_ring,																					-- 6
	right_ring={name="Gelatinous Ring +1",priority=500},
	back=gear.jse_skill_back,																						-- 7
}

sets.precast.FC.DT = set_combine(sets.precast.FC, {back="Solemnity Cape",left_ear={name="Odnowa Earring +1",priority=500},})

sets.precast.FC.Geomancy = set_combine(sets.precast.FC, { neck=gear.geo_jse_neck })
sets.precast.FC.Geomancy.Indi = sets.precast.FC.Geomancy		
sets.precast.FC.Cure = set_combine(sets.precast.FC, {})
sets.precast.FC.Curaga = sets.precast.FC.Cure

sets.precast.FC.Geomancy.DT = set_combine(sets.precast.FC.DT, { neck=gear.geo_jse_neck })
sets.precast.FC.Geomancy.Indi.DT = sets.precast.FC.Geomancy.DT
sets.precast.FC.Cure.DT = set_combine(sets.precast.FC.DT, {})
sets.precast.FC.Curaga.DT = sets.precast.FC.Cure.DT

sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {left_ring="Kishar Ring",})
sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {})
sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {})
sets.precast.FC.Impact = set_combine(sets.precast.FC, {head=empty,body=gear.impact_body, right_ring="Medada's Ring", back=gear.jse_fc_back})

sets.precast.FC['Elemental Magic'].DT = set_combine(sets.precast.FC.DT, {left_ring="Kishar Ring",})
sets.precast.FC['Enhancing Magic'].DT = set_combine(sets.precast.FC.DT, {})
sets.precast.FC.Stoneskin.DT = set_combine(sets.precast.FC['Enhancing Magic'].DT, {})
sets.precast.FC.Impact.DT = set_combine(sets.precast.FC, {head=empty,body=gear.impact_body})

sets.precast.FC['Dispelga'] = set_combine(sets.precast.FC, {main="Daybreak",sub="Genmei Shield"})

sets.Self_Healing = {}
sets.Cure_Received = {}
sets.Self_Refresh = {}

-- Weaponskill sets
-- Default set for any weaponskill that isn't any more specifically defined
sets.precast.WS = {
	range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
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
	back=gear.jse_ws_back,
}

-- 20 SB + More ACC
sets.precast.WS.SubtleBlow = set_combine(sets.precast.WS, {
	neck="Combatant's Torque",
    left_ear="Digni. Earring",
	right_ear="Telos Earring",
	left_ring="Chirich Ring +1",
})
--------------------------------------
-- Midcast sets
--------------------------------------

sets.midcast.FastRecast = sets.precast.FC

-- Skill gear + MP not depleted + Conserve MP
-- 850 Skill + 55
-- 101% Conserve MP goal, GEO has 43%, need 57% to cap
-- CMP: 58%
sets.midcast.Geomancy = {
	main="Idris",			
	sub="Genmei Shield",
	range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
	head=gear.jse_empy_head,
	body="Vedic Coat",																-- CMP 10
	hands="Shrieker's Cuffs",														-- CMP 7
	legs="Vanya Slops",																-- CMP 12
	feet=gear.jse_empy_feet,
	neck="Loricate Torque +1",
	waist="Shinjutsu-no-Obi +1",													-- CMP 15
	left_ear="Magnetic Earring",													-- CMP 5
	right_ear="Calamitous Earring",													-- CMP 4
	left_ring="Defending Ring",
	right_ring="Gelatinous Ring +1",
	back="Solemnity Cape",															-- CMP 5
}

sets.midcast.Geomancy.DT = set_combine(sets.midcast.Geomancy, {})
-- Indi Duration gear + Skill + Conserve MP
-- 180 Base + 40s JP + 35s + 20% = 324s

sets.midcast.Geomancy.Indi = {
	main="Idris",
	sub="Genmei Shield",
	range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
	head=gear.jse_empy_head,
	body="Vedic Coat",
	hands="Nyame Gauntlets",													
	legs=gear.geo_relic_legs, 															-- 15s
	feet=gear.jse_empy_feet,															-- 30s
	neck="Incanter's Torque",
	waist="Shinjutsu-no-Obi +1",														
	left_ear="Magnetic Earring",
	right_ear="Calamitous Earring",
	left_ring="Defending Ring",
	right_ring="Gelatinous Ring +1",
	back=gear.jse_skill_back,															-- 20%
}

sets.midcast.Geomancy.Indi.DT = set_combine(sets.midcast.Geomancy.Indi, {})

sets.midcast.Entrust = set_combine(sets.midcast.Geomancy.Indi, {main="Solstice"})
sets.buff.Entrust = sets.midcast.Entrust
	
-- Cure Potency: 48%
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
	back="Solemnity Cape",																								-- 7
}

sets.midcast.Cure.DT = set_combine(sets.midcast.Cure, {
	sub="Genmei Shield", 
	body="Nyame Mail", 
	hands="Nyame Gauntlets",
	legs="Nyame Flanchard", 
	feet=gear.jse_empy_feet,
	left_ring="Defending Ring", 
	back="Solemnity Cape",
})
	
sets.midcast.LightWeatherCure = set_combine(sets.midcast.Cure, {
	main="Chatoyant Staff",
	sub="Khonsu",
	waist="Korin Obi",
})

sets.midcast.LightDayCure = sets.midcast.LightWeatherCure
sets.midcast.Curaga = sets.midcast.Cure
sets.midcast.Cursna = set_combine(sets.midcast.Cure, {neck="Debilis Medallion",ring1="Haoma's Ring",ring2="Menelaus's Ring"})
sets.midcast.StatusRemoval = set_combine(sets.midcast.FastRecast, {})

--DT
sets.midcast.LightWeatherCure.DT = {waist="Korin Obi"}
sets.midcast.LightDayCure.DT = sets.midcast.LightWeatherCure.DT
sets.midcast.Curaga.DT = sets.midcast.Cure.DT
sets.midcast.Cursna.DT = set_combine(sets.midcast.Cure.DT, {neck="Debilis Medallion",ring1="Haoma's Ring",ring2="Menelaus's Ring"})
sets.midcast.StatusRemoval.DT = set_combine(sets.midcast.FastRecast.DT, {})

---------------
-- Elemental --
---------------
-- Gear for Magic Burst mode.
sets.MagicBurst = {
	main="Bunzi's Rod",																				-- 10
	sub="Ammurapi Shield",
	head=gear.BurstHead,																			-- 7/	7II
	body=gear.jse_empy_body,																		-- 		5II
	hands="Agwu's Gages",																			-- 8/	5II
	legs=gear.jse_empy_legs,																		-- 15
	feet=gear.jse_empy_feet,
	neck="Sanctity Necklace",
	waist="Sacro Cord",
	left_ear="Regal Earring",
	right_ear=gear.empy_earring,
	left_ring="Medada's Ring",																		
	right_ring="Freke Ring",
	back=gear.jse_mab_back,
}

sets.RecoverBurst = set_combine(sets.MagicBurst, {body="Seidr Cotehardie"})

sets.midcast['Elemental Magic'] = {
	main="Bunzi's Rod",
	sub="Ammurapi Shield",
	head=gear.BurstHead,
	body=gear.jse_empy_body,
	hands="Agwu's Gages",
	legs=gear.jse_empy_legs,
	feet=gear.jse_empy_feet,
	neck="Sanctity Necklace",
	waist="Sacro Cord",
	left_ear="Regal Earring",
	right_ear=gear.empy_earring,
	left_ring="Medada's Ring",
	right_ring="Freke Ring",
	back=gear.jse_mab_back,
}

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

sets.midcast['Elemental Magic'].Resistant = sets.midcast['Elemental Magic']
sets.midcast['Elemental Magic'].HighTierNuke = set_combine(sets.midcast['Elemental Magic'], {})
sets.midcast['Elemental Magic'].HighTierNuke.Resistant = set_combine(sets.midcast['Elemental Magic'].Resistant, {})

-- Other magics sets
sets.midcast['Dark Magic'] = {
	main="Bunzi's Rod",
	sub="Ammurapi Shield",
	range="Dunna",
	head="Pixie Hairpin +1",
	body="Geomancy Tunic +3",
	hands="Geomancy Mitaines +3",
	legs=gear.jse_empy_legs,
	feet=gear.jse_empy_feet,
	neck="Erra Pendant",
	waist="Sacro Cord",
	left_ear="Regal Earring",
	right_ear=gear.empy_earring,
	left_ring="Evanescence Ring",
	right_ring="Archon Ring",
	back=gear.jse_mab_back,
}

sets.midcast['Dark Magic'].DT = set_combine(sets.midcast['Dark Magic'], {})
		
sets.midcast.Drain = set_combine(sets.midcast['Dark Magic'], {waist="Fucho-no-obi", feet="Agwu's Pigaches"})
sets.midcast.Aspir = sets.midcast.Drain
sets.midcast.Drain.DT = set_combine(sets.midcast['Dark Magic'].DT, {waist="Fucho-no-obi", feet="Agwu's Pigaches"})
sets.midcast.Aspir.DT = sets.midcast.Drain.DT

sets.midcast['Absorb-TP'] = set_combine(sets.midcast['Dark Magic'], {
	range="Dunna",
	head=gear.jse_empy_head,
	body=gear.jse_empy_body,
	hands="Agwu's Gages",
	legs=gear.jse_empy_legs,
	feet=gear.jse_empy_feet,
	neck="Erra Pendant",
	waist="Luminary Sash",
	left_ear="Crep. Earring",
	right_ear=gear.empy_earring,
	left_ring=gear.stikini_ring,
	right_ring="Metamorph Ring +1",
	back=gear.jse_mab_back,
})
	
sets.midcast['Enfeebling Magic'] = {
	main="Daybreak",
	sub="Ammurapi Shield",
	range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
	head=gear.jse_empy_head,
	body=gear.jse_empy_body,
	hands="Geomancy Mitaines +3",
	legs=gear.jse_empy_legs,
	feet=gear.jse_empy_feet,
	neck=gear.geo_jse_neck,
	waist="Sacro Cord",
	left_ear="Regal Earring",
	right_ear=gear.empy_earring,
	left_ring="Kishar Ring",
	right_ring="Metamorph Ring +1",
	back=gear.jse_mab_back,
}

sets.midcast['Enfeebling Magic'].DT = set_combine(sets.midcast['Enfeebling Magic'], {})
sets.midcast['Enfeebling Magic'].Resistant = set_combine(sets.midcast['Enfeebling Magic'], {left_ring=gear.stikini_ring})
	
sets.midcast.ElementalEnfeeble = set_combine(sets.midcast['Enfeebling Magic'], {main="Bunzi's Rod", waist="Sacro Cord",})
sets.midcast.ElementalEnfeeble.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {main="Bunzi's Rod", waist="Sacro Cord",})
sets.midcast.IntEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {main="Bunzi's Rod", waist="Sacro Cord",})
sets.midcast.IntEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {main="Bunzi's Rod", waist="Sacro Cord",})
sets.midcast.MndEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {waist="Luminary Sash"})
sets.midcast.MndEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {waist="Luminary Sash"})

sets.midcast.Dia = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
sets.midcast['Dia II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
sets.midcast.Bio = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
sets.midcast['Bio II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
sets.midcast['Divine Magic'] = set_combine(sets.midcast['Enfeebling Magic'], {})

sets.midcast['Dispelga'] = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {main="Daybreak"})
sets.midcast['Dispelga'].DT = set_combine(sets.midcast['Enfeebling Magic'].DT, {main="Daybreak"})

sets.midcast.Impact = set_combine(sets.midcast['Enfeebling Magic'], {
	main="Bunzi's Rod",
	sub="Ammurapi Shield",
	head=empty,
	body=gear.impact_body,
	hands="Agwu's Gages",
	legs="Perdition Slops",
	feet=gear.jse_empy_feet,
	neck="Erra Pendant",
	waist="Oneiros Rope",
	left_ear="Dedition Earring",
	right_ear="Crepuscular Earring",
	left_ring=gear.stikini_ring,
    right_ring="Chirich Ring +1",
	back=gear.jse_mab_back,
})

sets.midcast.Stun = sets.midcast['Enfeebling Magic']
sets.midcast.Stun.Resistant = sets.midcast['Enfeebling Magic'].Resistant
sets.midcast.Stun.DT = sets.midcast.Stun
sets.midcast.Stun.Resistant.DT = sets.midcast['Enfeebling Magic'].Resistant

--DT
sets.midcast.ElementalEnfeeble.DT = set_combine(sets.midcast['Enfeebling Magic'].DT, {})
sets.midcast.IntEnfeebles.DT = set_combine(sets.midcast['Enfeebling Magic'].DT, {})
sets.midcast.MndEnfeebles.DT = set_combine(sets.midcast['Enfeebling Magic'].DT, {})

sets.midcast.Dia.DT = set_combine(sets.midcast['Enfeebling Magic'].DT, sets.TreasureHunter)
sets.midcast['Dia II'].DT = set_combine(sets.midcast['Enfeebling Magic'].DT, sets.TreasureHunter)
sets.midcast.Bio.DT = set_combine(sets.midcast['Enfeebling Magic'].DT, sets.TreasureHunter)
sets.midcast['Bio II'].DT = set_combine(sets.midcast['Enfeebling Magic'].DT, sets.TreasureHunter)
sets.midcast['Divine Magic'].DT = set_combine(sets.midcast['Enfeebling Magic'].DT, {})

sets.midcast.Impact.DT = set_combine(sets.midcast['Enfeebling Magic'].DT, {
	main="Bunzi's Rod",
	head=empty,
	body=gear.impact_body,
})
	
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

sets.midcast['Enhancing Magic'].DT = set_combine(sets.midcast['Enhancing Magic'], {neck="Loricate Torque +1",left_ear="Odnowa Earring +1"})
	
sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {neck="Nodens Gorget",waist="Siegel Sash"})
sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {head="Amalric Coif +1",feet="Inspirited Boots",waist="Gishdubar Sash"})
sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {main="Vadose Rod",head="Amalric Coif +1"})
sets.midcast.BarElement = set_combine(sets.midcast['Enhancing Magic'], {})

sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {})
sets.midcast.Protectra = set_combine(sets.midcast['Enhancing Magic'], {})
sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {})
sets.midcast.Shellra = set_combine(sets.midcast['Enhancing Magic'], {})

--DT
sets.midcast.Stoneskin.DT = set_combine(sets.midcast['Enhancing Magic'].DT, {neck="Nodens Gorget", waist="Siegel Sash"})
sets.midcast.Refresh.DT = set_combine(sets.midcast['Enhancing Magic'].DT, {head="Amalric Coif +1",feet="Inspirited Boots", waist="Gishdubar Sash"})
sets.midcast.Aquaveil.DT = set_combine(sets.midcast['Enhancing Magic'].DT, {main="Vadose Rod",head="Amalric Coif +1"})
sets.midcast.BarElement.DT = set_combine(sets.midcast['Enhancing Magic'].DT, {})

sets.midcast.Protect.DT = set_combine(sets.midcast['Enhancing Magic'].DT, {})
sets.midcast.Protectra.DT = set_combine(sets.midcast['Enhancing Magic'].DT, {})
sets.midcast.Shell.DT = set_combine(sets.midcast['Enhancing Magic'].DT, {})
sets.midcast.Shellra.DT = set_combine(sets.midcast['Enhancing Magic'].DT, {})

-- Gear for specific elemental nukes.
sets.element.Wind = {}
sets.element.Ice = {}
sets.element.Earth = {}

--------------------------------------
-- Idle/resting/defense
--------------------------------------

-- Refresh: 7
-- PDT: 47%
sets.idle = {
	main="Daybreak",
	sub="Genmei Shield",																-- 10%
	range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
	head=gear.merlinic_refresh_head,
	body=gear.jse_empy_body,
	hands="Bagua Mitaines +3",
	legs="Assid. Pants +1",
	feet="Geomancy Sandals +3",
	neck="Sanctity Necklace",
	waist="Porous Rope",
	left_ear="Infused Earring",
	right_ear="Etiolation Earring",
	left_ring="Defending Ring",															-- 10%
	right_ring=gear.stikini_ring,													
	back=gear.jse_pet_back,
}
	
sets.idle.DT = {
	main="Daybreak",
	sub="Genmei Shield",																-- 10
	range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},	
	head=gear.jse_empy_head,
	body=gear.jse_empy_body,
	hands="Bagua Mitaines +3",															
	legs="Agwu's Slops",																-- 9
	feet="Geomancy Sandals +3",
	neck="Loricate Torque +1",															-- 6
	waist="Porous Rope",
	left_ear={name="Odnowa Earring +1",priority=500},									-- 3
	right_ear={name="Etiolation Earring",priority=500},														
	left_ring="Defending Ring",															-- 10
	right_ring=gear.stikini_ring,
	back=gear.jse_pet_back,																
}

sets.idle.Town = set_combine(sets.idle.DT, {
	main="Idris",
	body=gear.town_body_idle,
})

-- Pet sets are for when Luopan is present.
-- Regen:	27
-- PET DT:	36/37.5
-- Self DT: 46
sets.idle.Pet = {																										--Regen / Pet DT
	main="Idris",																										-- 0 / 25
	sub="Genmei Shield",
	range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},											-- 0 / 5
	head=gear.jse_empy_head,																							-- 5
	body=gear.jse_empy_body,
	hands="Geomancy Mitaines +3",																						-- 0 / 13
	legs=gear.telchine_pet_legs,																						-- 3
	feet="Bagua Sandals +3",																							-- 5
	neck=gear.geo_jse_neck,
	waist="Isa Belt",																									-- 1 / 3
	left_ear="Odnowa Earring +1",																						
	right_ear="Etiolation Earring",																						
	left_ring="Defending Ring",															-- 10%
	right_ring=gear.stikini_ring,
	back=gear.jse_pet_back,																								-- 15 / 0
}


sets.idle.DT.Pet = {
	main="Idris",
	sub="Genmei Shield",																-- 10
	range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},	
	head=gear.jse_empy_head,															-- 12							-- 5
	body=gear.jse_empy_body,
	hands="Geomancy Mitaines +3",														-- 3							-- 0 / 13
	legs="Agwu's Slops",																-- 9/7		
	feet="Bagua Sandals +3",																							-- 5
	neck=gear.geo_jse_neck,
	waist="Isa Belt",																									-- 1 / 0
	left_ear={name="Odnowa Earring +1",priority=500},									-- 3
	right_ear="Genmei Earring",
	left_ring="Defending Ring",															-- 10
	right_ring=gear.stikini_ring,
	back=gear.jse_pet_back,																								-- 15 / 0
}

sets.idle.Indi = set_combine(sets.idle, {})
sets.idle.Pet.Indi = set_combine(sets.idle.Pet, {})
sets.idle.DT.Indi = set_combine(sets.idle.DT, {}) 
sets.idle.DT.Pet.Indi = set_combine(sets.idle.DT.Pet, {})


-- Defense sets
-- 42% PDT/DT

sets.defense.PDT = {
	main="Daybreak",
	sub="Genmei Shield",
	range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
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
sets.defense.MEVA = sets.defense.PDT

sets.idle.Weak = sets.idle.DT
sets.resting = sets.idle
	
sets.defense.PetPDT = sets.idle.DT.Pet
sets.defense.NukeLock = sets.midcast['Elemental Magic']
sets.defense.GeoLock = sets.midcast.Geomancy.Indi

sets.Kiting = {feet="Geomancy Sandals +3"}
sets.latent_refresh = {waist="Fucho-no-obi"}
sets.DayIdle = {}
sets.NightIdle = {}
sets.TreasureHunter = set_combine(sets.TreasureHunter, {})

--Removes HP
sets.HPDown = {}
sets.buff.Doom = set_combine(sets.buff.Doom, {})

--------------------------------------
-- Engaged sets
--------------------------------------

sets.engaged = {
	main="Idris",
	sub="Genmei Shield",
	range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Geomancy Mitaines +3",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck=gear.geo_jse_neck,
    waist="Grunfeld Rope",
    left_ear="Telos Earring",
    right_ear="Crepuscular Earring",
    left_ring="Chirich Ring +1",
    right_ring="Petrov Ring",
    back=gear.jse_pet_back,
}

--------------------------------------
-- Custom buff sets
--------------------------------------

-- Gear that converts elemental damage done to recover MP.	
sets.RecoverMP = {}
sets.buff.Sleep = set_combine(sets.buff.Sleep, {main="Lorg Mor"})