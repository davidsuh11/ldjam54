/// @description Insert description here
// You can write your code in this editor

draw_rectangle_colour(0, 0, SCREEN_W, SCREEN_H, #E35023,  #E35023,  #C39023,  #C39023, 0)

for (var _tx = 0; _tx < MAP_W; ++_tx) {
	for (var _ty = 0; _ty < MAP_H; ++_ty) {
		var _tiledata = global.map[# _tx, _ty]
		var _sx = tileToIsometricX(_tx, _ty)
		var _sy = tileToIsometricY(_tx, _ty)
		
		var _tile_index = _tiledata[TILE.SPRITE]
		var _tile_z = _tiledata[TILE.Z]
		if (_tile_index != 0) draw_sprite(spr_tile1, 0, _sx, _sy + _tile_z)
	}
}

