autows_list = {['Epeolatry']='Dimidiation',['Lionheart']='Resolution',['Lycurgos']='Upheaval',['Helheim']='Fimbulvetr',}

if item_available("Eri. Leg Guards +3") then
	gear.jse_empy_legs = "Eri. Leg Guards +3"
elseif item_available("Eri. Leg Guards +2") then
	gear.jse_empy_legs = "Eri. Leg Guards +2"
else
	gear.jse_empy_legs = "Eri. Leg Guards +1"
end

if item_available("Erilaz Galea +3") then
	gear.jse_empy_head = "Erilaz Galea +3"
elseif item_available("Erilaz Galea +2") then
	gear.jse_empy_head = "Erilaz Galea +2"
else
	gear.jse_empy_head = "Erilaz Galea +1"
end

if item_available("Erilaz Surcoat +3") then
	gear.jse_empy_body = "Erilaz Surcoat +3"
elseif item_available("Erilaz Surcoat +2") then
	gear.jse_empy_body = "Erilaz Surcoat +2"
else
	gear.jse_empy_body = "Erilaz Surcoat +1"
end

if item_available("Erilaz Greaves +3") then
	gear.jse_empy_feet = "Erilaz Greaves +3"
elseif item_available("Erilaz Greaves +2") then
	gear.jse_empy_feet = "Erilaz Greaves +2"
else
	gear.jse_empy_feet = "Erilaz Greaves +1"
end

if item_available("Erilaz Earring +2") then
	gear.empy_earring = "Erilaz Earring +2"
elseif item_available("Erilaz Earring +1") then
	gear.empy_earring = "Erilaz Earring +1"
else
	gear.empy_earring = "Erilaz Earring"
end

-- Weapons sets
sets.weapons.Epeolatry = {main="Epeolatry", sub="Utu Grip"}
sets.weapons.Lionheart = {main="Lionheart", sub="Utu Grip"}
sets.weapons.Lycurgos = {main="Lycurgos", sub="Khonsu"}
sets.weapons.Helheim = {main="Helheim", sub="Utu Grip"}

-- 50 DT/PDT
-- 68 + 23 Weapon = 85

sets.Enmity = {
	ammo=gear.dt_ammo,													        -- 3
	head={name="Halitus Helm",priority=88},										-- 			8
	body={name="Nyame Mail",priority=136},										-- 10
	hands={name="Kurys Gloves",priority=25},									-- 2	/	9
	legs={name=gear.jse_empy_legs,priority=100},								-- 13	/	11
	feet={name=gear.jse_empy_feet ,priority=48},								-- 11	/	13
	neck={name="Unmoving Collar +1",priority=500},								--		/	10
	waist={name="Plat. Mog. Belt",priority=500},
	left_ear={name="Odnowa Earring +1",priority=500},							-- 3
	right_ear={name="Cryptic Earring",priority=40},								--		/	4
	left_ring={name="Petrov Ring",priority=10},									-- 		/	4
	right_ring={name="Eihwaz Ring",priority=70},								-- 		/   5
	back=gear.tank_back,														-- 10	/	10
}

sets.Enmity.DT = sets.Enmity
	 
-- Merits: 	10%
-- Gear:	104%
-- Total: 	114%

-- PDT/DT:  52%
-- Enmity: 	25 + 23 Weapon = 48

sets.Enmity.SIRD = {															--SIRD	/	DT-PDT	/	Enmity
	ammo=gear.sird_ammo,										        		-- 11	/	3
	head={name="Erilaz Galea +3",priority=111},									-- 20				/	
	body={name="Nyame Mail",priority=136},										--		/	9
	hands={name="Regal Gauntlets",priority=500},								-- 10
	legs={name="Carmine Cuisses +1",priority=50},								-- 20
	feet={name="Erilaz Greaves +3",priority=48},				    			--		/	11
	neck=gear.sird_neck,    													-- 15				/	15
	waist="Audumbla Sash",														-- 10	/	4
	left_ear={name="Odnowa Earring +1",priority=500},							-- 			3
	right_ear="Magnetic Earring",												-- 8
	left_ring={name=gear.moon_ring,priority=500},								--		/	5
	right_ring={name="Gelatinous Ring +1",priority=500},						--			7
	--back=gear.sird_back,	
	back=gear.tank_back,
}

--------------------------------------
-- Precast sets
--------------------------------------

-- Item sets.

-- Precast sets to enhance JAs
sets.precast.JA['Vallation'] = set_combine(sets.Enmity,{body={name="Runeist Coat +3",priority=218}, legs={name="Futhark Trousers +3",priority=107},})
sets.precast.JA['Valiance'] = set_combine(sets.Enmity,{body={name="Runeist Coat +3",priority=218}, legs={name="Futhark Trousers +3",priority=107},})
sets.precast.JA['Pflug'] = set_combine(sets.Enmity,{feet={name="Runeist Bottes +3",priority=74},})
sets.precast.JA['Battuta'] = set_combine(sets.Enmity,{
	head={name="Futhark Bandeau +3",priority=56}, 
	legs=gear.jse_empy_legs,
	feet={name=gear.run_tank_feet,priority=76}, 
	back=gear.tank_back
})
sets.precast.JA['Liement'] = set_combine(sets.Enmity,{body="Futhark Coat +3",back={name=gear.dt_moon_back,priority=500},})
sets.precast.JA['Gambit'] = set_combine(sets.Enmity,{hands={name="Runeist Mitons +3",priority=85},})
sets.precast.JA['Rayke'] = set_combine(sets.Enmity,{feet="Futhark Boots +1"})
sets.precast.JA['Elemental Sforzo'] = set_combine(sets.Enmity,{body={name="Futhark Coat +3",priority=119},})
sets.precast.JA['Swordplay'] = set_combine(sets.Enmity,{hands={name="Futhark Mitons +3",priority=45},})
sets.precast.JA['Embolden'] = set_combine(sets.Enmity,{})
sets.precast.JA['One For All'] = set_combine(sets.Enmity,{})
sets.precast.JA['Last Resort'] = set_combine(sets.Enmity,{})

sets.precast.JA['Lunge'] = {
	ammo="Pemphredo Tathlum",
	head={name="Agwu's Cap",priority=38},
	body={name="Agwu's Robe",priority=88},
	hands={name="Agwu's Gages",priority=38},
	legs={name="Agwu's Slops",priority=50},
	feet={name="Agwu's Pigaches",priority=27},
	neck={name="Unmoving Collar +1",priority=500},
	waist={name="Plat. Mog. Belt",priority=500},
	left_ear={name="Odnowa Earring +1",priority=500},
	right_ear="Telos Earring",
	left_ring={name=gear.moon_ring,priority=500},
	right_ring={name="Gelatinous Ring +1",priority=500},
	back=gear.tank_back,
}
sets.precast.JA['Swipe'] = sets.precast.JA['Lunge']

-- Pulse sets, different stats for different rune modes, stat aligned.
sets.precast.JA['Vivacious Pulse'] = {head={name=gear.jse_empy_head,priority=91}, neck="Incanter's Torque", legs={name="Rune. Trousers +3",priority=80},}
sets.precast.JA['Vivacious Pulse']['Ignis'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
sets.precast.JA['Vivacious Pulse']['Gelus'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
sets.precast.JA['Vivacious Pulse']['Flabra'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
sets.precast.JA['Vivacious Pulse']['Tellus'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
sets.precast.JA['Vivacious Pulse']['Sulpor'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
sets.precast.JA['Vivacious Pulse']['Unda'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
sets.precast.JA['Vivacious Pulse']['Lux'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
sets.precast.JA['Vivacious Pulse']['Tenebrae'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})

-- Runes
sets.precast.JA['Ignis'] = set_combine(sets.Enmity, {})
sets.precast.JA['Gelus'] = set_combine(sets.Enmity, {})
sets.precast.JA['Flabra'] = set_combine(sets.Enmity, {})
sets.precast.JA['Tellus'] = set_combine(sets.Enmity, {})
sets.precast.JA['Sulpor'] = set_combine(sets.Enmity, {})
sets.precast.JA['Unda'] = set_combine(sets.Enmity, {})
sets.precast.JA['Lux'] = set_combine(sets.Enmity, {})
sets.precast.JA['Tenebrae'] = set_combine(sets.Enmity, {})


-- Fast cast sets for spells
-- Insipiration: 26% [2/5]
-- FC: 80%
sets.precast.FC = {
	ammo="Sapience Orb",																							-- 2
	head={name="Runeist Bandeau +3",priority=109},																	-- 14
	body=gear.jse_empy_body,																						-- 13
	hands={name="Leyline Gloves",priority=25},																		-- 6-8
	legs={name="Agwu's Slops",priority=45},																			-- 7
	feet={name="Carmine Greaves +1",priority=95},																	-- 8
	neck="Baetyl Pendant",																							-- 4
	waist={name="Plat. Mog. Belt",priority=500},
	left_ear={name="Odnowa Earring +1",priority=500},																
	right_ear={name="Tuisto Earring",priority=500},
	left_ring=gear.weather_ring,																					-- 6
	right_ring={name="Medada's Ring",priority=50},																	-- 10
	back=gear.fc_back,																								-- 10
}
		
sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {legs="Futhark Trousers +3"})
sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {})
sets.precast.FC.Cure = set_combine(sets.precast.FC, {})

sets.precast.FC.ValianceVallation = set_combine(sets.precast.FC, {neck={name="Unmoving Collar +1",priority=500}})
sets.precast.FC.ValianceVallationEnhancing = set_combine(sets.precast.FC, {legs="Futhark Trousers +3", neck={name="Unmoving Collar +1",priority=500}})

-- Weaponskill sets
sets.precast.WS = {
	ammo="Knobkierrie",
	head={name="Nyame Helm",priority=91},
	body={name="Nyame Mail",priority=136},
	hands={name="Nyame Gauntlets",priority=91},
	legs={name="Nyame Flanchard",priority=114},
	feet={name="Nyame Sollerets",priority=68},
	neck="Fotia Gorget",
	waist="Fotia Belt",
	left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
	right_ear="Ishvara Earring",
	left_ring="Regal Ring",
	right_ring="Rufescent Ring",
	back=gear.jse_wsd_back,
}

sets.precast.WS['Resolution'] = {
	ammo="Knobkierrie",
	head={name="Nyame Helm",priority=91},
	body={name="Nyame Mail",priority=136},
	hands="Nyame Gauntlets",
	legs={name="Nyame Flanchard",priority=114},
	feet={name="Nyame Sollerets",priority=68},
	neck="Fotia Gorget",
	waist="Fotia Belt",
	left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
	right_ear="Sherida Earring",
	left_ring="Regal Ring",
	right_ring="Niqmaddu Ring",
	back=gear.jse_str_back,
}

sets.precast.WS['Dimidiation'] = {
	ammo="Knobkierrie",
	head="Nyame Helm",
	body={name="Nyame Mail",priority=136},
	hands="Nyame Gauntlets",
	legs={name="Nyame Flanchard",priority=114},
	feet={name="Nyame Sollerets",priority=68},
	neck="Fotia Gorget",
	waist="Fotia Belt",
	left_ear="Ishvara Earring",
	right_ear="Sherida Earring",
	left_ring="Ilabrat Ring",
	right_ring="Niqmaddu Ring",
	back=gear.jse_wsd_back,
}

-- 50 PDT/DT
-- 3152 HP
sets.precast.WS.Tank = {
	ammo="Knobkierrie",
	head={name="Nyame Helm",priority=91},
	body={name="Nyame Mail",priority=136},
	hands={name="Regal Gauntlets",priority=205},
	legs={name="Nyame Flanchard",priority=114},
	feet={name="Nyame Sollerets",priority=68},
	neck={name=gear.run_jse_neck,priority=60},
	waist=gear.dt_waist,
	left_ear={name="Odnowa Earring +1",priority=500},
	right_ear="Sherida Earring",
	left_ring={name=gear.moon_ring,priority=500},
	right_ring={name="Gelatinous Ring +1",priority=500},
	back=gear.jse_wsd_back,
}

sets.precast.WS['Resolution'].Tank = set_combine(sets.precast.WS.Tank, {})	
sets.precast.WS['Dimidiation'].Tank = set_combine(sets.precast.WS.Tank, {})

sets.precast.RA = {
	range="Aureole",
	hands="Carmine Finger Gauntlets +1",	-- 8
	feet="Meghanada Jambeaux +2",			-- 10
	waist="Yemaya Belt",
	left_ring="Crepuscular Ring",			-- 3
}
--------------------------------------
-- Midcast sets
--------------------------------------

sets.midcast.FastRecast = sets.precast.FC
sets.midcast.FastRecast.DT = sets.precast.FC

-- Enhancing duration
sets.midcast['Enhancing Magic'] = {
	ammo=gear.dt_ammo,
	head=gear.jse_empy_head,														-- 20%
	body={name="Runeist Coat +3",priority=218},
	hands={name="Regal Gauntlets",priority=205},									-- 20%
	legs={ name="Futhark Trousers +3",priority=107},								-- 30%
	feet={name="Nyame Sollerets",priority=500},
	neck="Incanter's Torque",
	waist=gear.dt_waist,
	left_ear={name="Odnowa Earring +1",priority=500},
	right_ear="Andoaa Earring",
	left_ring="Defending Ring",
	right_ring={name="Gelatinous Ring +1",priority=500},
	back=gear.tank_back,
}
sets.midcast['Enhancing Magic'].SIRD = set_combine(sets.midcast['Enhancing Magic'], {})
sets.midcast['Enhancing Magic'].DT = set_combine(sets.midcast['Enhancing Magic'], {})
	
-- 455 Enhancing
-- 39% PDT/DT
sets.midcast['Phalanx'] = {
	ammo=gear.dt_ammo,
	head="Futhark Bandeau +3",														-- Phalanx +7
	body=gear.taeon_phalanx_body,													-- Phalanx +3
	hands={name="Regal Gauntlets",priority=205},									-- 20%
	legs=gear.taeon_phalanx_legs,													-- Phalanx +3
	feet=gear.taeon_phalanx_feet,													-- Phalanx +3
	neck=gear.run_jse_neck,
	waist=gear.dt_waist,
	left_ear={name="Odnowa Earring +1",priority=500},
	right_ear="Andoaa Earring",
	left_ring={name=gear.moon_ring,priority=500},
	right_ring={name="Gelatinous Ring +1",priority=500},
	back={name=gear.dt_moon_back,priority=500},
}

sets.midcast['Phalanx'].DT = set_combine(sets.midcast['Phalanx'], {})

-- 503 Skill
sets.midcast['Temper'] = {
	ammo=gear.dt_ammo,
	head="Carmine Mask +1",																			-- 11
	body={name="Nyame Mail",priority=136},
	hands="Runeist Mitons +3",																		-- 19
	legs={name="Carmine Cuisses +1",priority=50},													-- 18
	feet={name="Nyame Sollerets",priority=68},
	neck="Incanter's Torque",																		-- 10
	waist={name="Plat. Mog. Belt",priority=500},
	left_ear={name="Mimir Earring",priority=10},
	right_ear="Andoaa Earring",																		-- 5
	left_ring="Defending Ring",
	right_ring={name="Stikini Ring +1",priority=10},
	back={name=gear.dt_moon_back,priority=500},
}
sets.midcast['Temper'].SIRD = set_combine(sets.midcast['Temper'], {})
sets.midcast['Temper'].DT = set_combine(sets.midcast['Temper'], {})

-- 503 Skill
sets.midcast.BarElement = sets.midcast['Temper']
sets.midcast.BarElement.SIRD = sets.midcast['Temper']
sets.midcast.BarElement.DT = sets.midcast['Temper']

sets.midcast['Regen'] = set_combine(sets.midcast['Enhancing Magic'],{head="Runeist Bandeau +3", neck="Sacro Gorget", waist="Sroda Belt", right_ear=gear.empy_earring}) 
sets.midcast['Regen'].SIRD = set_combine(sets.midcast['Enhancing Magic'],{head="Runeist Bandeau +3", neck="Sacro Gorget", waist="Sroda Belt", right_ear=gear.empy_earring}) 
sets.midcast['Regen'].DT = set_combine(sets.midcast['Enhancing Magic'],{head="Runeist Bandeau +3", neck="Sacro Gorget", waist="Sroda Belt", right_ear=gear.empy_earring}) 

sets.midcast['Refresh'] = set_combine(sets.midcast['Enhancing Magic'],{}) 
sets.midcast['Refresh'].SIRD = set_combine(sets.midcast['Enhancing Magic'],{})
sets.midcast['Refresh'].DT = set_combine(sets.midcast['Enhancing Magic'],{})

sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {waist="Siegel Sash"})
sets.midcast.Stoneskin.SIRD = set_combine(sets.midcast['Enhancing Magic'], {waist="Siegel Sash"})
sets.midcast.Stoneskin.DT = set_combine(sets.midcast['Enhancing Magic'], {waist="Siegel Sash"})

sets.midcast.Aquaveil = set_combine(sets.Enmity.SIRD, {})
sets.midcast.Aquaveil.SIRD = set_combine(sets.Enmity.SIRD, {})
sets.midcast.Aquaveil.DT = set_combine(sets.Enmity.SIRD, {})

sets.midcast.Crusade = set_combine(sets.Enmity.SIRD, {})
sets.midcast.Crusade.SIRD = set_combine(sets.Enmity.SIRD, {})
sets.midcast.Crusade.DT = set_combine(sets.Enmity.SIRD, {})

sets.midcast.Poisonga = set_combine(sets.Enmity.SIRD, {})
sets.midcast.Poisonga.SIRD = set_combine(sets.Enmity.SIRD, {})
sets.midcast.Poisonga.DT = set_combine(sets.Enmity.SIRD, {})

sets.midcast['Banish'] = set_combine(sets.Enmity.SIRD, {})
sets.midcast['Banish'].SIRD = set_combine(sets.Enmity.SIRD, {})
sets.midcast['Banish'].DT = set_combine(sets.Enmity.SIRD, {})

sets.midcast['Banishga'] = set_combine(sets.Enmity.SIRD, {})
sets.midcast['Banishga'].SIRD = set_combine(sets.Enmity.SIRD, {})
sets.midcast['Banishga'].DT = set_combine(sets.Enmity.SIRD, {})

sets.midcast.Flash = set_combine(sets.Enmity, {})
sets.midcast.Flash.SIRD = set_combine(sets.Enmity, {})
sets.midcast.Flash.DT = set_combine(sets.Enmity, {})

sets.midcast.Stun = set_combine(sets.Enmity, {})
sets.midcast.Stun.SIRD = set_combine(sets.Enmity, {})
sets.midcast.Stun.DT = set_combine(sets.Enmity, {})

sets.midcast.Foil = set_combine(sets.Enmity, {})
sets.midcast.Foil.SIRD = set_combine(sets.Enmity.SIRD, {})
sets.midcast.Foil.DT = set_combine(sets.Enmity, {})


sets.midcast['Healing Magic'] = set_combine(sets.Enmity.SIRD, {
	--feet=gear.sird_cure_feet,
	--neck="Sacro Gorget", 
	waist="Sroda Belt", 	-- 35%
	back=gear.sird_back,
})
sets.midcast['Healing Magic'].SIRD = set_combine(sets.midcast['Healing Magic'], {})
sets.midcast['Healing Magic'].DT = set_combine(sets.midcast['Healing Magic'], {})

-- BLU spells
sets.midcast['Magic Fruit'] = set_combine(sets.midcast['Healing Magic'], {})
sets.midcast['Blue Magic'] = set_combine(sets.Enmity.SIRD, {})
sets.midcast['Blue Magic'].SIRD = set_combine(sets.Enmity.SIRD, {})
sets.midcast['Blue Magic'].DT = set_combine(sets.Enmity.SIRD, {})

sets.midcast.Cocoon = sets.Enmity.SIRD
sets.midcast.Cocoon.SIRD = sets.Enmity.SIRD
sets.midcast.Cocoon.DT = sets.Enmity.SIRD
	
sets.Self_Healing = {}
sets.Cure_Received = {}
sets.Self_Refresh = {waist="Gishdubar Sash"}
sets.Regen_Received = {right_ear=gear.empy_earring}

sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {})
sets.midcast.Protect.SIRD = set_combine(sets.midcast['Enhancing Magic'], {})
sets.midcast.Protect.DT = set_combine(sets.midcast['Enhancing Magic'], {})

sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {})
sets.midcast.Shell.SIRD = set_combine(sets.midcast['Enhancing Magic'], {})
sets.midcast.Shell.DT = set_combine(sets.midcast['Enhancing Magic'], {})

sets.midcast['Raise'] = set_combine(sets.Enmity.SIRD, {})
sets.midcast['Raise'].SIRD = set_combine(sets.Enmity.SIRD, {})
sets.midcast['Raise'].DT = set_combine(sets.Enmity.SIRD, {})

--------------------------------------
-- Idle/resting/defense/etc sets
--------------------------------------

sets.resting = {}

sets.idle = {
	ammo="Homiliary",																		-- 			/ 3 DT	/
	head={name="Nyame Helm",priority=91},													-- 			/		/
	body={name="Runeist Coat +3",priority=218},																
	hands={name="Regal Gauntlets",priority=205},																
	legs={name="Nyame Flanchard",priority=114},												-- 		 	/ 9 DT	/
	feet={name=gear.jse_empy_feet,priority=500},										--			/ 10 DT /													
	neck={name=gear.run_jse_neck,priority=60},												-- 			/ 6 DT	/
	waist=gear.dt_waist,																	-- 4 PDT 	/		/
	left_ear={name="Odnowa Earring +1",priority=500},										--			/		/	2 MDT
	right_ear={name="Etiolation Earring",priority=50},
	left_ring="Defending Ring",
	right_ring={name="Gelatinous Ring +1",priority=500},									-- 7  PDT	/		/	-1 MDT
	back=gear.tank_back,																	-- 10 PDT	/		/
}

sets.idle.Refresh = set_combine(sets.idle, {head="Rawhide Mask", legs="Rawhide Trousers", feet="Nyame Sollerets"})
sets.idle.Weak = sets.idle

sets.Kiting = {ammo=gear.dt_ammo, legs="Carmine Cuisses +1"}

sets.latent_refresh = {waist="Fucho-no-obi"}
sets.DayIdle = {}
sets.NightIdle = {}

-- Extra defense sets.  Apply these on top of melee or defense sets.
sets.Knockback = {}
sets.MP = {}
sets.TreasureHunter = set_combine(sets.TreasureHunter, {hands=gear.herculean_treasure_hands})


-- Defense Sets

-- Set for Sleep/Stun/Petrify
sets.defense.PDT = {
	ammo=gear.dt_ammo,
	head={name="Nyame Helm",priority=91},
	body="Nyame Mail",																	
	hands={name="Nyame Gauntlets",priority=91},																
	legs={name="Nyame Flanchard",priority=114},
	feet="Nyame Sollerets",
	neck={name=gear.run_jse_neck,priority=60},
	waist=gear.dt_waist,
	left_ear={name="Odnowa Earring +1",priority=500},
	right_ear={name="Etiolation Earring",priority=50},
	left_ring={name=gear.moon_ring,priority=500},
	right_ring={name="Gelatinous Ring +1",priority=500},
	back={name=gear.dt_moon_back,priority=500},
}
	
sets.defense.MEVA = sets.defense.PDT
sets.defense.MDT = sets.defense.MEVA
	
-- Swap to these on Moonshade using WS if at 3000 TP
sets.MaxTP = {ear1="Etiolation Earring"}
sets.AccMaxTP = {ear1="Telos Earring"}

--------------------------------------
-- Engaged sets
--------------------------------------

-- 1297 Acc
sets.engaged = {
	ammo="Coiste Bodhar",
	head="Nyame Helm",
	body="Ashera Harness",
	hands="Nyame Gauntlets",
	legs="Nyame Flanchard",
	feet="Nyame Sollerets",
	neck="Combatant's Torque",
	waist="Ioskeha Belt +1",
	left_ear="Cessance Earring",
	right_ear="Sherida Earring",
	left_ring="Chirich Ring +1",
	right_ring="Niqmaddu Ring",
	back=gear.jse_da_back,
}

-- 1281 Acc
-- 50 PDT/DT
-- 3124 HP
sets.engaged.DTLite = {
	ammo="Yamarang",
	head={name="Nyame Helm",priority=91},
	body={name="Ashera Harness",priority=500},
	hands={name="Regal Gauntlets",priority=500},
	legs="Nyame Flanchard",
	feet={name="Nyame Sollerets",priority=68},
	neck="Combatant's Torque",
	waist="Ioskeha Belt +1",
	left_ear={name="Odnowa Earring +1",priority=500},
	right_ear="Sherida Earring",
	left_ring={name=gear.moon_ring,priority=500},
	right_ring={name="Gelatinous Ring +1",priority=500},
	back=gear.jse_da_back,
}

-- Special ONGO set
sets.engaged.Ongo = set_combine(sets.engaged.DTLite ,{
	hands={name="Nyame Gauntlets",priority=500},
	neck={name=gear.run_jse_neck,priority=60},
})

--	PDT:	36
--	PDT II:	5
--	DT:		19
--	MDT:	19
--	Total:	55+5 [Overcap]
--  MEVA: 665
--  3452 HP

sets.engaged.Tank = {
	ammo=gear.dt_ammo,																		-- 			/ 3 DT	/			
	head={name="Nyame Helm",priority=91},													-- 			/ 7 DT	/
	body={name="Runeist Coat +3",priority=218},												--					
	hands={name="Turms Mittens +1",priority=74},											--					
	legs=gear.jse_empy_legs,																--   		/ 13 DT	/
	feet={name=gear.jse_empy_feet,priority=76},												--			/ 11 DT /	
	neck={name=gear.run_jse_neck,priority=60},												-- 			/ 6 DT	/
	waist=gear.dt_waist,																	-- 4 PDT 	/		/
	left_ear={name="Odnowa Earring +1",priority=500},										--			/ 3 DT	/	2 MDT
	right_ear={name="Etiolation Earring",priority=50},
	left_ring={name=gear.moon_ring,priority=500},											--			/ 5 DT  /
	right_ring={name="Gelatinous Ring +1",priority=500},									-- 7  PDT	/		/	-1 MDT
	back=gear.tank_back,																	-- 10 PDT	/		/
}

sets.engaged.MEVA = {
	ammo=gear.dt_ammo,																		-- 			/ 3 DT	/			
	head={name="Nyame Helm",priority=91},													-- 			/ 7 DT	/
	body=gear.jse_empy_body,
	hands={name="Nyame Gauntlets",priority=91},												--			/ 7 DT  /		
	legs=gear.jse_empy_legs,																--   		/ 13 DT	/
	feet={name=gear.jse_empy_feet,priority=68},												--			/ 11 DT /		
	neck={name=gear.run_jse_neck,priority=60},												-- 			/ 6 DT	/
	waist="Carrier's Sash",																	-- 			/		/
	left_ear={name="Odnowa Earring +1",priority=500},										--			/ 3 DT	/	2 MDT
	right_ear={name="Etiolation Earring",priority=50},
	left_ring={name=gear.moon_ring,priority=500},											--			/ 5 DT  /
	right_ring={name="Gelatinous Ring +1",priority=500},									-- 7  PDT	/		/	-1 MDT
	back=gear.tank_back,																	-- 10 PDT	/		/
}

sets.engaged.Parry = {
	ammo=gear.dt_ammo,																		-- 			/ 3 DT	/			
	head={name="Nyame Helm",priority=91},													-- 			/ 7 DT	/
	body=gear.jse_empy_body,
	hands={name="Nyame Gauntlets",priority=91},												--			/ 7 DT  /		
	legs=gear.jse_empy_legs,																--   		/ 13 DT	/
	feet={name="Turms Leggings +1",priority=76},											--					
	neck={name=gear.run_jse_neck,priority=60},												-- 			/ 6 DT	/
	waist="Carrier's Sash",																	-- 			/		/
	left_ear={name="Odnowa Earring +1",priority=500},										--			/ 3 DT	/	2 MDT
	right_ear={name="Etiolation Earring",priority=50},
	left_ring={name=gear.moon_ring,priority=500},											--			/ 5 DT  /
	right_ring={name="Gelatinous Ring +1",priority=500},									-- 7  PDT	/		/	-1 MDT
	back=gear.tank_back,																	-- 10 PDT	/		/
}

--------------------------------------
-- Custom buff sets
--------------------------------------
sets.buff.Doom = set_combine(sets.buff.Doom, {})
sets.buff.Battuta = {}
sets.buff.Embolden = {back=gear.embolden_back}