--------------------------------------
-- Precast Sets
--------------------------------------
if item_available('Crepuscular Cloak') then
	gear.impact_body = "Crepuscular Cloak"
else
	gear.impact_body = "Twilight Cloak"
end

if item_available("Beckoner's Horn +2") then
	gear.jse_empy_head = "Beckoner's Horn +2"
else
	gear.jse_empy_head = "Beckoner's Horn +1"
end

if item_available("Beck. Doublet +2") then
	gear.jse_empy_body = "Beck. Doublet +2"
else
	gear.jse_empy_body = "Beck. Doublet +1"
end

if item_available("Beck. Spats +2") then
	gear.jse_empy_legs = "Beck. Spats +2"
else
	gear.jse_empy_legs = "Beck. Spats +1"
end

if item_available("Beck. Earring +2") then
	gear.empy_earring = "Beck. Earring +2"
elseif item_available("Beck. Earring +1") then
	gear.empy_earring = "Beck. Earring +1"
elseif item_available("Beck. Earring") then
	gear.empy_earring = "Beck. Earring"
else
	gear.empy_earring = "Gelos Earring"
end

sets.weapons.Nirvana = {main="Nirvana", sub="Elan Strap +1"}

sets.TreasureHunter = set_combine(sets.TreasureHunter, {waist="Chaac Belt"})
	
-- Precast sets to enhance JAs
sets.precast.JA['Astral Flow'] = {head="Glyphic Horn"}

-- +127 Skill = 601 Skill Total
sets.precast.JA['Elemental Siphon'] = {
	main="Espiritus",						-- 15
	sub="Elan Strap +1",
	ammo="Epitaph",
	head=gear.jse_empy_head,				-- 13
	body=gear.jse_empy_body,				-- 14
	hands="Lamassu Mitts +1",				-- 20
	legs=gear.jse_empy_legs,					-- 20
	feet="Convo. Pigaches +3",
	neck="Incanter's Torque",				-- 10
	waist="Lucidity Sash",					-- 7
	left_ear="C. Palug Earring",			-- 5
	right_ear="Andoaa Earring",				-- 5
	left_ring="Evoker's Ring",				-- 10
		right_ring="Lebeche Ring",
	back=gear.skill_back,					-- 13
}

sets.precast.JA['Avatar\'s Favor'] = set_combine(sets.precast.JA['Elemental Siphon'], {})
sets.precast.JA['Mana Cede'] = {}

-- Pact delay reduction gear
sets.precast.BloodPactWard = {ammo="Epitaph", body="Con. Doublet +3" }
sets.precast.BloodPactRage = sets.precast.BloodPactWard

-- Fast cast sets for spells
--
-- Total: 81%
--
sets.precast.FC = {
	main="Daybreak", 																										-- 5
	sub="Chanter's Shield",																									-- 3
	ammo="Epitaph",
	head=gear.merlinic_fc_head,																								-- 15
	body="Inyanga Jubbah +2", 																								-- 14
	hands=gear.merlinic_fc_hands,																							-- 7
	legs={ name="Psycloth Lappas", augments={'MP+80','Mag. Acc.+15','"Fast Cast"+7',}}, 									-- 7
	feet=gear.merlinic_fc_feet,																								-- 12
	neck="Baetyl Pendant",																									-- 4
	waist="Embla Sash",																										-- 5
	left_ear="Loquac. Earring",																								-- 2
	right_ear="Malignance Earring",																							-- 4
	left_ring="Weather. Ring +1",																								-- 4
	right_ring="Lebeche Ring",																								-- QC
	back=gear.magic_jse_back,																								-- 10
}

sets.precast.FC.Cure = set_combine(sets.precast.FC, {feet="Vanya Clogs"})
sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})
sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {})
sets.precast.FC.Impact = set_combine(sets.precast.FC, {head=empty,body=gear.impact_body})

-- Weaponskill sets
sets.precast.WS = {
	ammo="Epitaph",
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
	back=gear.phys_jse_back,
}

--------------------------------------
-- Midcast sets
--------------------------------------

sets.midcast.FastRecast = sets.precast.FC

-- 53% Cure Potency
-- +30 Skill
sets.midcast.Cure = {
	main="Bunzi's Rod",								-- 30%
	sub="Ammurapi Shield",
	ammo="Epitaph",
	head="Vanya Hood",								-- 10%
	body="Nyame Mail",
	hands="Inyan. Dastanas +2",						-- 20 Skill
	legs="Nyame Flanchard",
	feet="Vanya Clogs",								-- 10%
	neck="Incanter's Torque",						-- 10 Skill
	waist="Porous Rope",
	left_ear="Infused Earring",						-- 5%
	right_ear="Etiolation Earring",
	left_ring="Vertigo Ring",
	right_ring="Lebeche Ring",						-- 3%
	back="Solemnity Cape",							-- 7%
}
	
sets.midcast.Curaga = sets.midcast.Cure
sets.midcast.Cursna = set_combine(sets.midcast.Cure, {neck="Debilis Medallion", ring1="Haoma's Ring",ring2="Menelaus's Ring"})
	
sets.midcast.StatusRemoval = set_combine(sets.midcast.FastRecast, {})

sets.midcast['Summoning Magic'] = sets.precast.JA['Elemental Siphon']
	
sets.midcast['Elemental Magic'] = {	
	main="Bunzi's Rod",
	sub="Ammurapi Shield",
	ammo="Epitaph",	
	head="C. Palug Crown",
	body="Nyame Mail",
	hands="Nyame Sollerets",
	legs="Nyame Flanchard",
	feet="Nyame Sollerets",
	neck="Sanctity Necklace",
	waist="Porous Rope",
	left_ear="Dignitary's Earring",
	right_ear="Malignance Earring",	
	left_ring="Metamor. Ring +1",
	right_ring="Freke Ring",																					
	back=gear.phys_jse_back,
}
	
sets.midcast['Elemental Magic'].Resistant = set_combine(sets.midcast['Elemental Magic'], {})
sets.midcast['Elemental Magic'].OccultAcumen = set_combine(sets.midcast['Elemental Magic'], {})

sets.midcast['Enfeebling Magic'] = {
	main="Daybreak",
	sub="Ammurapi Shield",
	ammo="Epitaph",
	head="C. Palug Crown",
	body="Inyanga Jubbah +2",
	hands="Inyanga Dastanas +2",
	legs="Psycloth Lappas",
	feet="Inyanga Crackows +2",
	neck="Incanter's Torque",
	waist="Porous Rope",
	left_ear="Dignitary's Earring",
	right_ear="Malignance Earring",
	left_ring="Metamor. Ring +1",
	right_ring="Kishar Ring",
	back=gear.phys_jse_back,
}
	
sets.midcast.Dia = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
sets.midcast.Diaga = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
sets.midcast['Dia II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
sets.midcast.Bio = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
sets.midcast['Bio II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	
sets.midcast.Impact = set_combine(sets.midcast['Enfeebling Magic'], {head=empty, body=gear.impact_body})
sets.midcast.Impact.OccultAcumen = set_combine(sets.midcast.Impact, {})

sets.midcast['Divine Magic'] = set_combine(sets.midcast['Elemental Magic'], {})

sets.midcast['Dark Magic'] = set_combine(sets.midcast['Enfeebling Magic'], {
	head="Pixie Hairpin +1",
	legs="Nyame Flanchard",
	neck="Erra Pendant",
	right_ring="Archon Ring",
})

sets.midcast.Drain = set_combine(sets.midcast['Dark Magic'], {
	waist="Fucho-no-obi",
	left_ring="Evanescence Ring",
})

sets.midcast.Aspir = sets.midcast.Drain
	
sets.midcast.Stun = set_combine(sets.midcast['Enfeebling Magic'], {})
sets.midcast.Stun.Resistant = set_combine(sets.midcast['Enfeebling Magic'], {})

-- 60% Duration
-- +40 Skill
-- 
sets.midcast['Enhancing Magic'] = {
	main=gear.gada_enhancing_club, 					-- 6% 	-18 Skill
	sub="Ammurapi Shield",							-- 10%
	ammo="Epitaph",
	head=gear.telchine_enhancing_head,				-- 8%
	body=gear.telchine_enhancing_body,				-- 8% 	-12 Skill
	hands=gear.telchine_enhancing_hands,			-- 10%
	legs=gear.telchine_enhancing_legs,				-- 8%
	feet=gear.telchine_enhancing_feet,				-- 10%
	neck="Incanter's Torque",						-- 		-10 Skill
	waist="Embla Sash",								-- 10%
	left_ear="Infused Earring",
	right_ear="Etiolation Earring",
	left_ring="Defending Ring",
	right_ring="Gelatinous Ring +1",
	back=gear.phys_jse_back,
}
	
sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {neck="Nodens Gorget", waist="Siegel Sash"})
sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {head="Amalric Coif +1",feet="Inspirited Boots", waist="Gishdubar Sash"})
sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {main="Vadose Rod",sub="Genmei Shield",head="Amalric Coif +1"}) -- hands="Regal Cuffs"
sets.midcast.BarElement = set_combine(sets.precast.FC['Enhancing Magic'], {})
	
sets.Self_Healing = {waist="Gishdubar Sash"}
sets.Cure_Received = {waist="Gishdubar Sash"}
sets.Self_Refresh = {waist="Gishdubar Sash",feet="Inspirited Boots"}

----------------------------------------------------
-- Avatar pact sets.  All pacts are Ability type.
----------------------------------------------------

-- +127 Skill = 601 Skill Total
sets.midcast.Pet.BloodPactWard = {
	main="Espiritus",						-- 15
	sub="Elan Strap +1",
	ammo="Epitaph",
	head=gear.jse_empy_head,				-- 13
	body=gear.jse_empy_body,				-- 14
	hands="Lamassu Mitts +1",				-- 22
	legs=gear.jse_empy_legs,					-- 20
	feet="Convo. Pigaches +3",
	neck="Incanter's Torque",				-- 10
	waist="Lucidity Sash",					-- 7
	left_ear="C. Palug Earring",			-- 5
	right_ear="Lugalbanda Earring",
	left_ring="Evoker's Ring",				-- 10
	right_ring="Lebeche Ring",
	back=gear.skill_back,					-- 13
}

sets.midcast.Pet.DebuffBloodPactWard = sets.midcast.Pet.BloodPactWard
sets.midcast.Pet.DebuffBloodPactWard.Acc = sets.midcast.Pet.DebuffBloodPactWard

------------------------   
-- BP Physical / Magical
------------------------
sets.midcast.Pet.PhysicalBloodPactRage = {
	main=gear.smn_physical_staff,
	sub="Elan Strap +1",
	ammo="Epitaph",
	head="Apogee Crown +1",
	body="Con. Doublet +3",
	hands=gear.merlinic_physpact_hands,
	legs="Apogee Slacks +1",
	feet="Convo. Pigaches +3",
	neck=gear.smn_jse_neck,
	waist="Incarnation Sash",
	left_ear="Lugalbanda Earring",
	right_ear=gear.empy_earring,
	left_ring="Varar Ring +1",
	right_ring="C. Palug Ring",
	back=gear.phys_jse_back,
}

sets.midcast.Pet.PhysicalBloodPactRage.Acc = set_combine(sets.midcast.Pet.PhysicalBloodPactRage, 
	{legs="Enticer's Pants"})
	
-------------
-- Magical --
-------------

sets.midcast.Pet.MagicalBloodPactRage = {
	main=gear.smn_magic_staff,
	sub="Elan Strap +1",
	ammo="Epitaph",
	head="C. Palug Crown",
	body="Con. Doublet +3",
	hands=gear.merlinic_mabpact_hands,
	legs="Enticer's Pants",
	feet="Convo. Pigaches +3",
	neck="Adad Amulet",
	waist="Regal Belt",
	left_ear="Lugalbanda Earring",
	right_ear=gear.empy_earring,
	left_ring="Varar Ring +1",
	right_ring="C. Palug Ring",
	back=gear.magic_jse_back,
}

sets.midcast.Pet.MagicalBloodPactRage.Acc = sets.midcast.Pet.MagicalBloodPactRage

-------------------
-- Flaming Crush --
-------------------

sets.midcast.Pet['Flaming Crush'] = {
	main=gear.smn_magic_staff,
	sub="Elan Strap +1",
	ammo="Epitaph",
	head="C. Palug Crown",
	body="Con. Doublet +3",
	hands=gear.merlinic_mabpact_hands,
	legs="Apogee Slacks +1",
	feet="Convo. Pigaches +3",
	neck=gear.smn_jse_neck,
	waist="Regal Belt",
	left_ear="Lugalbanda Earring",
	right_ear=gear.empy_earring,
	left_ring="Varar Ring +1",
	right_ring="C. Palug Ring",
	back=gear.phys_jse_back,
}
sets.midcast.Pet['Flaming Crush'].Acc = sets.midcast.Pet['Flaming Crush']

-- Spirits cast magic spells, which can be identified in standard ways.
sets.midcast.Pet.WhiteMagic = {}
sets.midcast.Pet['Elemental Magic'] = set_combine(sets.midcast.Pet.MagicalBloodPactRage, {})

--------------------------------------
-- Idle/resting/defense/etc sets
--------------------------------------

-- Resting sets
-- sets.resting = sets.idle

-- Idle sets
sets.idle = {
	main="Daybreak",
	sub="Genmei Shield",
	ammo="Epitaph",
	head=gear.jse_empy_head,
	body="Shomonjijoe +1",
	hands="Asteria Mitts +1",
	legs="Assid. Pants +1",
	feet="Inyanga Crackows +2",
	neck="Sanctity Necklace",
	waist="Regal Belt",
	left_ear="C. Palug Earring",
	right_ear="Etiolation Earring",
	left_ring="Defending Ring",
	right_ring="Inyanga Ring",
	back=gear.phys_jse_back,
}

sets.idle.DT = {
	main="Daybreak",
	sub="Genmei Shield",				-- 10
	ammo="Epitaph",
	head=gear.jse_empy_head,
	body="Inyanga Jubbah +2",
	hands="Nyame Gauntlets",			-- 7
	legs="Nyame Flanchard",				-- 8
	feet="Inyanga Crackows +2",
	neck="Loricate Torque +1",			-- 6
	waist="Regal Belt",					
	left_ear="C. Palug Earring",
	right_ear="Etiolation Earring",
	left_ring="Defending Ring",			-- 10
	right_ring="Inyanga Ring",
	back=gear.phys_jse_back,			-- 10
}

sets.idle.Town = {
	main=gear.smn_physical_staff,
	sub="Elan Strap +1",
	ammo="Epitaph",
	head="Nyame Helm",
	body="Nyame Mail",
	hands="Nyame Gauntlets",
	legs="Nyame Flanchard",
	feet="Nyame Sollerets",
	neck=gear.smn_jse_neck,
	waist="Regal Belt",
	left_ear="C. Palug Earring",
	right_ear="Etiolation Earring",
	left_ring="Defending Ring",
	right_ring="Inyanga Ring",
	back=gear.phys_jse_back,
}


-- perp costs:
-- spirits: 		7
-- carby/cait: 		11 (5 with mitts)
-- fenrir: 			13
-- others: 			15
-- avatar's favor: 	4

-- Max useful -perp gear is 1 less than the perp cost (can't be reduced below 1)
-- Aim for -14 perp, and refresh in other slots.

-- Gridarvor/Nirvana:			-5/-8
-- Con. Pigaches +3:		 	-6
-- Lucidity Sash:				-2
-- Assid. Pants +1:				-3
-- total: -16/-17

-- Can make due without either the head or the body, and use +refresh items in those slots.

sets.idle.Avatar = {
	main=gear.smn_physical_staff,
	sub="Khonsu",
	ammo="Epitaph",
	head=gear.jse_empy_head,
	body="Shomonjijoe +1",
	hands="Asteria Mitts +1",			-- MP Refresh
	legs="Assid. Pants +1",
	feet="Convo. Pigaches +3",
	neck="Caller's Pendant",			-- TP Regain
	waist="Lucidity Sash",
	left_ear="C. Palug Earring",
	right_ear="Lugalbanda Earring",
	left_ring="Defending Ring",
	right_ring="C. Palug Ring",
	back=gear.phys_jse_back,
}

sets.idle.DT.Avatar = {
	main=gear.smn_physical_staff,
	sub="Khonsu",						-- 6
	ammo="Epitaph",
	head=gear.jse_empy_head,			-- 9
	body="Shomonjijoe +1",
	hands="Nyame Gauntlets",			-- 7
	legs="Assid. Pants +1",
	feet="Convo. Pigaches +3",
	neck=gear.smn_petdt_neck,			-- 4
	waist="Lucidity Sash",
	left_ear="C. Palug Earring",
	right_ear="Lugalbanda Earring",
	left_ring="Defending Ring",			-- 10
	right_ring="C. Palug Ring",			-- 5
	back=gear.phys_jse_back,			-- 10
}

sets.idle.Spirit = sets.idle.Avatar
sets.idle.DT.Spirit = sets.idle.DT.Avatar
sets.idle.Avatar.Favor = sets.idle.Avatar
sets.idle.DT.Avatar.Favor = sets.idle.DT.Avatar

-- Gridarvor:			-5
-- Con. Pigaches +3: 	-6
-- Lucidity Sash:		-2

sets.idle.Avatar.Engaged = sets.idle.Avatar
sets.idle.DT.Avatar.Engaged = sets.idle.DT.Avatar

sets.idle.Avatar.Engaged['Cait Sith'] = set_combine(sets.idle.Avatar, {hands="Lamassu Mitts +1"})
sets.idle.DT.Avatar.Engaged['Cait Sith'] = set_combine(sets.idle.DT.Avatar, {body="Nyame Mail", hands="Lamassu Mitts +1"})
sets.idle.Avatar.Engaged['Carbuncle'] = set_combine(sets.idle.Avatar, {hands="Asteria Mitts +1"})
sets.idle.DT.Avatar.Engaged['Carbuncle'] = set_combine(sets.idle.DT.Avatar, {body="Nyame Mail", hands="Asteria Mitts +1"})

sets.perp = {}
sets.perp['Cait Sith'] = set_combine(sets.idle.Avatar, {hands="Lamassu Mitts +1"})
sets.perp['Cait Sith'].DT = set_combine(sets.idle.DT.Avatar, {body="Nyame Mail", hands="Lamassu Mitts +1"})
sets.perp['Carbuncle'] = set_combine(sets.idle.Avatar, {hands="Asteria Mitts +1"})
sets.perp['Carbuncle'].DT = set_combine(sets.idle.Avatar, {body="Nyame Mail", hands="Asteria Mitts +1"})

-- Defense sets
sets.defense.PDT = {
	main="Daybreak",
	sub="Genmei Shield",
	ammo="Epitaph",
	head="Nyame Helm",
	body="Nyame Mail",
	hands="Nyame Gauntlets",
	legs="Nyame Flanchard",
	feet="Nyame Sollerets",
	neck="Loricate Torque +1",
	waist="Regal Belt",
	left_ear="Odnowa Earring +1",
	right_ear="Etiolation Earring",
	left_ring="Defending Ring",
	right_ring="Gelatinous Ring +1",
	back=gear.dt_moon_back,
}

sets.defense.MDT = sets.defense.PDT
sets.defense.MEVA = sets.defense.PDT
	
sets.Kiting = {feet=gear.movement_gaiters_feet}
sets.latent_refresh = {waist="Fucho-no-obi"}
sets.DayIdle = {}
sets.NightIdle = {}
sets.HPDown = {}
sets.buff.Doom = set_combine(sets.buff.Doom, {})
sets.CureObi = {waist="Korin Obi"}

--------------------------------------
-- Engaged sets
--------------------------------------

sets.engaged = {
	ammo="Epitaph",
	head="Nyame Helm",
	body="Nyame Mail",
	hands="Nyame Gauntlets",
	legs="Nyame Flanchard",
	feet="Nyame Sollerets",
	neck="Combatant's Torque",
	waist="Grunfeld Rope",
	left_ear="Telos Earring",
	right_ear="Crep. Earring",
	left_ring="Petrov Ring",
	right_ring="Varar Ring +1",
	back=gear.phys_jse_back,
}
sets.engaged.Avatar = sets.idle.DT.Avatar
sets.engaged.AvatarFavor = sets.idle.DT.Avatar
sets.engaged.Spirit = sets.idle.DT.Avatar