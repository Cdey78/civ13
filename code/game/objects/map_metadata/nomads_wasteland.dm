
/obj/map_metadata/nomads_wasteland
	ID = MAP_NOMADS_WASTELAND
	title = "Wasteland"
	lobby_icon_state = "civ13"
	no_winner ="The round is proceeding normally."
	caribbean_blocking_area_types = list(/area/caribbean/no_mans_land/invisible_wall/)
	respawn_delay = 6000 // 10 minutes!


	faction_organization = list(
		CIVILIAN,)

	roundend_condition_sides = list(
		list(CIVILIAN) = /area/caribbean/british
		)
	age = "2013"
	civilizations = TRUE
	var/tribes_nr = 1
	faction_distribution_coeffs = list(CIVILIAN = 1)
	battle_name = "the civilizations"
	mission_start_message = "<big>The world is on the verge of nuclear war... The nukes will drop in 2 to 3:30 hours. Then the world will become a wasteland. Can you survive?</big><br><b>Wiki Guide: http://civ13.com/wiki/index.php/Nomads</b>"
	ambience = list('sound/ambience/desert.ogg')
	faction1 = CIVILIAN
	availablefactions = list("Nomad")
	songs = list(
		"Words Through the Sky:1" = 'sound/music/words_through_the_sky.ogg',)
	research_active = TRUE
	nomads = TRUE
	gamemode = "Nuclear Wasteland"
	ordinal_age = 8
	default_research = 230
	research_active = FALSE
	age1_done = TRUE
	age2_done = TRUE
	age3_done = TRUE
	age4_done = TRUE
	age5_done = TRUE
	age6_done = TRUE
	age7_done = TRUE
	age8_done = TRUE
	var/nonukes = FALSE
/obj/map_metadata/nomads_wasteland/New()
	..()
	spawn(18000)
		seasons()
		var/randtimer = rand(72000,108000)
		if (!nonukes)
			nuke_proc(randtimer)
			supplydrop_proc()
/obj/map_metadata/nomads_wasteland/faction2_can_cross_blocks()
	return (processes.ticker.playtime_elapsed >= 0 || admin_ended_all_grace_periods)

/obj/map_metadata/nomads_wasteland/faction1_can_cross_blocks()
	return (processes.ticker.playtime_elapsed >= 0 || admin_ended_all_grace_periods)

/obj/map_metadata/nomads_wasteland/cross_message(faction)
	return ""

/obj/map_metadata/nomads_wasteland/proc/nuke_proc(var/timer=72000)
	if (processes.ticker.playtime_elapsed > timer && !nonukes)
		var/vx = rand(25,world.maxx-25)
		var/vy = rand(25,world.maxy-25)
		var/turf/epicenter = get_turf(locate(vx,vy,2))
		world << "<font size=3 color='red'><center>ATTENTION<br>A nuclear missile is incoming! Take cover!</center></font>"
		var/warning_sound = sound('sound/misc/siren.ogg', repeat = FALSE, wait = TRUE, channel = 777)
		for (var/mob/M in player_list)
			M.client << warning_sound
		spawn(330)
			world << "<font size=3 color='red'>A nuclear explosion has happened! <br><i>(Game might freeze/lag for a while while processing, please wait)</i></font>"
			nuke_map(epicenter, 200, 180, 0)
			message_admins("Automatic nuke deployed at ([epicenter.x],[epicenter.y],[epicenter.z]) in area [epicenter.loc.name].")
			log_game("Automatic nuke deployed at ([epicenter.x],[epicenter.y],[epicenter.z]) in area [epicenter.loc.name].")
			return
	else
		spawn(600)
			nuke_proc(timer)
	return
/obj/map_metadata/nomads_wasteland/proc/supplydrop_proc()
	if (world_radiation >= 280 && !nonukes)
		var/droptype = pick("supplies","food","weapons","medicine")
		var/turf/locationt = pick(supplydrop_turfs)
		switch(droptype)
			if("supplies")
				world << "<font size=3 color='red'><center>EMERGENCY BROADCAST SYSTEM<br>Supplies have been airdropped in the area!</center></font>"
				new/obj/structure/closet/crate/airdrops/supplies(locationt)

			if("food")
				world << "<font size=3 color='red'><center>EMERGENCY BROADCAST SYSTEM<br>Food has been airdropped in the area!</center></font>"
				new/obj/structure/closet/crate/airdrops/food(locationt)
				new/obj/item/weapon/reagent_containers/glass/barrel/modern/water(locationt)

			if("weapons")
				world << "<font size=3 color='red'><center>EMERGENCY BROADCAST SYSTEM<br>Weapons and ammunition have been airdropped in the area!</center></font>"
				new/obj/structure/closet/crate/airdrops/weapons(locationt)

			if("military")
				world << "<font size=3 color='red'><center>EMERGENCY BROADCAST SYSTEM<br>military equipment have been airdropped in the area!</center></font>"
				new/obj/structure/closet/crate/airdrops/military(locationt)

			if("medicine")
				world << "<font size=3 color='red'><center>EMERGENCY BROADCAST SYSTEM<br>Medicine has been airdropped in the area!</center></font>"
				new/obj/structure/closet/crate/airdrops/medicine(locationt)
	spawn(rand(36000, 72000))
		supplydrop_proc()

/obj/map_metadata/nomads_wasteland/job_enabled_specialcheck(var/datum/job/J)
	if (J.is_nomad == TRUE)
		. = TRUE
	else
		. = FALSE


//////////////////////////////////
////////Wasteland 2///////////////
/*
/obj/map_metadata/nomads_wasteland/two
	ID = MAP_NOMADS_WASTELAND_2
	title = "Wasteland II"
	gamemode = "Wasteland"
	nonukes = TRUE

	mission_start_message = "<big>Something has gone terribly wrong. Monsters roam the world, and society has fallen. Can you survive?</big><br><b>Wiki Guide: http://civ13.com/wiki/index.php/Nomads</b>"
	ambience = list('sound/ambience/desert.ogg')

/obj/map_metadata/nomads_wasteland/two/proc/zombies(var/start = TRUE)
	for(var/obj/effect/spawner/mobspawner/zombies/special/S in world)
		S.activated = start
*/

//////////////////////////////////
////////Wasteland Standard///////////////
/obj/map_metadata/wasteland
	ID = MAP_WASTELAND
	title = "Apocalypse Now"
	lobby_icon_state = "nuke"
	no_winner ="The survivors haven't yet perished."
	caribbean_blocking_area_types = list(/area/caribbean/no_mans_land/invisible_wall/)
	respawn_delay = 15 //practically nothing, due to this being a special sort of map.
	is_RP = TRUE
//	nomads = TRUE

	faction_organization = list(
		AMERICAN,
		CIVILIAN)

	roundend_condition_sides = list(
		list(AMERICAN) = /area/caribbean/british,
		list(CIVILIAN) = /area/caribbean/japanese
		)
	age = "2018"
	faction_distribution_coeffs = list(AMERICAN = 2, CIVILIAN = 0.5)
	battle_name = "battle of the bunker"
	mission_start_message = "<big>You're just some unlucky bastard stuck in a post-apocalyptic location. You don't even know when or if you'll eat again. - However, you've heard rumors of a Government bunker nearby - could that be salvation?</big>"
	faction1 = AMERICAN
	faction2 = CIVILIAN
	valid_weather_types = list(WEATHER_WET, WEATHER_NONE, WEATHER_EXTREME)
	songs = list(
		"All Clear:1" = 'sound/music/allclearsignal.ogg',)
	artillery_count = 3
	ambience = list('sound/ambience/desert.ogg')
	gamemode = "Nuclear Holocaust"
	var/nonukes = FALSE

/obj/map_metadata/wasteland/New()
	..()
	spawn(18000)
		seasons()
		var/randtimer = rand(216000,432000)//temp increase to six/twelve hours for the random timer, to 'disable' nukes.
		if (!nonukes)
			nuke_proc(randtimer)
			supplydrop_proc()
/obj/map_metadata/wasteland/faction2_can_cross_blocks()
	return (processes.ticker.playtime_elapsed >= 0 || admin_ended_all_grace_periods)

/obj/map_metadata/wasteland/faction1_can_cross_blocks()
	return (processes.ticker.playtime_elapsed >= 0 || admin_ended_all_grace_periods)

/obj/map_metadata/wasteland/cross_message(faction)
	return ""

/obj/map_metadata/wasteland/proc/nuke_proc(var/timer=72000)
	if (processes.ticker.playtime_elapsed > timer && !nonukes)
		var/vx = rand(25,world.maxx-25)
		var/vy = rand(25,world.maxy-25)
		var/turf/epicenter = get_turf(locate(vx,vy,2))
		world << "<font size=3 color='red'><center>ATTENTION<br>A nuclear missile is incoming! Take cover!</center></font>"
		var/warning_sound = sound('sound/misc/siren.ogg', repeat = FALSE, wait = TRUE, channel = 777)
		for (var/mob/M in player_list)
			M.client << warning_sound
		spawn(330)
			world << "<font size=3 color='red'>A nuclear explosion has happened! <br><i>(Game might freeze/lag for a while while processing, please wait)</i></font>"
			nuke_map(epicenter, 200, 180, 0)
			message_admins("Automatic nuke deployed at ([epicenter.x],[epicenter.y],[epicenter.z]) in area [epicenter.loc.name].")
			log_game("Automatic nuke deployed at ([epicenter.x],[epicenter.y],[epicenter.z]) in area [epicenter.loc.name].")
			return
	else
		spawn(600)
			nuke_proc(timer)
	return

/obj/map_metadata/wasteland/proc/supplydrop_proc()
	if (world_radiation >= 280 && !nonukes)
		var/droptype = pick("supplies","food","weapons","medicine")
		var/turf/locationt = pick(supplydrop_turfs)
		switch(droptype)
			if("supplies")
				world << "<font size=3 color='red'><center>EMERGENCY BROADCAST SYSTEM<br>Supplies have been airdropped in the area!</center></font>"
				new/obj/structure/closet/crate/airdrops/supplies(locationt)

			if("food")
				world << "<font size=3 color='red'><center>EMERGENCY BROADCAST SYSTEM<br>Food has been airdropped in the area!</center></font>"
				new/obj/structure/closet/crate/airdrops/food(locationt)
				new/obj/item/weapon/reagent_containers/glass/barrel/modern/water(locationt)

			if("weapons")
				world << "<font size=3 color='red'><center>EMERGENCY BROADCAST SYSTEM<br>Weapons and ammunition have been airdropped in the area!</center></font>"
				new/obj/structure/closet/crate/airdrops/weapons(locationt)

			if("military")
				world << "<font size=3 color='red'><center>EMERGENCY BROADCAST SYSTEM<br>Military equipment has been airdropped in the area!</center></font>"
				new/obj/structure/closet/crate/airdrops/military(locationt)

			if("medicine")
				world << "<font size=3 color='red'><center>EMERGENCY BROADCAST SYSTEM<br>Medicine has been airdropped in the area!</center></font>"
				new/obj/structure/closet/crate/airdrops/medicine(locationt)
	spawn(rand(15000, 21000))
		supplydrop_proc()

/obj/map_metadata/wasteland/job_enabled_specialcheck(var/datum/job/J)
	..()
	if (istype(J, /datum/job/american))
		if (J.is_wasteland)
			. = TRUE
		else
			. = FALSE
	if (istype(J, /datum/job/civilian))
		if (J.is_wasteland)
			. = TRUE
		else
			. = FALSE

/obj/map_metadata/wasteland/proc/zombies(var/start = TRUE)
	for(var/obj/effect/spawner/mobspawner/zombies/special/S in world)
		S.activated = start