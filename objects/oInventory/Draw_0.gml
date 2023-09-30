
draw_sprite_stretched(
	spr_inventory,
	0,
	_inv_x,
	_inv_y,
	_inv_width,
	_inv_height	
)

function draw_item(_item, _x, _y) {
	var _item_data = global.ITEMS[_item]
	var _item_spr = _item_data.spr
	draw_sprite_stretched(spr_frame, 0, _x, _y, _item_data.size[0] * 16, _item_data.size[1] * 16)
	draw_sprite(spr_wire_gate, _item_data.wiregate_dir, _x+ _item_data.wiregate_location[0] * 16, _y+ _item_data.wiregate_location[1] * 16)
	draw_sprite(_item_spr, 0,
	_x + (_item_data.size[0] * 16 - sprite_get_width(_item_spr)) div 2,
	_y + (_item_data.size[1] * 16 - sprite_get_height(_item_spr)) div 2);
}


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
			draw_item(global.inventory[_ix*INV_SLOT_COL + _iy], _coord[0], _coord[1])
		}
	}
}

if (drag_item != noone) {
	draw_item(global.inventory[drag_item], mouse_x + drag_offset_x, mouse_y + drag_offset_y)
}