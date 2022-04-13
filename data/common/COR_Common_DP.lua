if item_available('Chirich Ring +1') then
	gear.ring_tp = 'Chirich Ring +1'
else
	gear.ring_tp = 'Petrov Ring'
end

sets.weapons.DualSavage = 				{main="Naegling",sub="Demers. Degen +1",range="Anarchy +2"}
sets.weapons.DualLeaden = 				{main="Rostam",sub="Gleti's Knife",range="Death Penalty"}
sets.weapons.DualLeadenRanged = 		{main="Rostam",sub="Tauret",range="Death Penalty"}
sets.weapons.DualWildfire = 			{main="Rostam",sub="Gleti's Knife",range="Armageddon"}
sets.weapons.DualWildfireRanged = 		{main="Rostam",sub="Tauret",range="Armageddon"}
sets.weapons.DualLastStand = 			{main="Rostam",sub="Gleti's Knife",range="Fomalhaut"}
sets.weapons.DualLastStandRanged = 		{main="Rostam",sub="Kustawi +1",range="Fomalhaut"}
sets.weapons.DeathPenalty = 			{main="Rostam",sub="Nusku Shield",range="Death Penalty"}
sets.weapons.Armageddon =				{main="Rostam",sub="Nusku Shield",range="Armageddon"}
sets.weapons.Fomalhaut = 				{main="Rostam",sub="Nusku Shield",range="Fomalhaut"}
sets.weapons.Naegling = 				{main="Naegling",sub="Nusku Shield",range="Anarchy +2"}

-- sets.BeltOne = {waist="Chr. Bul. Pouch"}
-- sets.BeltTwo = {waist="Liv. Bul. Pouch"}

-- Precast sets to enhance JAs

sets.precast.JA['Triple Shot'] = {body="Chasseur's Frac +1"}
sets.precast.JA['Snake Eye'] = {legs="Comm. Trews +2"}
sets.precast.JA['Wild Card'] = {feet="Lanun Bottes +3"}
sets.precast.JA['Random Deal'] = {body="Lanun Frac +3"}
sets.precast.FoldDoubleBust = {hands="Lanun Gants +3"}


sets.precast.CorsairRoll = {head="Lanun Tricorne +3",back="Camulus's Mantle",neck="Regal Necklace",hands="Chasseur's Gants +1"}

-- sets.precast.CorsairRoll["Caster's Roll"] = set_combine(sets.precast.CorsairRoll, {legs="Navarch's Culottes +2"})
-- sets.precast.CorsairRoll["Courser's Roll"] = set_combine(sets.precast.CorsairRoll, {feet="Navarch's Bottes +2"})
-- sets.precast.CorsairRoll["Blitzer's Roll"] = set_combine(sets.precast.CorsairRoll, {head="Navarch's Tricorne +2"})

sets.precast.CorsairRoll["Tactician's Roll"] = set_combine(sets.precast.CorsairRoll, {body="Chasseur's Frac +1"})
sets.precast.CorsairRoll["Allies' Roll"] = set_combine(sets.precast.CorsairRoll, {hands="Chasseur's Gants +1"})

sets.precast.LuzafRing = {ring2="Luzaf's Ring"}
 
sets.precast.CorsairShot = {
	ammo=gear.QDbullet,
	head="Nyame Helm",
	body={ name="Lanun Frac +3", augments={'Enhances "Loaded Deck" effect',}},
	hands="Nyame Gauntlets",
	legs="Nyame Flanchard",
	feet="Lanun Bottes +3",
	neck=gear.cor_jse_neck,
	waist="Eschan Stone",
	left_ear="Friomisi Earring",
	right_ear="Crep. Earring",
	left_ring="Dingir Ring",
	right_ring="Regal Ring",
	back=gear.jse_mab_back,
}
	
sets.precast.CorsairShot.Damage = sets.precast.CorsairShot
sets.precast.CorsairShot.Resistant = set_combine({sets.precast.CorsairShot, feet="Chass. Bottes +1",})

sets.precast.CorsairShot['Light Shot'] = {
	ammo=gear.QDbullet,
	head="Malignance Chapeau",
	body="Malignance Tabard",
	hands="Malignance Gloves",
	legs="Malignance Tights",
	feet="Malignance Boots",
	neck="Sanctity Necklace",
	waist="Eschan Stone",
	left_ear="Digni. Earring",
	right_ear="Crep. Earring",
	left_ring="Weather. Ring +1",
	right_ring="Regal Ring",
	back=gear.jse_mab_back,
}

sets.precast.CorsairShot['Dark Shot'] = set_combine(sets.precast.CorsairShot['Light Shot'], {})


-- Waltz set (chr and vit)
sets.precast.Waltz = {}
sets.Self_Waltz = {}
-- Don't need any special gear for Healing Waltz.
sets.precast.Waltz['Healing Waltz'] = {}

-- Fast cast sets for spells
-- 65% FC

sets.precast.FC = {
	head="Carmine Mask +1", 								-- 14
	body="Adhemar Jacket +1",								-- 10
	hands="Leyline Gloves",									-- 7
	legs="Rawhide Trousers",								-- 5
	feet="Carmine Greaves +1",								-- 8
	neck="Baetyl Pendant",									-- 4
	waist=gear.dt_waist,
	left_ear="Loquac. Earring",								-- 2
	right_ear="Etiolation Earring",							-- 1
	left_ring="Weather. Ring +1",								-- 4
	right_ring="Lebeche Ring",
}

sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {body="Passion Jacket", neck="Magoraga Beads"})

sets.precast.FC.Cure = set_combine(sets.precast.FC, {right_ear="Mendi. Earring"})

-- Snapshot/Rapidshot
-- 52.5 + 10 JP = 62.5
sets.precast.RA = {
	ammo=gear.RAbullet,
	head="Taeon Chapeau",					-- 10
	body="Laksa. Frac +3",
	hands="Carmine Finger Gauntlets +1",	-- 8
	legs="Laksamana's Trews +3",			-- 15
	feet="Meghanada Jambeaux +2",			-- 10
	neck=gear.cor_jse_neck,					-- 4
	waist="Yemaya Belt",
	left_ring="Crepuscular Ring",			-- 3
	back=gear.jse_snapshot_back,			-- 10
}
	
sets.precast.RA.Flurry = set_combine(sets.precast.RA, {})
sets.precast.RA.Flurry2 = set_combine(sets.precast.RA, {})
   
-- Weaponskill sets
-- Default set for any weaponskill that isn't any more specifically defined
sets.precast.WS = {
	head="Nyame Helm",
	body="Nyame Mail",
	hands="Nyame Gauntlets",
	legs="Nyame Flanchard",
	feet={ name="Lanun Bottes +3", augments={'Enhances "Wild Card" effect',}},
	neck="Fotia Gorget",
	waist="Fotia Belt",
	left_ear="Ishvara Earring",
	right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
	left_ring="Regal Ring",
	right_ring="Rufescent Ring",
	back=gear.jse_str_back,
}

-- 31 SB
sets.precast.WS.SubtleBlow = set_combine(sets.precast.WS, {
    neck="Bathy Choker +1",
	waist="Sarissapho. Belt",
    left_ear="Digni. Earring",
	right_ring="Chirich Ring +1",
})

-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
sets.precast.WS['Evisceration'] = {
	head="Nyame Helm",
	body="Nyame Mail",
	hands="Nyame Gauntlets",
	legs="Nyame Flanchard",
	feet="Nyame Sollerets",
	neck="Fotia Gorget",
	waist="Fotia Belt",
	left_ear="Telos Earring",
	right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
	left_ring="Regal Ring",
	right_ring="Rufescent Ring",
	back=gear.jse_tp_back,
}
sets.precast.WS['Exenterator'] = sets.precast.WS

sets.precast.WS['Savage Blade'] = {
	ammo=gear.RAbullet,
	head="Nyame Helm",
	body="Nyame Mail",
	hands="Nyame Gauntlets",
	legs="Nyame Flanchard",
	feet={ name="Lanun Bottes +3", augments={'Enhances "Wild Card" effect',}},
	neck=gear.cor_jse_neck,
	waist="Sailfi Belt +1",
	left_ear="Ishvara Earring",
	right_ear="Moonshade Earring",
	left_ring="Regal Ring",
	right_ring="Rufescent Ring",
	back=gear.jse_str_back,
}

sets.precast.WS['Last Stand'] = {
	ammo=gear.WSbullet,
	head="Nyame Helm",
	body="Nyame Mail",
	hands="Nyame Gauntlets",
	legs="Nyame Flanchard",
	feet="Nyame Sollerets",
	neck=gear.cor_jse_neck,
	waist="Fotia Belt",
	left_ear="Telos Earring",
	right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
	left_ring="Regal Ring",
	right_ring="Dingir Ring",
	back=gear.jse_agi_back
}

-- 31 SB
sets.precast.WS['Last Stand'].SubtleBlow = set_combine(sets.precast.WS['Last Stand'] , {
    neck="Bathy Choker +1",
	waist="Sarissapho. Belt",
    left_ear="Digni. Earring",
	right_ring="Chirich Ring +1",
})

sets.precast.WS['Wildfire'] = {
	ammo=gear.MAbullet,
	head="Nyame Helm",
	body={ name="Lanun Frac +3", augments={'Enhances "Loaded Deck" effect',}},
	hands="Nyame Gauntlets",
	legs="Nyame Flanchard",
	feet={ name="Lanun Bottes +3", augments={'Enhances "Wild Card" effect',}},
	neck=gear.cor_jse_neck,
	waist="Eschan Stone",
	left_ear="Friomisi Earring",
	right_ear="Moonshade Earring",
	left_ring="Dingir Ring",
	right_ring="Rufescent Ring",
	back=gear.jse_mab_back,
}

sets.precast.WS['Wildfire'].STP = set_combine(sets.precast.WS.STP, {
	ammo=gear.MAbullet,
})

sets.precast.WS['Leaden Salute'] = {
	ammo=gear.MAbullet,
	head="Pixie Hairpin +1",
	body={ name="Lanun Frac +3", augments={'Enhances "Loaded Deck" effect',}},
	hands="Nyame Gauntlets",
	legs="Nyame Flanchard",
	feet={ name="Lanun Bottes +3", augments={'Enhances "Wild Card" effect',}},
	neck=gear.cor_jse_neck,
	waist="Eschan Stone",
	left_ear="Friomisi Earring",
	right_ear="Moonshade Earring",
	left_ring="Dingir Ring",
	right_ring="Archon Ring",
	back=gear.jse_mab_back,
}

sets.precast.WS['Leaden Salute'].STP = set_combine(sets.precast.WS.STP, {
	ammo=gear.MAbullet,
})

sets.MaxTP = {}
sets.AccMaxTP = {}

-- Midcast Sets
sets.midcast.FastRecast = sets.precast.FC
	
-- Specific spells
sets.midcast.Utsusemi = sets.midcast.FastRecast

-- 12% Cure Potency
sets.midcast.Cure = {
	ammo=gear.RAbullet,
	head="Nyame Helm",
	body="Nyame Mail",
	hands="Nyame Gauntlets",
	legs="Nyame Flanchard",
	feet="Nyame Sollerets",
	neck="Loricate Torque +1",
	waist=gear.dt_waist,
	left_ear="Calamitous Earring",
	right_ear="Mendi. Earring",																-- 5%
	left_ring="Vertigo Ring",
	right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
	back="Solemnity Cape",																	-- 7%
}

sets.Self_Healing = {}
sets.Cure_Received = {}
sets.Self_Refresh = {}

-- Ranged gear

sets.midcast.RA = {
	ammo=gear.RAbullet,
	head="Malignance Chapeau",
	body="Malignance Tabard",
	hands="Malignance Gloves",
	legs="Malignance Tights",
	feet="Malignance Boots",
	neck="Iskur Gorget",
	waist="Yemaya Belt",
	left_ear="Telos Earring",
	right_ear="Crep. Earring",
	left_ring="Dingir Ring",
	right_ring="Ilabrat Ring",
	back=gear.jse_midshot_back,
}

sets.midcast.RA.AM = {
	ammo=gear.RAbullet,
	head="Meghanada Visor +2",
	body="Meg. Cuirie +2",
	hands="Malignance Gloves",
	legs="Malignance Tights",
	feet="Osh. Leggings +1",
	neck="Scout's Gorget +2",
	waist="K. Kachina Belt +1",
	left_ear="Telos Earring",
	right_ear="Odr Earring",
	left_ring="Dingir Ring",
	right_ring="Ilabrat Ring",
	back=gear.jse_crit_back,
}

sets.buff['Triple Shot'] = {hands="Lanun Gants +3", body="Chasseur's Frac +1", legs="Osh. Trousers +1", feet="Osh. Leggings +1", back=gear.jse_midshot_back}

-- Sets to return to when not performing an action.
sets.DayIdle = {}
sets.NightIdle = {}
sets.buff.Doom = set_combine(sets.buff.Doom, {})
sets.resting = {}


-- Idle sets
sets.idle = {
	ammo=gear.RAbullet,
	head="Malignance Chapeau",
	body="Malignance Tabard",
	hands="Malignance Gloves",																	-- 4%
	legs="Malignance Tights",																	-- 7%
	feet="Malignance Boots",																	-- 4%
	neck="Sanctity Necklace",
	waist=gear.dt_waist,																		-- 4%
	left_ear="Infused Earring",
	right_ear="Etiolation Earring",
	left_ring="Defending Ring",																	-- 10%
	right_ring="Gelatinous Ring +1",
	back=gear.jse_tp_back,																		-- 10%
}

sets.idle.Town = {
	ammo=gear.RAbullet,
	head="Nyame Helm",
	body="Ikenga's Vest",
	hands="Nyame Gauntlets",
	legs="Nyame Flanchard",
	feet="Nyame Sollerets",
	neck=gear.cor_jse_neck,
	waist="Yemaya Belt",
	left_ear="Telos Earring",
	right_ear="Crep. Earring",
	left_ring="Regal Ring",
	right_ring="Dingir Ring",
	back=gear.jse_tp_back,
}
	
sets.idle.Refresh = set_combine(sets.idle,{
	ammo=gear.RAbullet,
	head="Rawhide Mask",
	legs="Rawhide Trousers",
})

-- Defense sets
sets.defense.PDT = {
	ammo=gear.RAbullet,
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

sets.Kiting = {legs="Carmine Cuisses +1"}
sets.TreasureHunter = set_combine(sets.TreasureHunter, {})

-- Engaged sets
sets.engaged = {
	ammo=gear.RAbullet,
	head="Malignance Chapeau",			
	body="Malignance Tabard",
	hands="Adhemar Wrist. +1",
	legs="Malignance Tights",
	feet="Malignance Boots",
	neck="Combatant's Torque",
	waist=gear.tp_dw_waist,
	left_ear="Cessance Earring",
	right_ear="Brutal Earring",
	left_ring="Ilabrat Ring",
	right_ring=gear.ring_tp,
	back=gear.jse_tp_back
}
	
sets.engaged.Acc = {
	ammo=gear.RAbullet,
	head="Carmine Mask +1",
	body="Malignance Tabard",
	hands="Adhemar Wrist. +1",
	legs="Carmine Cuisses +1",
	feet="Malignance Boots",
	neck="Combatant's Torque",
	waist=gear.tp_dw_waist,
	left_ear="Telos Earring",
	right_ear="Brutal Earring",
	left_ring="Ilabrat Ring",
	right_ring="Regal Ring",
	back=gear.jse_tp_back,
}

sets.engaged.DT = {
	ammo=gear.RAbullet,
	head="Malignance Chapeau",
	body="Malignance Tabard",		
	hands="Malignance Gloves",
	legs="Malignance Tights",
	feet="Malignance Boots",
	neck="Combatant's Torque",
	waist=gear.tp_dw_waist,
	left_ear="Telos Earring",
	right_ear="Cessance Earring",
	left_ring="Defending Ring",
	right_ring=gear.ring_tp,
	back=gear.jse_tp_back,
}

sets.engaged.Tank = {
	ammo=gear.RAbullet,
	head="Nyame Helm",
	body="Nyame Mail",
	hands="Nyame Gauntlets",
	legs="Nyame Flanchard",
	feet="Nyame Sollerets",
	neck="Combatant's Torque",
	waist=gear.tp_dw_waist,
	left_ear="Telos Earring",
	right_ear="Cessance Earring",
	left_ring="Defending Ring",
	right_ring=gear.ring_tp,
	back=gear.jse_tp_back,
}

--------
-- DW --
--------
sets.engaged.DW = set_combine(sets.engaged, {waist="Reiki Yotai", right_ear="Suppanomimi",})
sets.engaged.Acc.DW = set_combine(sets.engaged.Acc, {waist="Reiki Yotai", right_ear="Suppanomimi",})
sets.engaged.DW.DT = set_combine(sets.engaged.DT, {waist="Reiki Yotai", right_ear="Suppanomimi",})
sets.engaged.DW.Tank = set_combine(sets.engaged.DT, {waist="Reiki Yotai", right_ear="Suppanomimi",})
sets.engaged.Acc.DW.DT = set_combine(sets.engaged.DW.DT, {waist="Reiki Yotai", right_ear="Suppanomimi",})
sets.engaged.Acc.DW.Tank = set_combine(sets.engaged.DW.DT, {waist="Reiki Yotai", right_ear="Suppanomimi",})
