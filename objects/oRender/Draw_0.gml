/// @description Insert description here
// You can write your code in this editor

camera_set_view_pos(view_camera[0], global.camx - SCREEN_W div 2, global.camy - SCREEN_H div 2)

draw_rectangle_colour(
	global.camx - SCREEN_W div 2 - 5,
	global.camy - SCREEN_H div 2 - 5,
	global.camx + SCREEN_W div 2 + 5,
	global.camy + SCREEN_H div 2 + 5,
	#E34023,  #E34323,  #C37023,  #C37023, 0)

for (var _tx = 0; _tx < MAP_W; ++_tx) {
	for (var _ty = 0; _ty < MAP_H; ++_ty) {
		var _tiledata = global.map[# _tx, _ty]
		var _sx = tileToIsometricX(_tx, _ty)
		var _sy = tileToIsometricY(_tx, _ty)
		
		var _tile_index = _tiledata[TILE.SPRITE]
		var _tile_z = _tiledata[TILE.Z]
		if (_tile_index != 0) draw_sprite(spr_tile1, _tile_index - 1, _sx, _sy + _tile_z)
	}
}

