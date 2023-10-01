
var mouse_over = noone;
var mouse_over_x = noone;
var mouse_over_y = noone;

for (var _ix = 0; _ix < INV_SLOT_ROW; ++_ix) {
	for (var _iy = 0; _iy < INV_SLOT_COL; ++_iy) {
		var _coord = slot_coord_to_render_coord(_ix, _iy)
		if (mouse_over == noone && point_in_rectangle(mouse_x, mouse_y, _coord[0], _coord[1], _coord[0] + 16, _coord[1] + 16)) {
			mouse_over = _ix * INV_SLOT_COL + _iy;
			mouse_over_x = mouse_x - _coord[0];
			mouse_over_y = mouse_y - _coord[1];
		}
	}
}

if (mouse_check_button(mb_left)) {
	if (mouse_over != noone && drag_item == noone && global.inventory[mouse_over] != noone) {
		drag_item = mouse_over;
		drag_offset_x =- mouse_over_x;
		drag_offset_y =- mouse_over_y;
	}	
} else {
	if (drag_item != noone ) {
		if (mouse_over != noone && global.inventory[mouse_over] == noone)  {
			global.inventory[mouse_over] = global.inventory[drag_item];
			global.inventory[drag_item] = noone;
			update_inventory_components();
		}
		drag_item = noone;
	}
}

// BFS to check connectivity
