/obj/random/techpart
	name = "random techpart"
	icon_state = "tech-orange"

/obj/random/techpart/item_to_spawn()
	return pickweight(list(
				/obj/item/pc_part/card_slot = 9,
				/obj/item/pc_part/drive/small = 6,
				/obj/item/pc_part/drive/small/adv = 3,
				/obj/item/pc_part/drive = 4,
				/obj/item/pc_part/drive/advanced = 2,
				/obj/item/pc_part/network_card = 6,
				/obj/item/pc_part/network_card/wired = 2,
				/obj/item/pc_part/network_card/advanced = 3,
				/obj/item/pc_part/processor_unit = 6,
				/obj/item/pc_part/processor_unit/small = 6,
				/obj/item/pc_part/processor_unit/adv = 3,
				/obj/item/pc_part/processor_unit/adv/small = 4,
				/obj/item/pc_part/tesla_link = 9,
				/obj/item/device/assembly/igniter = 12,
				/obj/item/device/assembly/infra = 12,
				/obj/item/device/assembly/prox_sensor = 12,
				/obj/item/device/assembly/signaler = 12,
				/obj/item/device/assembly/timer = 12,
				/obj/item/device/assembly/voice = 9,
				/obj/item/stock_parts/console_screen = 15,
				/obj/item/stock_parts/capacitor = 10,
				/obj/item/stock_parts/capacitor/adv = 3,
				/obj/item/stock_parts/manipulator = 15,
				/obj/item/stock_parts/manipulator/nano = 5,
				/obj/item/stock_parts/matter_bin = 20,
				/obj/item/stock_parts/matter_bin/adv = 6,
				/obj/item/stock_parts/micro_laser = 15,
				/obj/item/stock_parts/micro_laser/high = 5,
				/obj/item/stock_parts/scanning_module = 15,
				/obj/item/stock_parts/scanning_module/adv = 5,
				/obj/item/stock_parts/subspace/amplifier = 3,
				/obj/item/stock_parts/subspace/analyzer = 3,
				/obj/item/stock_parts/subspace/ansible = 3,
				/obj/item/stock_parts/subspace/crystal = 3,
				/obj/item/stock_parts/subspace/filter = 3,
				/obj/item/stock_parts/subspace/transmitter = 3,
				/obj/item/stock_parts/subspace/treatment = 3,
				/obj/item/pc_part/drive/disk/design/misc = 3,
				/obj/item/pc_part/drive/disk/design/components = 3,
				/obj/item/pc_part/drive/disk/design/adv_tools = 2,
				/obj/item/pc_part/drive/disk/design/circuits = 2,
				/obj/item/pc_part/drive/disk/design/logistics = 1,
				/obj/item/pc_part/drive/disk/design/robustcells = 2,
				/obj/item/pc_part/drive/disk/design/medical = 2,
				/obj/item/pc_part/drive/disk/design/computer = 2,
				/obj/item/pc_part/drive/disk/design/guns/cheap_guns = 2,
				/obj/item/pc_part/drive/disk/design/nonlethal_ammo = 3,
				/obj/item/pc_part/drive/disk/design/lethal_ammo = 2))

/obj/random/techpart/low_chance
	name = "low chance random techpart"
	icon_state = "tech-orange-low"
	spawn_nothing_percentage = 60
