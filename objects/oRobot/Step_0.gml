/// @description Define movements
if keyboard_check(vk_down) move_down();
if keyboard_check(vk_up) move_up();
if keyboard_check(vk_left) move_left();
if keyboard_check(vk_right) move_right();

global.camx += int64((x - global.camx) * 0.05)
global.camy += int64((y - global.camy) * 0.05)

#macro ROBOT_WIDTH 8
#macro ROBOT_HEIGHT 4

function ok(_x, _y) {
	return ( 
	     _ok(+ ROBOT_WIDTH div 2 + _x, _y)
	  && _ok(- ROBOT_WIDTH div 2 + _x, _y)
	  && _ok(_x, _y)
	  && _ok(_x, _y + ROBOT_HEIGHT)
	)
} 

function _ok(_x, _y) {
	var _tx = int64(isoToTileX(_x, _y))
	var _ty = int64(isoToTileY(_x, _y))
	
	var _tilemap = layer_tilemap_get_id("Map")
	var _tilemap_data = tilemap_get(_tilemap, _tx, _ty)
	if (_tilemap_data > 0) {
		return true
	}
	return false
}

function try_move(_x, _y) {
	var _nx = x + _x
	var _ny = y + _y
	if (ok(_nx, _ny)) {
		x = _nx;
		y = _ny;
	}
}

function move_up() {
	try_move(0.5, -0.25)
	try_move(-0.5, -0.25)
	try_move(0, -0.5)
}


function move_down() {
	try_move(0.5, 0.25)
	try_move(-0.5, 0.25)
	try_move(0, 0.5)
}

function move_left() {
	dir = 0
	try_move(-0.5, -0.25)
	try_move(-0.5, 0.25)
}

function move_right() {
	dir = 1
	try_move(0.5, -0.25)
	try_move(0.5, 0.25)
}