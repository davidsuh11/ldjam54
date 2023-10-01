/// @description Insert description here
// You can write your code in this editor


display_set_gui_maximize(2, 2)

draw_sprite_stretched(
	spr_inventory,
	0,
	16,
	16,
	192,
	24,
)

draw_sprite_stretched(
	spr_health,
	0,
	20,
	20,
	184 * (hp / 100),
	16,
)