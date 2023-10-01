

display_set_gui_maximise(2, 2);



var mouse_xx = (mouse_x - global.camx + SCREEN_W div 2)
var mouse_yy = (mouse_y - global.camy + SCREEN_H div 2)
function draw_item(_item, _x, _y, _ix, _iy) {
	var _item_data = _item
	var _item_spr = _item_data.spr
	draw_sprite_stretched(spr_frame, 0, _x, _y, _item_data.size[0] * 16, _item_data.size[1] * 16)
	if (_item_data.wiregate_dir != -1) draw_sprite(spr_wire_gate, _item_data.wiregate_dir, _x+ _item_data.wiregate_location[0] * 16, _y+ _item_data.wiregate_location[1] * 16)

	if (_item_data.item_type != "wired") draw_sprite(_item_spr, 0,
	_x + (_item_data.size[0] * 16 - sprite_get_width(_item_spr)) div 2,
	_y + (_item_data.size[1] * 16 - sprite_get_height(_item_spr)) div 2);
	else {
	// rendering wires
	// measure the surrounding blocks
		var _to_check = []
		if (_ix) array_push(_to_check, [_ix-1, _iy, DIRS.UP]);
		if (_iy) array_push(_to_check, [_ix, _iy-1, DIRS.LEFT]);
		if (_ix < INV_SLOT_COL-1)  array_push(_to_check, [_ix+1, _iy, DIRS.DOWN]);
		if (_iy < INV_SLOT_ROW-1)  array_push(_to_check, [_ix, _iy+1, DIRS.RIGHT]);

		var _wire_flags = 0;
		for (var _i=0; _i<array_length(_to_check); ++_i) {
			var _chk_coords = _to_check[_i];
			var _chk_item = get_inventory_item_at_slot_coord(_chk_coords[0], _chk_coords[1]);
			var _chk_gate = check_for_wiregate(_chk_coords[0], _chk_coords[1], _chk_coords[2]);
			if ((_chk_item != noone && _chk_item.name == _item.name) || _chk_gate[0]) {
				_wire_flags = _wire_flags | (1 << _chk_coords[2]);
			}
		}

		draw_sprite(_item_spr, global.WIRE_SPRITE_MAPPING[? _wire_flags], 
		_x + (_item_data.size[0] * 16 - sprite_get_width(_item_spr)) div 2,
		_y + (_item_data.size[1] * 16 - sprite_get_height(_item_spr)) div 2);
	}
}

if (show_inventory) {
	draw_sprite_stretched(
		spr_inventory,
		0,
		_inv_x,
		_inv_y,
		_inv_width,
		_inv_height	
	)

	for (var _ix = 0; _ix < INV_SLOT_ROW; ++_ix) {
		for (var _iy = 0; _iy < INV_SLOT_COL; ++_iy) {
			var _coord = slot_coord_to_render_coord(_ix, _iy)
		
			draw_sprite(spr_slot, 0, _coord[0], _coord[1])
		}
	}

	for (var _ix = 0; _ix < INV_SLOT_ROW; ++_ix) {
		for (var _iy = 0; _iy < INV_SLOT_COL; ++_iy) {
			if (global.inventory[_ix*INV_SLOT_COL + _iy] != noone && drag_item != _ix*INV_SLOT_COL + _iy) {
				var _coord = slot_coord_to_render_coord(_ix, _iy)
				draw_item(global.inventory[_ix*INV_SLOT_COL + _iy], _coord[0], _coord[1], _ix, _iy)
			}
		}
	}
	
	if (drag_item != noone) {
		draw_item(global.inventory[drag_item], mouse_xx + drag_offset_x, mouse_yy + drag_offset_y)
	}
}

