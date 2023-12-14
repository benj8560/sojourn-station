//Regular syndicate space suit
/obj/item/clothing/head/helmet/space/syndicate
	name = "red space helmet"
	icon_state = "syndicate"
	item_state = "syndicate"
	desc = "A crimson helmet sporting clean lines and durable plating. Engineered to look menacing."
	armor_list = list(
		melee = 30,
		bullet = 30,
		energy = 30,
		bomb = 25,
		bio = 100,
		rad = 25
	)
	siemens_coefficient = 0.6

/obj/item/clothing/suit/space/syndicate
	name = "red space suit"
	icon_state = "syndicate"
	item_state = "space_suit_syndicate"
	desc = "A crimson spacesuit sporting clean lines and durable plating. Robust, reliable, and slightly suspicious."
	w_class = ITEM_SIZE_NORMAL
	slowdown = 1
	armor_list = list(
		melee = 30,
		bullet = 30,
		energy = 30,
		bomb = 25,
		bio = 100,
		rad = 25
	)
	siemens_coefficient = 0.6
	stiffness = LIGHT_STIFFNESS

//Its a soft suit basicly but no slowdown
/obj/item/clothing/head/helmet/space/os
	name = "greyson positronic space helm"
	icon_state = "os_spacehelm"
	item_state = "os_spacehelm"
	desc = "A helmet produced by GP. It's outdated but sleek design makes it still viable to use even after all these years."
	w_class = ITEM_SIZE_SMALL
	flash_protection = FLASH_PROTECTION_MODERATE
	tint = TINT_NONE
	armor_list = list(
		melee = 30,
		bullet = 30,
		energy = 30,
		bomb = 25,
		bio = 100,
		rad = 100
	)
	siemens_coefficient = 0.6
