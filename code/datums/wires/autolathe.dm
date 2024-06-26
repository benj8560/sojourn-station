/datum/wires/autolathe

	holder_type = /obj/machinery/autolathe
	wire_count = 6
	descriptions = list(
		new /datum/wire_description(AUTOLATHE_HACK_WIRE, "Safety"),
		new /datum/wire_description(AUTOLATHE_SHOCK_WIRE, "Shock"),
		new /datum/wire_description(AUTOLATHE_DISABLE_WIRE, "Power")
	)

var/const/AUTOLATHE_HACK_WIRE = 1
var/const/AUTOLATHE_SHOCK_WIRE = 2
var/const/AUTOLATHE_DISABLE_WIRE = 4

/datum/wires/autolathe/get_status(mob/living/user)
	var/obj/machinery/autolathe/A = holder
	. = ..()
	. += "The red light is [A.disabled ? "off" : "on"]."
	. += "The green light is [A.shocked ? "off" : "on"]."
	. += "The blue light is [A.hacked ? "off" : "on"]."

/datum/wires/autolathe/CanUse()
	var/obj/machinery/autolathe/A = holder
	return A.panel_open

/datum/wires/autolathe/UpdateCut(index, mended)
	var/obj/machinery/autolathe/A = holder
	switch(index)
		if(AUTOLATHE_HACK_WIRE)
			A.hacked = !mended
			A.queue_max += A.hacked ? 8 : -8 //Modular
		if(AUTOLATHE_SHOCK_WIRE)
			A.shocked = !mended
		if(AUTOLATHE_DISABLE_WIRE)
			A.disabled = !mended

/datum/wires/autolathe/UpdatePulsed(index)
	if(IsIndexCut(index))
		return
	var/obj/machinery/autolathe/A = holder
	switch(index)
		if(AUTOLATHE_HACK_WIRE)
			A.hacked = !A.hacked
			A.queue_max += 8
			spawn(50)
				if(A && !IsIndexCut(index))
					A.hacked = 0
					A.queue_max -= 8
					Interact(usr)
		if(AUTOLATHE_SHOCK_WIRE)
			A.shocked = !A.shocked
			spawn(50)
				if(A && !IsIndexCut(index))
					A.shocked = 0
					Interact(usr)
		if(AUTOLATHE_DISABLE_WIRE)
			A.disabled = !A.disabled
			spawn(50)
				if(A && !IsIndexCut(index))
					A.disabled = 0
					Interact(usr)
