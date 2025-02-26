/mob/living/captive_brain
	name = "host brain"
	real_name = "host brain"
	universal_understand = 1
	stat = 0

/mob/living/captive_brain/say(var/message)
	message = sanitize(message)

	if (src.client)
		if(client.prefs.muted & MUTE_IC)
			to_chat(src, "\red You cannot speak in IC (muted).")
			return
		if (src.client.handle_spam_prevention(message,MUTE_IC))
			return

	if(istype(src.loc,/mob/living/simple/borer))
		if (!message)
			return
		log_say("[key_name(src)] : [message]")
		var/last_symbol = copytext(message, length(message))
		if (stat == 2)
			return say_dead(message)
		else if(last_symbol=="@")
			if(!src.stats.getPerk(PERK_CODESPEAK))
				to_chat(src, "You don't know the codes, pal.")
				return

		var/mob/living/simple/borer/B = src.loc
		to_chat(src, "You whisper silently, \"[message]\"")
		to_chat(B.host, "The captive mind of [src] whispers, \"[message]\"")

		for (var/mob/M in GLOB.player_list)
			if (isnewplayer(M))
				continue
			else if(M.stat == DEAD && M.get_preference_value(/datum/client_preference/ghost_ears) == GLOB.PREF_ALL_SPEECH)
				to_chat(M, "The captive mind of [src] whispers, \"[message]\"")


	var/obj/item/implant/carrion_spider/control/controler = src.loc
	if(istype(controler))
		if (!message)
			return
		log_say("[key_name(src)] : [message]")
		var/last_symbol = copytext(message, length(message))
		if (stat == 2)
			return say_dead(message)
		else if(last_symbol=="@")
			if(!src.stats.getPerk(PERK_CODESPEAK))
				to_chat(src, "You don't know the codes, pal.")
				return

		to_chat(src, "You whisper silently, \"[message]\"")
		to_chat(controler.wearer, "The captive mind of [src] whispers, \"[message]\"")

		for (var/mob/M in GLOB.player_list)
			if (isnewplayer(M))
				continue
			else if(M.stat == DEAD && M.get_preference_value(/datum/client_preference/ghost_ears) == GLOB.PREF_ALL_SPEECH)
				to_chat(M, "The captive mind of [src] whispers, \"[message]\"")


/mob/living/captive_brain/emote(var/message)
	return

/mob/living/captive_brain/process_resist()
	//Resisting control by an alien mind.
	if(istype(src.loc,/mob/living/simple/borer))
		var/mob/living/simple/borer/B = src.loc
		var/mob/living/captive_brain/H = src

		to_chat(H, SPAN_DANGER("You begin doggedly resisting the parasite's control (this will take approximately sixty seconds)."))
		to_chat(B.host, SPAN_DANGER("You feel the captive mind of [src] begin to resist your control."))

		spawn(rand(200,250)+B.host.brainloss)
			if(!B || !B.controlling) return

			B.host.adjustBrainLoss(rand(0.1,0.5))
			to_chat(H, SPAN_DANGER("With an immense exertion of will, you regain control of your body!"))
			to_chat(B.host, SPAN_DANGER("You feel control of the host brain ripped from your grasp, and retract your probosci before the wild neural impulses can damage you."))
			B.detatch()
			add_verb(src, /mob/living/carbon/human/proc/commune)
			add_verb(src, /mob/living/carbon/human/proc/psychic_whisper)
			add_verb(src, /mob/living/carbon/proc/spawn_larvae)

		return

	else
		to_chat(src, SPAN_DANGER("You cannot escape."))

	..()
