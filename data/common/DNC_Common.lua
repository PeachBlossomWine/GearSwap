autows_list = {['Aeneas']='Rudra\'s Storm',['Terpsichore']='Pyrrhic Kleos',['Mpu']='Ruthless Stroke',['MpuCento']='Ruthless Stroke',['Karambit']='Asuran Fists',}

sets.TreasureHunter = set_combine(sets.TreasureHunter, {})

if item_available("Maculele Earring +2") then
	gear.empy_earring = "Maculele Earring +2"
elseif item_available("Maculele Earring +1") then
	gear.empy_earring = "Maculele Earring +1"
else
	gear.empy_earring = "Telos Earring"
end

if item_available("Maculele Tiara +3") then
	gear.jse_empy_head = "Maculele Tiara +3"
elseif item_available("Maculele Tiara +2") then
	gear.jse_empy_head = "Maculele Tiara +2"
else
	gear.jse_empy_head = "Maculele Tiara +1"
end



-- Weapons sets
sets.weapons.Aeneas = {main="Aeneas",sub="Crepuscular Knife"}
sets.weapons.Terpsichore = {main="Terpsichore",sub="Crepuscular Knife"}
sets.weapons.Mpu = {main="Mpu Gandring",sub="Crepuscular Knife"}
sets.weapons.MpuCento = {main="Mpu Gandring",sub="Centovente"}
sets.weapons.Karambit = {main="Karambit",sub=empty}

-- Precast Sets

-- Precast sets to enhance JAs
sets.precast.JA['No Foot Rise'] = {body="Horos Casaque +3"}
sets.precast.JA['Trance'] = {head="Horos Tiara +3"}


-- Waltz set (chr and vit)
sets.precast.Waltz = {
	ammo="Yamarang",
	head={ name="Horos Tiara +3", augments={'Enhances "Trance" effect',}},		-- 15
	body="Gleti's Cuirass",														-- 10
	hands="Maxixi Bangles +3",
	legs="Dashing Subligar",													-- 10
	feet="Maxixi Toe Shoes +3",													-- 15
	neck="Etoile Gorget +2",
	waist="Flume Belt +1",
	left_ear="Odnowa Earring +1",
	right_ear="Handler's Earring +1",
	left_ring="Defending Ring",
	right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
	back=gear.waltz_back,
}
	
sets.Self_Waltz = {} --body="Passion Jacket"
	
-- Don't need any special gear for Healing Waltz.
sets.precast.Waltz['Healing Waltz'] = {}
sets.precast.Samba = {head="Maxixi Tiara +3", back=gear.jse_stp_back}
sets.precast.Jig = {legs="Horos Tights +3", feet="Maxixi Toe Shoes +3"}

sets.precast.Step = {
	ammo="Yamarang",
	head="Maxixi Tiara +3",
	body="Malignance Tabard",
	hands="Maxixi Bangles +3",
	legs="Malignance Tights",
	feet={ name="Horos T. Shoes +3", augments={'Enhances "Closed Position" effect',}},
	neck="Etoile Gorget +2",
	waist="Null Belt",
	left_ear="Digni. Earring",
	right_ear="Telos Earring",
	left_ring="Regal Ring",
	right_ring="Ilabrat Ring",
	back=gear.jse_stp_back,
}
	
	sets.Enmity = {}
	
sets.precast.JA.Provoke = sets.Enmity

sets.precast.Flourish1 = {}
sets.precast.Flourish1['Violent Flourish'] = {
	ammo="Yamarang",
	head="Malignance Chapeau",
	body="Horos Casaque +3",
	hands="Malignance Gloves",
	legs="Malignance Tights",
	feet="Malignance Boots",
	neck="Etoile Gorget +2",
	waist="Eschan Stone",
	left_ear="Digni. Earring",
	right_ear="Telos Earring",
	left_ring="Regal Ring",
	right_ring="Ilabrat Ring",
	back=gear.jse_stp_back,
}
	
sets.precast.Flourish1['Animated Flourish'] = sets.Enmity
	
sets.precast.Flourish1['Desperate Flourish'] = {
	ammo="Yamarang",
	head="Malignance Chapeau",
	body="Malignance Tabard",
	hands="Malignance Gloves",
	legs="Malignance Tights",
	feet="Malignance Boots",
	neck="Etoile Gorget +2",
	waist="Reiki Yotai",
	left_ear="Digni. Earring",
	right_ear="Telos Earring",
	left_ring="Regal Ring",
	right_ring="Ilabrat Ring",
	back=gear.jse_stp_back,
}

sets.precast.Flourish2 = {}
sets.precast.Flourish2['Reverse Flourish'] = {back=gear.waltz_back}

sets.precast.Flourish3 = {}
sets.precast.Flourish3['Striking Flourish'] = {}
sets.precast.Flourish3['Climactic Flourish'] = {
	ammo="Yamarang",
	head=gear.jse_empy_head,
	body="Nyame Mail",
	hands="Nyame Gauntlets",
	legs="Nyame Flanchard",
	feet="Nyame Sollerets",
	neck="Etoile Gorget +2",
	waist="Fotia Belt",
	left_ear="Moonshade Earring",
	right_ear="Odr Earring",
	left_ring="Regal Ring",
	right_ring="Ilabrat Ring",
	back=gear.jse_wsd_back,
}

-- Fast cast sets for spells

sets.precast.FC = {
	ammo="Sapience Orb",
	head="Nyame Helm",
	body="Adhemar Jacket +1",
	hands="Leyline Gloves",
	legs="Nyame Flanchard",
	feet="Nyame Sollerets",
	neck="Baetyl Pendant",
	waist="Flume Belt +1",
	left_ear="Loquac. Earring",
	right_ear="Etiolation Earring",
	left_ring=gear.weather_ring,
	right_ring="Medada's Ring",
	back=gear.jse_stp_back,
}

sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {})

   
-- Weaponskill sets
-- Default set for any weaponskill that isn't any more specifically defined
sets.precast.WS = {
	ammo="Oshasha's Treatise",
	head=gear.jse_empy_head,
	body="Nyame Mail",
	hands="Nyame Gauntlets",
	legs="Nyame Flanchard",
	feet="Nyame Sollerets",
	neck="Etoile Gorget +2",
	waist="Fotia Belt",
	left_ear="Moonshade Earring",
	right_ear="Ishvara Earring",
	left_ring="Regal Ring",
	right_ring="Beithir Ring",
	back=gear.jse_wsd_back,
}

-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
sets.precast.WS["Rudra's Storm"] = {
	ammo="Oshasha's Treatise",
	head=gear.jse_empy_head,
	body="Nyame Mail",
	hands="Nyame Gauntlets",
	legs="Nyame Flanchard",
	feet="Nyame Sollerets",
	neck="Etoile Gorget +2",
	waist="Fotia Belt",
	left_ear="Moonshade Earring",
	right_ear="Odr Earring",
	left_ring="Regal Ring",
	right_ring="Ilabrat Ring",
	back=gear.jse_wsd_back,
}

sets.precast.WS['Evisceration'] = set_combine(sets.precast.WS, {})
sets.precast.WS['Pyrrhic Kleos'] = {
	ammo="Oshasha's Treatise",
	head=gear.jse_empy_head,
	body="Nyame Mail",
	hands="Nyame Gauntlets",
	legs="Nyame Flanchard",
	feet="Nyame Sollerets",
	neck="Etoile Gorget +2",
	waist="Fotia Belt",
	left_ear="Sherida Earring",
	right_ear="Cessance Earring",
	left_ring="Regal Ring",
	right_ring="Gere Ring",
	back=gear.jse_str_back,	
}

sets.precast.WS['Ruthless Stroke'] = {
	ammo="Oshasha's Treatise",
	head=gear.jse_empy_head,
	body="Nyame Mail",
	hands="Nyame Gauntlets",
	legs="Nyame Flanchard",
	feet="Nyame Sollerets",
	neck="Etoile Gorget +2",
	waist="Fotia Belt",
	left_ear="Sherida Earring",
	right_ear=gear.empy_earring,
	left_ring="Regal Ring",
	right_ring="Gere Ring",
	back=gear.jse_str_back,	
}

-- 20 SB
sets.precast.WS.SubtleBlow = set_combine(sets.precast.WS, {
	waist="Sarissapho. Belt",
    left_ear="Sherida Earring",
	right_ring="Chirich Ring +1",
})

sets.precast.WS['Ruthless Stroke'].SubtleBlow = set_combine(sets.precast.WS['Ruthless Stroke'] , {
	waist="Sarissapho. Belt",
    left_ear="Sherida Earring",
	right_ring="Chirich Ring +1",
})

sets.precast.WS['Rudra\'s Storm'].SubtleBlow = set_combine(sets.precast.WS['Rudra\'s Storm'] , {
	waist="Sarissapho. Belt",
    left_ear="Sherida Earring",
	right_ring="Chirich Ring +1",
})
-- Swap to these on Moonshade using WS if at 3000 TP
sets.MaxTP = {ear1="Sherida Earring",ear2="Ishvara Earring"}
sets.AccMaxTP = {ear1="Sherida Earring",ear2="Telos Earring"}
sets.Skillchain = {}

-- Midcast Sets
sets.midcast.FastRecast = sets.precast.FC
sets.midcast.Utsusemi = set_combine(sets.midcast.FastRecast, {})

-- Sets to return to when not performing an action.

-- Resting sets
sets.resting = {}
sets.ExtraRegen = {}

-- Idle sets
sets.idle = {
	ammo="Staunch Tathlum +1",			-- 3%
	head="Malignance Chapeau",
	body="Gleti's Cuirass",
	hands="Gleti's Gauntlets",
	legs="Malignance Tights",
	feet="Malignance Boots",
	neck="Sanctity Necklace",
	waist="Null Belt",
	left_ear="Infused Earring",
	right_ear="Etiolation Earring",
	left_ring="Defending Ring",			-- 10%
	right_ring="Gelatinous Ring +1",
	back=gear.jse_stp_back,				-- 10%
}
	
sets.idle.DT = set_combine(sets.idle, {
	head="Nyame Helm",
	legs="Nyame Flanchard",
	feet="Nyame Sollerets",
	neck="Loricate Torque +1",
})

sets.idle.Regain = set_combine(sets.idle, {
	head="Null Masque",
	legs="Gleti's Breeches",
	feet="Gleti's Boots",
	neck="Loricate Torque +1",
})

sets.idle.Town = {
	ammo="Coiste Bodhar",
	head="Nyame Helm",
	body="Nyame Mail",
	hands="Nyame Gauntlets",
	legs="Nyame Flanchard",
	feet="Nyame Sollerets",
	neck="Etoile Gorget +2",
	waist="Windbuffet Belt +1",
	left_ear="Sherida Earring",
	right_ear="Telos Earring",
	left_ring="Gere Ring",
	right_ring="Chirich Ring +1",
	back=gear.jse_stp_back,
}	

-- Defense sets
sets.defense.PDT = {
	ammo="Staunch Tathlum +1",
	head="Nyame Helm",
	body="Adamantite Armor",
	hands="Nyame Gauntlets",
	legs="Nyame Flanchard",
	feet="Nyame Sollerets",
	neck="Loricate Torque +1",
	waist="Flume Belt +1",
	left_ear="Odnowa Earring +1",
	right_ear="Etiolation Earring",
	left_ring="Defending Ring",
	right_ring="Gelatinous Ring +1",
	back=gear.dt_moon_back,
}

sets.defense.MDT = sets.defense.PDT
sets.defense.MEVA = sets.defense.PDT
sets.Kiting = {feet="Tandava Crackows"}
sets.rollerRing = {left_ring="Roller's Ring"}

-- Engaged sets

sets.engaged = {
	ammo="Coiste Bodhar",
	head="Malignance Chapeau",
	body="Horos Casaque +3",
	hands="Gleti's Gauntlets",
	legs="Malignance Tights",
	feet="Horos T. Shoes +3",
	neck="Etoile Gorget +2",
	waist="Windbuffet Belt +1",
	left_ear="Sherida Earring",
	right_ear=gear.empy_earring,
	left_ring="Gere Ring",
	right_ring="Chirich Ring +1",
	back=gear.jse_stp_back,
}

sets.engaged.DT = {
	ammo="Coiste Bodhar",
	head="Nyame Helm",
	body="Malignance Tabard",
	hands="Malignance Gloves",
	legs="Malignance Tights",
	feet="Nyame Sollerets",
	neck="Etoile Gorget +2",
	waist="Windbuffet Belt +1",
	left_ear="Sherida Earring",
	right_ear=gear.empy_earring,
	left_ring="Defending Ring",
	right_ring="Chirich Ring +1",
	back=gear.jse_stp_back,
}

sets.engaged.Regain = {
	ammo="Coiste Bodhar",
	head="Null Masque",
	body="Gleti's Cuirass",
	hands="Gleti's Gauntlets",
	legs="Gleti's Breeches",
	feet="Gleti's Boots",
	neck="Etoile Gorget +2",
	waist="Windbuffet Belt +1",
	left_ear="Sherida Earring",
	right_ear=gear.empy_earring,
	left_ring="Roller's Ring",
	right_ring="Chirich Ring +1",
	back=gear.jse_stp_back,
}

-- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
sets.buff['Saber Dance'] = {legs="Horos Tights +3"}
sets.buff['Climactic Flourish'] = {head=gear.jse_empy_head} --ammo="Charis Feather", 
sets.buff.Doom = set_combine(sets.buff.Doom, {})