
/mob/living/carbon/superior/roach/Move()
	. = ..()
	if(buckled_mob)
		buckled_mob.dir = dir
		buckled_mob.forceMove(get_turf(src))
		buckled_mob.pixel_x = pixel_x

/mob/living/carbon/superior/roach/proc/try_tame(var/mob/living/carbon/user, var/obj/item/reagent_containers/snacks/grown/thefood)
	if(!istype(thefood))
		return FALSE
	if(prob(40)) // Flat 40% chance to fail
		visible_message("[src] hesitates for a moment...and then charges at [user]!")
		return TRUE //Setting this to true because the only current usage is attack, and it says it hesitates. // TL;DR It will stop the current attack that called this proc, but not the others.
	//fruits and veggies are not there own type, they are all the grown type and contain certain reagents. This is why it didnt work before
	if(isnull(thefood.seed.chems["potato"])) // You need a potato. Roaches love potatoes.
		return FALSE
	visible_message("[src] scuttles towards [user], examining the [thefood] they have in their hand.")
	can_buckle = TRUE
	if(do_after(src, taming_window, src)) //Here's your window to climb onto it.
		if(!buckled_mob || user != buckled_mob) //They need to be riding us
			can_buckle = FALSE
			visible_message("[src] snaps out of its trance and rushes at [user]!")
			return FALSE
		visible_message("[src] bucks around wildly, trying to shake  [user] off!") //YEEEHAW

		var/know_bug = FALSE // Do we know bug language?
		for(var/datum/language/L in user.languages) // Check every language for the roach language
			if(L.name == LANGUAGE_CHTMANT)
				know_bug = TRUE // We speak roach!

		if(know_bug) // If we speak roach, it is easier to make a fren.
			if(prob(10))
				visible_message("[src] thrashes around, and throws [user] clean off, despite their efforts to communicate with [src]!")
				user.throw_at(get_edge_target_turf(src,pick(alldirs)),rand(1,3),30)
				unbuckle_mob()
				can_buckle = FALSE
				return FALSE
		else if(prob(40)) // We are not roach fren, it is harder to tame
			visible_message("[src] thrashes around, and throws [user] clean off!")
			user.throw_at(get_edge_target_turf(src,pick(alldirs)),rand(1,3),30)
			unbuckle_mob()
			can_buckle = FALSE
			return FALSE

		friends += user
		colony_friend = TRUE
		friendly_to_colony = TRUE
		buckle_movable = TRUE //RIDE EM LIKE THE WIND LASSY!
		visible_message("[src] reluctantly stops thrashing around...")
		return TRUE
	visible_message("[src] snaps out of its trance and rushes at [user]!")
	return FALSE
