// DATA_STAR
//Anti cheat... well if your smart you can get around this but dont!
GLOBAL_LIST_INIT(data_star_data_bool, list(
	"ALLOW_DATA_STAR_SPAWNING"					= TRUE,
	"DATA_STAR_SPAWNED"							= FALSE,
	"ALLOW_MUlTABLE_DATA_STAR_SPAWNING"			= FALSE))


// backround information!

/*
An AI core designed by GP to do one thing, kombat! Unlike other AIs this one is printed of to *scale*
This is a *delta level issue* and should not be mapped or spawned in without proper reason (I.E non-cannon round or events)
This boss has 10 modes, a self revive system and a self healing
As well as an "RCD" (Rapid Cover Devide)
Will gain armor based on damage type
Will gain EMP/Bomb protection
This monster is borderline unkillable and will make players upset

*/
/mob/living/carbon/superior_animal/robot/greyson/true_boss_data_star
	name = "Data Star"
	desc = "A clearly well built drone by Greyson, it sports a hologram eye that scans everything around. \
	The unending feeling of dread builds up around this with its pure calculating killing gaze."

	icon_state = "data_fighter"
	icon_living = "data_fighter"
	pass_flags = PASSTABLE

	mob_size = MOB_MEDIUM

	//Deep blues year x 10
	maxHealth = 19970
	health = 19970

	faction = "greyson"

	deathmessage = "blinks its hologram eye stating \"Tactical Retreat Code 9A4C2\" before being teleported away."
	attacktext = "toppled"
	attack_sound = 'sound/weapons/smash.ogg'
	speak_emote = list("calculates") //Liers
	emote_see = list("Data found.", "I'm harmless.", "I'm willing to be peaceful.", "I'll pay you to betray your allies!", "bobbles", "emits a plinking sound", "scans", "emits a ping sound", "plays some distorted music")
	speak_chance = 5 //Chatty

	//Little slow, we shoot not melee basically
	move_to_delay = 2
	turns_per_move = 2

	see_in_dark = 14
	meat_type = null
	meat_amount = 0
	stop_automated_movement_when_pulled = 0

	melee_damage_lower = 20
	melee_damage_upper = 20

	destroy_surroundings = FALSE
	armor = list(melee = -30, bullet = -30, energy = -30, bomb = -30, bio = 100, rad = 100) //Starting wise we are less then armorless

	contaminant_immunity = TRUE

	light_range = 6
	light_color = COLOR_LIGHTING_BLUE_BRIGHT
	mob_classification = CLASSIFICATION_SYNTHETIC

	reload_message = "ejects a spent box of ammo as it rearms its weaponry with machinelike speed!"

	ranged = TRUE //will it shoot?
	rapid = FALSE //will it shoot fast?

	projectiletype = /obj/item/projectile/beam/pulse/drone
	projectilesound = 'sound/weapons/Gunshot.ogg'
	limited_ammo = FALSE
	casingtype = null
	ranged_cooldown = 5
	fire_verb = "fires"
	acceptableTargetDistance = 12
	comfy_range = 7
	range_telegraph = " hums, aiming at"

	sanity_damage = 5 //You are looking at a mechanical higher power. Be afraid
	ranged_cooldown = 5

	sight = SEE_TURFS|SEE_MOBS|SEE_OBJS|SEE_SELF

	//Fancy vars below
	var/kcorp_moduals = 3
	var/mode = 1
	var/data_count = 0
	var/able_to_build = FALSE
	var/built_up_rage = 0
	var/dieing = FALSE
	var/turrets_can_build = FALSE
	var/walls_to_make = 3
	var/turrets_to_make = 2
	var/marked_for_death = FALSE
	var/allow_teleporters = TRUE
	var/returning_fire = FALSE

	allowed_stat_modifiers = list()

/mob/living/carbon/superior_animal/robot/greyson/true_boss_data_star/New()
	//All my fault? I daresay its thanks to me!
	if(!GLOB.data_star_data_bool["ALLOW_DATA_STAR_SPAWNING"] || GLOB.data_star_data_bool["DATA_STAR_SPAWNED"])
		..()
		kcorp_moduals = 0
		marked_for_death = TRUE
		dust()
		to_chat(world, "<b><font color='#ffaa00'>Data Star Unable To Target.</font></b>")
	else
		to_chat(world, "<b><font color='#ffaa00'>Data Star Target Found.</font></b>")
		level_fithteen_announcement()
		GLOB.data_star_data_bool["DATA_STAR_SPAWNED"] = !GLOB.data_star_data_bool["DATA_STAR_SPAWNED"]
		GLOB.data_star_data_bool["ALLOW_DATA_STAR_SPAWNING"] = !GLOB.data_star_data_bool["ALLOW_DATA_STAR_SPAWNING"]
		..()
		update_floating()

/mob/living/carbon/superior_animal/robot/greyson/true_boss_data_star/update_sight()
	if(stat == DEAD || eyeobj)
		update_dead_sight()

/mob/living/carbon/superior_animal/robot/greyson/true_boss_data_star/update_floating()
	make_floating(1)

/mob/living/carbon/superior_animal/robot/greyson/true_boss_data_star/proc/handled_mode()
	colony_friend = FALSE
	friendly_to_colony = FALSE
	faction = "greyson"

	if(!kcorp_moduals)
		delay_for_range = 0.4 SECONDS
		delay_for_rapid_range = 0.3 SECONDS
		delay_for_melee = 0 SECONDS
		delay_for_all = 0.1 SECONDS
		armor = list(melee = 35, bullet = 35, energy = 35, bomb = 70, bio = 100, rad = 100) //We are now in self-defence mode
		projectiletype = /obj/item/projectile/beam/shotgun/strong

	if(data_count >= 4000)
		turrets_can_build = TRUE
		armor = list(melee = 15, bullet = 15, energy = 15, bomb = 15, bio = 100, rad = 100)
		emp_damage = FALSE
		return

	if(data_count >= 3500)
		armor = list(melee = 5, bullet = 5, energy = 5, bomb = 5, bio = 100, rad = 100)
		emp_damage = FALSE
		return

	if(data_count >= 3000)
		delay_for_range = 0.9 SECONDS
		delay_for_rapid_range = 0.5 SECONDS
		delay_for_melee = 0 SECONDS
		delay_for_all = 0.2 SECONDS
		ranged_cooldown = 1
		acceptableTargetDistance = 15
		comfy_range = 12
		projectiletype = /obj/item/projectile/beam/weak/heavy_rifle_408
		rapid = FALSE
		armor = list(melee = 3, bullet = 3, energy = 3, bomb = 3, bio = 100, rad = 100)
		able_to_build = TRUE
		returning_fire = TRUE
		return

	if(data_count >= 2000)
		delay_for_range = 1.2 SECONDS
		delay_for_rapid_range = 0.65 SECONDS
		delay_for_melee = 0 SECONDS
		delay_for_all = 0.4 SECONDS
		ranged_cooldown = 3
		projectiletype = /obj/item/projectile/beam/weak/heavy_rifle_408
		rapid = FALSE
		armor = list(melee = 3, bullet = 3, energy = 3, bomb = 3, bio = 100, rad = 100)
		able_to_build = TRUE
		return

	if(data_count >= 2500)
		delay_for_range = 1.2 SECONDS
		delay_for_rapid_range = 0.65 SECONDS
		delay_for_melee = 0 SECONDS
		delay_for_all = 0.4 SECONDS
		ranged_cooldown = 3
		projectiletype = /obj/item/projectile/beam/weak/rifle_75
		rapid = TRUE
		armor = list(melee = 3, bullet = 3, energy = 3, bomb = 3, bio = 100, rad = 100)
		able_to_build = TRUE
		return

	if(data_count >= 2000)
		delay_for_range = 1.5 SECONDS
		delay_for_rapid_range = 0.75 SECONDS
		delay_for_melee = 0 SECONDS
		delay_for_all = 0.4 SECONDS
		ranged_cooldown = 4 //Yikes
		projectiletype = /obj/item/projectile/beam/weak/rifle_75
		rapid = TRUE
		armor = list(melee = 3, bullet = 3, energy = 3, bomb = 3, bio = 100, rad = 100)
		return

	if(data_count >= 1500)
		delay_for_range = 1.5 SECONDS
		delay_for_rapid_range = 0.75 SECONDS
		delay_for_melee = 0 SECONDS
		delay_for_all = 0.4 SECONDS
		ranged_cooldown = 4 //Yikes
		projectiletype = /obj/item/projectile/beam/weak/rifle_75
		rapid = FALSE
		armor = list(melee = -1, bullet = -1, energy = -1, bomb = -1, bio = 100, rad = 100) //Starting wise we are less then armorless
		return

	if(data_count >= 1000)
		projectiletype = /obj/item/projectile/beam/weak/light_rifle_257
		armor = list(melee = -1, bullet = -1, energy = -1, bomb = -1, bio = 100, rad = 100) //Starting wise we are less then armorless
		return

	if(data_count >= 500)
		projectiletype = /obj/item/projectile/beam/weak/magnum_40
		armor = list(melee = -10, bullet = -10, energy = -10, bomb = -10, bio = 100, rad = 100) //Starting wise we are less then armorless
		return

	if(data_count >= 100)
		projectiletype = /obj/item/projectile/beam/weak/pistol_35
		rapid = TRUE
		return

/mob/living/carbon/superior_animal/robot/greyson/true_boss_data_star/updatehealth()
	set_sight(sight|SEE_TURFS|SEE_MOBS|SEE_OBJS) //wall hacks
	health = maxHealth - getFireLoss() - getBruteLoss() - halloss //We cant have o2/clone/toxin damage affecet us at all
	activate_ai()
	process_med_hud(src,0)
	if (health <= death_threshold && stat != DEAD)
		if(kcorp_moduals > 0)
			to_chat(world, "<b><font color='#ffaa00'>Data Star Mortally Wounded, Data Collected.</font></b>")
			adjustBruteLoss(-1000)
			adjustFireLoss(-1000)
			data_count += 4000 //We REALLY disliked that
			kcorp_moduals -= 1
		else
			death()
	handled_mode()
	try_n_build()

/mob/living/carbon/superior_animal/robot/greyson/true_boss_data_star/adjustBruteLoss(amount)
	if(amount >= 1000)
		to_chat(world,"<b><font color='#ffaa00'>Anti-Cheat Shielding Successfully Deployed. Data Collected.</font></b>")
		built_up_rage += 1
		if(built_up_rage > 2)
			to_chat(world,"<b><font color='#ffaa00'>Lesser Being Orbital Beacon Shield Successfully Deployed. Data Collected.</font></b>")
			message_admins("<b><font color='#ffaa00'>Administration Being Data Collected.</font></b>")
		return

	..()
	data_count += (amount*0.5)

/mob/living/carbon/superior_animal/robot/greyson/true_boss_data_star/adjustFireLoss(amount)
	if(amount >= 1000)
		to_chat(world,"<b><font color='#ffaa00'>Anti-Cheat Shielding Successfully Deployed. Data Collected.</font></b>")
		built_up_rage += 1
		if(built_up_rage > 2)
			to_chat(world,"<b><font color='#ffaa00'>Lesser Being Orbital Beacon Shield Successfully Deployed. Data Collected.</font></b>")
			message_admins("<b><font color='#ffaa00'>Administration Being Data Collected.</font></b>")
		return

	..()
	data_count += (amount*0.5)

/mob/living/carbon/superior_animal/robot/greyson/true_boss_data_star/bullet_act(obj/item/projectile/proj)
	..()

	if(returning_fire)
		returning_fire = FALSE
		var/turf/proj_start_turf = proj.starting
		for(var/obj in proj_start_turf.contents)
			if(istype(obj, /obj/machinery/power/os_turret))
				return		// Don't shoot other turrets
		if(prob(data_count*0.01))
			projectiletype = /obj/item/projectile/tether
		if(prob(data_count*0.001))
			projectiletype = /obj/item/projectile/bullet/c10x24
		rapid = FALSE
		OpenFire(proj_start_turf)
		handled_mode()


/mob/living/carbon/superior_animal/robot/greyson/true_boss_data_star/emp_act(severity)
	data_count += rand(-100, 500)
	if(data_count >= 3000)
		to_chat(src,"<b><font color='#ffaa00'>Data Star EMP Shielding Deployed Successfully. Data Collected.</font></b>")
		return
	..()

/mob/living/carbon/superior_animal/robot/greyson/true_boss_data_star/ex_act(severity)
	data_count += rand(80, 100)
	if(data_count >= 1000)
		to_chat(src,"<b><font color='#ffaa00'>Data Star Bomb Shielding Deployed Successfully. Data Collected.</font></b>")
		return
	..()

/mob/living/carbon/superior_animal/robot/greyson/true_boss_data_star/proc/try_n_build()
	if(!able_to_build)
		return
	if(prob(1) && walls_to_make > 0)
		new /obj/effect/window_lwall_spawn/smartspawn/onestar(src.loc)
	if(prob(2))
		new /obj/structure/grille(src.loc)
	if(prob(3))
		new /obj/random/mob/roomba/any(src.loc) //This could be a clean bot or a phazon, RnG!
	if(turrets_can_build && turrets_to_make > 0)
		if(prob(0.01*data_count))
			turrets_to_make -= 1
			new /obj/random/turret/os(src.loc)

/mob/living/carbon/superior_animal/robot/greyson/true_boss_data_star/handle_stunned()
	if(data_count >= 1200 && stunned)
		SetParalysis(0)
		SetStunned(0)
		SetWeakened(0)
		SetDrowsyness(0)
		to_chat(src,"<b><font color='#ffaa00'>Data Star Anti-Mobility Countermeasures Deployed Successfully. Data Collected.</font></b>")
		return
	else
		data_count += 50 //We REALLY dislike being stunned
		..()

/mob/living/carbon/superior_animal/robot/greyson/true_boss_data_star/handle_weakened()
	if(data_count >= 1200 && weakened)
		SetParalysis(0)
		SetStunned(0)
		SetWeakened(0)
		SetDrowsyness(0)
		to_chat(src,"<b><font color='#ffaa00'>Data Star Anti-Mobility Countermeasures Deployed Successfully. Data Collected.</font></b>")
		return
	else
		data_count += 50 //We REALLY dislike being weakened
		..()

/mob/living/carbon/superior_animal/robot/greyson/true_boss_data_star/gib()
	return //Sorry cheater

//Crayon magic cant cheese this boss
/mob/living/carbon/superior_animal/robot/greyson/true_boss_data_star/dust(anim = icon_dust, remains = dust_remains)
	if(marked_for_death)
		allow_teleporters = TRUE
		qdel(src)

	if(health == maxHealth || health < 0 || !kcorp_moduals)
		marked_for_death = TRUE
		allow_teleporters = TRUE
		qdel(src)
	dieing += 1

/mob/living/carbon/superior_animal/robot/greyson/true_boss_data_star/death()
	if(stat == DEAD)
		return FALSE
	var/datum/effect/effect/system/spark_spread/s = new /datum/effect/effect/system/spark_spread
	s.set_up(3, 1, src)
	s.start()
	bluespace_entropy(1200, get_turf(src), TRUE) //Ye... It went far away
	if(dieing <= 1)
		allow_teleporters = TRUE
		dieing += 1
		dust(src)
		..()

//I do hope you knew what you were getting into by spawning this fine fellow
/mob/living/carbon/superior_animal/robot/greyson/true_boss_data_star/Destroy()
	if(kcorp_moduals == 0 || marked_for_death)
		..()
		return
	if(built_up_rage <= 1)
		to_chat(world, "<b><font color='#ffaa00'>Data Collected, Qdel counter measure deployed.</font></b>")
		built_up_rage += 3
	if(built_up_rage > 2)
		to_chat(world, "<b><font color='#ffaa00'>Qdel shield successful, Data Collected.</font></b>")

/mob/living/carbon/superior_animal/robot/greyson/true_boss_data_star/forceMove(atom/destination, var/special_event, glide_size_override=0)
	if(built_up_rage <= 1 && allow_teleporters)
		if(!marked_for_death)
			to_chat(world, "<b><font color='#ffaa00'>Data Collected, fabricating counter measure.</font></b>")
		built_up_rage += 1
		allow_teleporters = FALSE
		..()
	else
		to_chat(world, "<b><font color='#ffaa00'>Force Move shield successful, Data Collected.</font></b>")


/mob/living/carbon/superior_animal/robot/greyson/true_boss_data_star/attack_hand(mob/living/carbon/human/M as mob)
	switch(M.a_intent)
		if (I_GRAB)
			M.Weaken(3)
			visible_message(SPAN_WARNING("\red [src] breaks the grapple and melts [M] with a laser beam!"))
			to_chat(src,"<b><font color='#ffaa00'>Anti-Grapple Targeting Successful, Data Collected.</font></b>")
			M.adjustFireLoss(20)
			return 1
	..()

//Not a mob to be just lmao testing on live
/proc/level_fithteen_announcement()
	command_announcement.Announce("Unconfirmed outbreak of level 15 data-hazard within the [station_name()].", "Data hazard Alert")
	var/decl/security_state/security_state = decls_repository.get_decl(GLOB.maps_data.security_state)
	security_state.set_security_level(security_state.all_security_levels[4], TRUE)
