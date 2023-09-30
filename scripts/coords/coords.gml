// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function tileToIsometricX(_tx, _ty) {
	return ((_tx - _ty) * (TILE_W * 0.5)) + SCREEN_W * 0.5;
}

function tileToIsometricY(tx, ty) {
	return ((tx + ty) * (TILE_H * 0.5));
}