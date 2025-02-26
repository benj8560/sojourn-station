/mob/living/carbon/superior/roach/UnarmedAttack(var/atom/A, var/proximity)
	if(isliving(A))
		var/mob/living/L = A
		var/mob/living/carbon/human/H
		if(ishuman(L))
			H = L
		if(H)
			var/obj/item/reagent_containers/snacks/grown/howdoitameahorseinminecraft = H.get_active_hand()
			if(istype(howdoitameahorseinminecraft))
				if(try_tame(H, howdoitameahorseinminecraft))
					return FALSE //If they manage to tame the roach, stop the attack
		if(istype(L) && !L.weakened && prob(knockdown_odds))
			if(L.stats.getPerk(PERK_ASS_OF_CONCRETE) || L.stats.getPerk(PERK_BRAWN))
				return
			if(H && H.has_shield())
				L.visible_message(SPAN_DANGER("\the [src] tried to knocks down \the [L]! But [L] blocks \the [src] attack!"))
			else
				L.Weaken(3)
				L.visible_message(SPAN_DANGER("\the [src] knocks down \the [L]!"))

	. = ..()



