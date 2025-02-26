/obj/random/lathe_disk/advanced/excelsior
	name = "random any excelsior lathe disk"
	icon_state = "tech-green"

/obj/random/lathe_disk/advanced/excelsior/item_to_spawn()
	return pickweight(list(/obj/item/pc_part/drive/disk/design/excelsior = 1,
						/obj/item/pc_part/drive/disk/design/excelsior_weapons = 1,
						/obj/item/pc_part/drive/disk/design/ex_parts = 1,
						/obj/item/pc_part/drive/disk/design/ex_cells = 1,
						/obj/item/pc_part/drive/disk/design/guns/ex_drozd = 1,
						/obj/item/pc_part/drive/disk/design/guns/ex_makarov = 1,
						/obj/item/pc_part/drive/disk/design/guns/ex_vintorez = 1,
						/obj/item/pc_part/drive/disk/design/guns/ex_boltgun = 1,
						/obj/item/pc_part/drive/disk/design/guns/ex_ak = 1,
						/obj/item/pc_part/drive/disk/design/guns/ex_ppsh = 1,
						/obj/item/pc_part/drive/disk/design/guns/ex_reclaimer = 1
						))


/obj/random/lathe_disk/advanced/excelsior/safe
	name = "random excelsior safe lathe disk"
	icon_state = "tech-green"

/obj/random/lathe_disk/advanced/excelsior/safe/item_to_spawn()
	return pickweight(list(
						/obj/item/pc_part/drive/disk/design/ex_parts = 1,
						/obj/item/pc_part/drive/disk/design/ex_cells = 1,
						/obj/item/pc_part/drive/disk/design/guns/ex_drozd = 1,
						/obj/item/pc_part/drive/disk/design/guns/ex_makarov = 1,
						/obj/item/pc_part/drive/disk/design/guns/ex_vintorez = 1,
						/obj/item/pc_part/drive/disk/design/guns/ex_boltgun = 1,
						/obj/item/pc_part/drive/disk/design/guns/ex_ak = 1,
						/obj/item/pc_part/drive/disk/design/guns/ex_ppsh = 1,
						/obj/item/pc_part/drive/disk/design/guns/ex_reclaimer = 1
						))