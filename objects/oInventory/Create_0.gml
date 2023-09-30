/// @description Insert description here
// You can write your code in this editor
#macro SLOT_SZ 16
#macro SLOT_GUTTER 0


#macro INV_SLOT_ROW 8
#macro INV_SLOT_COL 8
global.inventory = array_create(INV_SLOT_COL * INV_SLOT_ROW, noone);

global.inventory[0] = 1;
_inv_width = 12+INV_SLOT_COL*(SLOT_SZ + SLOT_GUTTER) - SLOT_GUTTER
_inv_height = 12+(INV_SLOT_ROW)*(SLOT_SZ + SLOT_GUTTER) - SLOT_GUTTER
_inv_x = SCREEN_W/2 - _inv_width/2 
_inv_y = SCREEN_H/2 - _inv_height/2

drag_item = noone;
drag_offset_x = 0;
drag_offset_y = 0;

function slot_coord_to_render_coord(_ix, _iy) {
	return [_inv_x + 6 + _iy * (SLOT_SZ + SLOT_GUTTER), _inv_y + 6 + _ix *(SLOT_SZ + SLOT_GUTTER)]
}