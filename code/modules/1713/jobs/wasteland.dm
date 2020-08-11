/datum/job/american/captain_wasteland
	title = "U.S. Army Captain"
	rank_abbreviation = "Cpt."

	spawn_location = "JoinLateWasteCap"

	is_officer = TRUE
	is_commander = TRUE
	whitelisted = FALSE
	is_radioman = TRUE
	is_wasteland = TRUE
	can_get_coordinates = TRUE

	min_positions = 1
	max_positions = 1

/datum/job/american/captain_wasteland/equip(var/mob/living/human/H)
	if (!H)	return FALSE
//shoes
	H.equip_to_slot_or_del(new /obj/item/clothing/shoes/jackboots(H), slot_shoes)

//clothes
	H.equip_to_slot_or_del(new /obj/item/clothing/under/us_uni/us_camo_ocp(H), slot_w_uniform)

	var/obj/item/clothing/under/uniform = H.w_uniform
	var/obj/item/clothing/accessory/holster/hip/holsterh = new /obj/item/clothing/accessory/holster/hip(null)
	uniform.attackby(holsterh, H)

	H.add_note("Role", "You are a <b>[title]</b>. You are in charge of the bunker. A tactical nuclear strike to purify the area of infection has been authorized, and may happen within a few hours. A warning will be sent ahead of time. Organize your troops!")
	H.setStat("strength", STAT_NORMAL)
	H.setStat("crafting", STAT_VERY_HIGH)
	H.setStat("rifle", STAT_VERY_HIGH)
	H.setStat("dexterity", STAT_NORMAL)
	H.setStat("swords", STAT_NORMAL)
	H.setStat("pistol", STAT_VERY_HIGH)
	H.setStat("bows", STAT_NORMAL)
	H.setStat("medical", STAT_VERY_HIGH)
	H.setStat("machinegun", STAT_VERY_HIGH)
	return TRUE

/datum/job/american/lieutenant_wasteland
	title = "U.S. Army Lieutenant"
	rank_abbreviation = "Lt."

	spawn_location = "JoinLateWastelandLieutenant"

	is_officer = TRUE
	is_commander = FALSE
	can_get_coordinates = TRUE
	whitelisted = FALSE
	is_radioman = TRUE
	is_wasteland = TRUE
	is_squad_leader = TRUE
	uses_squads = TRUE

	min_positions = 1
	max_positions = 1

/datum/job/american/lieutenant_wasteland/equip(var/mob/living/human/H)
	if (!H)	return FALSE
//shoes
	H.equip_to_slot_or_del(new /obj/item/clothing/shoes/jackboots(H), slot_shoes)

//clothes
	H.equip_to_slot_or_del(new /obj/item/clothing/under/us_uni/us_camo_ocp(H), slot_w_uniform)

	var/obj/item/clothing/under/uniform = H.w_uniform
	var/obj/item/clothing/accessory/holster/hip/holsterh = new /obj/item/clothing/accessory/holster/hip(null)
	uniform.attackby(holsterh, H)

	H.add_note("Role", "You are a <b>[title]</b>. You are in charge of the defence group. Organize your troops accordingly!")
	H.setStat("strength", STAT_NORMAL)
	H.setStat("crafting", STAT_VERY_HIGH)
	H.setStat("rifle", STAT_VERY_HIGH)
	H.setStat("dexterity", STAT_NORMAL)
	H.setStat("swords", STAT_NORMAL)
	H.setStat("pistol", STAT_VERY_HIGH)
	H.setStat("bows", STAT_NORMAL)
	H.setStat("medical", STAT_VERY_HIGH)
	H.setStat("machinegun", STAT_VERY_HIGH)
	return TRUE


/datum/job/american/soldier_wasteland
	title = "U.S. Army Rifleman"
	rank_abbreviation = "PFC."

	spawn_location = "JoinLateWastelandRifleman"

	is_wasteland = TRUE
	uses_squads = TRUE

	min_positions = 4
	max_positions = 4

/datum/job/american/soldier_wasteland/equip(var/mob/living/human/H)
	if (!H)	return FALSE
//shoes
	H.equip_to_slot_or_del(new /obj/item/clothing/shoes/jackboots(H), slot_shoes)

//clothes
	H.equip_to_slot_or_del(new /obj/item/clothing/under/us_uni/us_lightuni2(H), slot_w_uniform)

	H.add_note("Role", "You are a <b>[title]</b>, a basic grunt. Follow orders and defend the bunker!")
	H.setStat("strength", STAT_NORMAL)
	H.setStat("crafting", STAT_NORMAL)
	H.setStat("rifle", STAT_NORMAL)
	H.setStat("dexterity", STAT_NORMAL)
	H.setStat("swords", STAT_NORMAL)
	H.setStat("pistol", STAT_NORMAL)
	H.setStat("bows", STAT_NORMAL)
	H.setStat("medical", STAT_NORMAL)
	H.setStat("machinegun", STAT_NORMAL)
	return TRUE






/////////
// Civs
/////////

/datum/job/civilian/survivor
	title = "Survivor"
	rank_abbreviation = ""

	spawn_location = "JoinLateWastelandCiv"

	is_wasteland = TRUE

	min_positions = 1
	max_positions = 100

/datum/job/civilian/survivor/equip(var/mob/living/human/H)
	if (!H)	return FALSE

//shoes
	if (prob(50))
		H.equip_to_slot_or_del(new /obj/item/clothing/shoes/flipflops(H), slot_shoes)
	else
		H.equip_to_slot_or_del(new /obj/item/clothing/shoes/black(H), slot_shoes)

//clothes
	var/randcloth = rand(1,6)
	if (randcloth == 1)
		H.equip_to_slot_or_del(new /obj/item/clothing/under/modern1(H), slot_w_uniform)
	else if (randcloth == 2)
		H.equip_to_slot_or_del(new /obj/item/clothing/under/modern2(H), slot_w_uniform)
	else if (randcloth == 3)
		H.equip_to_slot_or_del(new /obj/item/clothing/under/modern3(H), slot_w_uniform)
	else if (randcloth == 4)
		H.equip_to_slot_or_del(new /obj/item/clothing/under/modern4(H), slot_w_uniform)
	else if (randcloth == 5)
		H.equip_to_slot_or_del(new /obj/item/clothing/under/modern7(H), slot_w_uniform)
	else if (randcloth == 6)
		H.equip_to_slot_or_del(new /obj/item/clothing/under/modern8(H), slot_w_uniform)

//head
	var/randcloth3 = rand(1,3)
	if (randcloth3 == 1)
		H.equip_to_slot_or_del(new /obj/item/clothing/head/flatcap1(H), slot_head)
	else if (randcloth3 == 2)
		H.equip_to_slot_or_del(new /obj/item/clothing/head/bandana(H), slot_head)
	else if (randcloth3 == 3)
		H.equip_to_slot_or_del(new /obj/item/clothing/head/black_bandana(H), slot_head)

//jacket
	var/randcloth2 = rand(1,5)
	if (randcloth2 == 1)
		H.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/jacket/black_suit(H), slot_wear_suit)
	else if (randcloth2 == 2)
		H.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/jacket/blackvest(H), slot_wear_suit)
	else if (randcloth2 == 3)
		H.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/jacket/bluevest(H), slot_wear_suit)
	else if (randcloth2 == 4)
		H.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/jacket/olivevest(H), slot_wear_suit)
	else if (randcloth2 == 5)
		H.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/jacket/checkered_suit(H), slot_wear_suit)

//mask
	if (prob(80))
		var/randcloth4 = rand(1,2)
		if (randcloth4 == 1)
			H.equip_to_slot_or_del(new /obj/item/clothing/mask/shemagh/greykerchief(H), slot_wear_mask)
		else if (randcloth4 == 2)
			H.equip_to_slot_or_del(new /obj/item/clothing/mask/shemagh/redkerchief(H), slot_wear_mask)

//belt
	var/randweap = rand(1,8)
	if (randweap == 1)
		H.equip_to_slot_or_del(new /obj/item/weapon/material/hatchet(H), slot_belt)
	else if (randweap == 2)
		H.equip_to_slot_or_del(new /obj/item/weapon/material/kitchen/utensil/knife/shank/glass(H), slot_belt)
	else if (randweap == 3)
		H.equip_to_slot_or_del(new /obj/item/weapon/material/handle(H), slot_belt)
	else if (randweap == 4)
		H.equip_to_slot_or_del(new /obj/item/weapon/material/machete(H), slot_belt)
	else if (randweap == 5)
		H.equip_to_slot_or_del(new /obj/item/weapon/shovel/spade/foldable(H), slot_belt)
	else if (randweap == 6)
		H.equip_to_slot_or_del(new /obj/item/weapon/gun/projectile/revolver/makeshift(H), slot_belt)
	else if (randweap == 7)
		H.equip_to_slot_or_del(new /obj/item/weapon/radio/walkietalkie(H), slot_belt)
	else if (randweap == 8)
		H.equip_to_slot_or_del(new /obj/item/weapon/storage/belt/leather(H), slot_belt)

	H.add_note("Role", "You are a <b>[title]</b>, held up in New Manchester. You've heard the news, and dedicated yourself to search for that mythical bunker!")
	H.setStat("strength", STAT_NORMAL)
	H.setStat("crafting", STAT_NORMAL)
	H.setStat("rifle", STAT_NORMAL)
	H.setStat("dexterity", STAT_NORMAL)
	H.setStat("swords", STAT_NORMAL)
	H.setStat("pistol", STAT_NORMAL)
	H.setStat("bows", STAT_NORMAL)
	H.setStat("medical", STAT_NORMAL)

	return TRUE