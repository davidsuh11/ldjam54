/// @description Insert description here
// You can write your code in this editor
#macro SLOT_SZ 16
#macro SLOT_GUTTER 0


#macro INV_SLOT_ROW 8
#macro INV_SLOT_COL 8
global.inventory = array_create(INV_SLOT_COL * INV_SLOT_ROW, noone);

global.inventory[0] = new item_Wire();
global.inventory[1] = new item_Wire();
global.inventory[2] = new item_Wire();
global.inventory[3] = new item_Wire();
global.inventory[4] = new item_Wire();

global.inventory[5] = new item_Grenade();

_inv_width = 12+INV_SLOT_COL*(SLOT_SZ + SLOT_GUTTER) - SLOT_GUTTER
_inv_height = 12+(INV_SLOT_ROW)*(SLOT_SZ + SLOT_GUTTER) - SLOT_GUTTER
_inv_x = SCREEN_W/2 - _inv_width/2 
_inv_y = SCREEN_H/2 - _inv_height/2

drag_item = noone;
drag_offset_x = 0;
drag_offset_y = 0;

components = []
active_components = []
vis = array_create(INV_SLOT_COL * INV_SLOT_ROW, false);

function slot_coord_to_render_coord(_ix, _iy) {
	return [_inv_x + 6 + _iy * (SLOT_SZ + SLOT_GUTTER), _inv_y + 6 + _ix *(SLOT_SZ + SLOT_GUTTER)]
}

function get_inventory_item_at_slot_coord(_ix, _iy) {
	return global.inventory[_ix * INV_SLOT_COL + _iy];
}

function slot2inventory_coord(_ix, _iy) {
	return _ix * INV_SLOT_COL + _iy
}

function inventory2slot_coord(_i) {
	return [_i div INV_SLOT_COL, _i % INV_SLOT_COL];
}

function update_inventory_components() {
	vis = array_create(INV_SLOT_COL * INV_SLOT_ROW, false);
	components = []

	function _bfs(_st) {
		var _curr_component = [];
		var _q = ds_queue_create();
		ds_queue_enqueue(_q, _st)
		while (!ds_queue_empty(_q)) {
			var _curr = ds_queue_dequeue(_q)
			var _curr_item =  get_inventory_item_at_slot_coord(_curr[0], _curr[1]);


			var _chk_wiregate = check_for_wiregate(_curr[0], _curr[1], -1); 
			if (_chk_wiregate[0]) {
				// is a wiregate, add parent item to component
				array_push(_curr_component, _chk_wiregate[1]);
				var _par_item = _chk_wiregate[1];
				
				// set all related tiles to visited
				var _item_x = _curr[0] - _par_item.wiregate_location[0];
				var _item_y = _curr[1] - _par_item.wiregate_location[1]; 
				
				for (var _tx = 0; _tx < _par_item.size[0]; ++_tx) for (var _ty = 0; _ty < _par_item.size[1]; ++_ty) {
					vis[slot2inventory_coord(_item_x + _tx, _item_y + _ty)] = true;
				}
			}
			if (_curr_item == noone) continue;
			if (_curr_item!= noone) array_push(_curr_component, _curr_item);

			var _nb = [];
			if (_curr[0]) array_push(_nb, [_curr[0]-1, _curr[1]]);
			if (_curr[1]) array_push(_nb, [_curr[0], _curr[1]-1]);
			if (_curr[0] < INV_SLOT_COL - 1) array_push(_nb, [_curr[0]+1, _curr[1]]);
			if (_curr[1] < INV_SLOT_ROW - 1) array_push(_nb, [_curr[0], _curr[1]+1]);
		
			for (var _i = 0; _i < array_length(_nb); ++_i) {
				var _chk = _nb[_i];
				var _chk_item = get_inventory_item_at_slot_coord(_chk[0], _chk[1]);
				if (!vis[_chk[0] * INV_SLOT_COL + _chk[1]]) {
					vis[@ _chk[0] * INV_SLOT_COL + _chk[1]] = true;
					ds_queue_enqueue(_q, _chk);
				};
			}
		}

		if(array_length(_curr_component) > 0) array_push(components, _curr_component);
	}

	for (var _ix = 0; _ix < INV_SLOT_COL; ++_ix) {
		for (var _iy = 0; _iy < INV_SLOT_ROW; ++_iy) {
			if (!vis[_ix * INV_SLOT_ROW  + _iy]) {
				vis[_ix * INV_SLOT_ROW  + _iy] = true;
				_bfs([_ix, _iy]);
			}
		}
	}

	show_debug_message(components);
	show_debug_message(array_length(components));
}

function check_for_wiregate(_ix, _iy, _incoming_dir) {
	for (var _tx = 0; _tx < INV_SLOT_ROW * INV_SLOT_COL; ++_tx) {
		var _item = global.inventory[_tx]
		if (_item == noone || _item.wiregate_dir == -1) continue;
		var _coords = inventory2slot_coord(_tx);
		_coords[0] += _item.wiregate_location[0];
		_coords[1] += _item.wiregate_location[1];
		if (_coords[0] == _ix && _coords[1] == _iy && (_item.wiregate_dir == ((_incoming_dir+2)%4) || _incoming_dir == -1)) return [true, _item]
	}
	
	return [false, noone];
}
