/obj/structure/closet/secure_closet/reinforced/commander
	name = "blackshield commander's locker"
	req_access = list(access_hos)
	icon_state = "mc"

/obj/structure/closet/secure_closet/reinforced/commander/populate_contents()
	if(populated_contents)
		return
	populated_contents = TRUE
	new /obj/item/gunbox/commanding_officer(src) // Secondary on their personal hardcase, primary on the locker.
	new /obj/item/tool/fireaxe/militia_tomahawk(src)
	new /obj/item/tool/disciplinary_action(src)
	new /obj/item/clothing/head/helmet/ballistic/militia/full/co(src)
	new /obj/item/clothing/head/rank/milcom(src)
	new /obj/item/clothing/mask/gas/blackshield_gasmask(src)
	new /obj/item/clothing/gloves/stungloves(src)
	new /obj/item/clothing/suit/armor/flakvest/commander(src)
	new /obj/item/clothing/suit/armor/commander/militia(src)
	new /obj/item/clothing/accessory/halfcape(src)
	new /obj/item/clothing/under/rank/commander(src)
	new /obj/item/storage/belt/webbing(src)
	new /obj/item/storage/belt/security(src)
	new /obj/item/storage/firstaid/ifak(src)
	new /obj/item/storage/box/trackimp(src)
	new /obj/item/storage/pouch/baton_holster/telebaton(src)
	new /obj/item/storage/pouch/pistol_holster(src)
	new /obj/item/storage/box/commanderuniform(src)
	new /obj/item/roach_summon/panzer(src)
	new /obj/item/clothing/gloves/thick/swat/blackshield(src)
	new /obj/item/storage/sheath/judgement/exultor/filled(src)
	new /obj/item/device/radio/headset/heads/bscom/bowman(src)
	new /obj/item/storage/backpack/satchel/militia(src)
	new /obj/item/storage/backpack/militia(src)
	if(prob(5))
		new /obj/random/rations/crayon(src)


/obj/structure/closet/secure_closet/armorer
	name = "sergeant's locker"
	req_access = list(access_armory)
	icon_state = "armorer"

/obj/structure/closet/secure_closet/armorer/populate_contents()
	if(populated_contents)
		return
	populated_contents = TRUE
	new /obj/item/voucher/blackshield/sargprimary(src)
	new /obj/item/voucher/blackshield/secondary(src)
	new /obj/item/voucher/blackshield/armor(src)
	new /obj/item/tool/fireaxe/militia_tomahawk(src)
	new /obj/item/clothing/accessory/holster/saber/militiasergeant/occupied(src)
	new /obj/item/clothing/mask/gas/blackshield_gasmask(src)
	new /obj/item/clothing/gloves/thick/swat/blackshield(src)
	new /obj/item/device/radio/headset/headset_blackshield/sergeant(src)
	new /obj/item/clothing/head/helmet/ballistic/militia/sergeant(src)
	new /obj/item/clothing/head/rank/armorer/beret(src)
	new /obj/item/clothing/head/rank/armorer/cap(src)
	new /obj/item/clothing/accessory/cape/sergeant_cape(src)
	new /obj/item/clothing/under/rank/armorer/gorka(src)
	new /obj/item/storage/belt/webbing(src)
	new /obj/item/storage/belt/security(src)
	new /obj/item/storage/backpack/satchel/militia(src)
	new /obj/item/storage/backpack/militia(src)
	new /obj/item/storage/pouch/ammo(src)
	new /obj/item/storage/firstaid/ifak(src)
	new /obj/item/melee/telebaton(src)
	new /obj/item/storage/pouch/baton_holster(src)
	new /obj/item/storage/box/sergeantuniform(src)
	new /obj/item/device/radio/headset/headset_blackshield/bowman/sergeant(src)
	if(prob(80))
		new /obj/item/gun_upgrade/muzzle/silencer(src)
	if(prob(5))
		new /obj/random/rations/crayon(src)
	if(prob(35))
		new /obj/item/storage/backpack/military(src)

/obj/structure/closet/secure_closet/personal/corpsman
	name = "blackshield medical corpsman locker"
	req_access = list(access_hos)
	access_occupy = list(access_brig) //So we can claim
	icon_state = "corpsman"

/obj/structure/closet/secure_closet/personal/corpsman/populate_contents()
	if(populated_contents)
		return
	populated_contents = TRUE
	new /obj/item/voucher/blackshield/corpsprimary(src)
	new /obj/item/voucher/blackshield/secondary(src)
	new /obj/item/voucher/blackshield/armorcorpsman(src)
	new /obj/item/device/scanner/health(src)
	new /obj/item/roller(src)
	new /obj/item/device/radio/headset/headset_blackshield/corps(src)
	new /obj/item/tool/knife/boot/blackshield(src)
	new /obj/item/tool/fireaxe/militia_tomahawk(src)
	new /obj/item/clothing/glasses/ballistic/med(src)
	new /obj/item/clothing/mask/gas/blackshield_gasmask(src)
	new /obj/item/clothing/head/rank/corpsman/beret(src)
	new /obj/item/clothing/head/rank/corpsman/cap(src)
	new /obj/item/clothing/under/rank/corpsman(src)
	new /obj/item/storage/belt/webbing(src)
	new /obj/item/storage/belt/security(src)
	new /obj/item/storage/backpack/duffelbag(src)
	new /obj/item/storage/backpack/satchel/militia(src)
	new /obj/item/storage/backpack/corpsman(src)
	new /obj/item/storage/firstaid/ifak(src)
	new /obj/item/storage/firstaid/regular(src)
	new /obj/item/storage/firstaid/combat(src)
	new /obj/item/melee/telebaton(src)
	new /obj/item/storage/pouch/baton_holster(src)
	new /obj/item/storage/box/trooperuniform(src)
	new /obj/item/storage/hcases/ammo/serb(src)
	new /obj/item/clothing/accessory/halfcape/corpsman(src)
	new /obj/item/device/radio/headset/headset_blackshield/bowman/corps(src)
	if(prob(50))
		new /obj/item/storage/firstaid/blackshield/large(src)
	if(prob(50))
		new /obj/item/gun_upgrade/muzzle/silencer(src)
	if(prob(5))
		new /obj/random/rations/crayon(src)
	if(prob(35))
		new /obj/item/storage/backpack/military(src)


/obj/structure/closet/secure_closet/personal/trooper
	name = "blackshield trooper's locker"
	req_access = list(access_hos)
	access_occupy = list(access_brig)
	icon_state = "trooper"

/obj/structure/closet/secure_closet/personal/trooper/populate_contents()
	if(populated_contents)
		return
	populated_contents = TRUE
	new /obj/item/voucher/blackshield/primary(src)
	new /obj/item/voucher/blackshield/secondary(src)
	new /obj/item/voucher/blackshield/armor(src)
	new /obj/item/tool/knife/boot/blackshield(src)
	new /obj/item/tool/fireaxe/militia_tomahawk(src)
	new /obj/item/clothing/glasses/ballistic(src)
	new /obj/item/clothing/mask/gas/blackshield_gasmask(src)
	new /obj/item/clothing/mask/balaclava/tactical(src)
	new /obj/item/clothing/gloves/thick/swat/blackshield(src)
	new /obj/item/device/radio/headset/headset_blackshield(src)
	new /obj/item/clothing/head/rank/trooper/beret(src)
	new /obj/item/clothing/head/rank/trooper/cap(src)
	new /obj/item/clothing/accessory/halfcape/trooper_cape(src)
	new /obj/item/clothing/under/rank/trooper/gorka(src)
	new /obj/item/storage/belt/webbing(src)
	new /obj/item/storage/belt/security(src)
	new /obj/item/storage/backpack/satchel/militia(src)
	new /obj/item/storage/backpack/militia(src)
	new /obj/item/storage/firstaid/ifak(src)
	new /obj/item/melee/telebaton(src)
	new /obj/item/storage/pouch/baton_holster(src)
	new /obj/item/storage/box/trooperuniform(src)
	new /obj/item/storage/hcases/ammo/serb(src)
	new /obj/item/device/radio/headset/headset_blackshield/bowman(src)
	if(prob(50))
		new /obj/item/gun_upgrade/muzzle/silencer(src)
	if(prob(5))
		new /obj/random/rations/crayon(src)
	if(prob(35))
		new /obj/item/storage/backpack/military(src)


/obj/structure/closet/secure_closet/militia/armor
	name = "blackshield armor locker"
	req_access = list(access_brig)
	icon_state = "trooper"

/obj/structure/closet/secure_closet/militia/armor/populate_contents()
	if(populated_contents)
		return
	populated_contents = TRUE
	new /obj/item/clothing/head/helmet/ballistic/militia(src)
	new /obj/item/clothing/head/helmet/ballistic/militia(src)
	new /obj/item/clothing/head/helmet/ballistic/militia/full(src)
	new /obj/item/clothing/head/helmet/ballistic/militia/full(src)
	new /obj/item/clothing/head/helmet/ballistic/militia/full(src)
	new /obj/item/clothing/suit/armor/platecarrier/militia(src)
	new /obj/item/clothing/suit/armor/platecarrier/militia(src)
	new /obj/item/clothing/suit/armor/platecarrier/corpsman(src)
	new /obj/item/clothing/suit/storage/armor/militia_overcoat (src)
	new /obj/item/clothing/suit/storage/armor/militia_overcoat (src)
