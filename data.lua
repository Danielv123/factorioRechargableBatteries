require("util")

-- globals like entity names etc
MODPATH = "__rechargableBatteries__"

CHARGER_NAME = "battery-charger"
CHARGER_ICON = "__rechargableBatteries__/graphics/render_024.png"
CHARGER_ICON_SIZE = 512
-- Use ugly prototype based approach instead
data:extend({
	{
		type = "recipe",
		name = CHARGER_NAME,
		--if the recipe was succesfully attached to the tech then the recipe
		--shouldn't be enabled to begin with.
		--but if the recipe isn't attached to a tech then it should
		--be enabled to begin with because otherwise the player can never use the item ingame
		enabled = true,
		ingredients =
		{
			{"steel-chest", 1},
			{"electronic-circuit", 50}
		},
		result = CHARGER_NAME,
		requester_paste_multiplier = 4
	},
	{
		type = "item",
		name = CHARGER_NAME,
		icon = CHARGER_ICON,
		icon_size = CHARGER_ICON_SIZE,
		flags = {"goes-to-quickbar"},
		subgroup = "storage",
		order = "a[items]-b["..CHARGER_NAME.."]",
		place_result = CHARGER_NAME,
		stack_size = 50
	},
	{
		type = "assembling-machine",
		name = CHARGER_NAME,
		icon = CHARGER_ICON,
		icon_size = CHARGER_ICON_SIZE,
		flags = {"placeable-neutral","placeable-player", "player-creation"},
		minable = {hardness = 0.2, mining_time = 0.5, result = CHARGER_NAME},
		max_health = 400,
		corpse = "big-remnants",
		dying_explosion = "medium-explosion",
		resistances =
		{
			{
				type = "fire",
				percent = 70
			}
		},
		open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.85 },
		close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 },
		vehicle_impact_sound =	{ filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
		working_sound =
		{
			sound = {
				{
					filename = "__base__/sound/assembling-machine-t3-1.ogg",
					volume = 0.8
				},
				{
					filename = "__base__/sound/assembling-machine-t3-2.ogg",
					volume = 0.8
				},
			},
			idle_sound = { filename = "__base__/sound/idle1.ogg", volume = 0.6 },
			apparent_volume = 1.5,
		},
		collision_box = {{-.7, -1.2}, {.7, 1.2}},
		selection_box = {{-1.5, -1.5}, {0.5, 1.5}},
		fast_replaceable_group = "assembling-machine",
		animation =
		{
			layers =
			{
				{
					filename = MODPATH.."/graphics/LR_battery_charger.png",
					priority = "high",
					width = 256,
					height = 256,
					frame_count = 50,
					line_length = 8,
					shift = {0, 0},
					scale = 0.4,
					hr_version = {
						filename = MODPATH.."/graphics/HR_battery_charger",
						priority = "high",
						width = 512,
						height = 512,
						frame_count = 50,
						line_length = 8,
						shift = {0, 0},
						scale = 0.2
					}
				},
			},
		},

		crafting_categories = {"crafting", "advanced-crafting", "crafting-with-fluid"},
		crafting_speed = 1,
		energy_source =
		{
			type = "electric",
			usage_priority = "secondary-input",
			emissions = 0.03 / 3.5
		},
		energy_usage = "1000kW",
		ingredient_count = 1,
		module_specification =
		{
			module_slots = 4
		},
		allowed_effects = {"consumption", "speed", "productivity", "pollution"}
	},
})
