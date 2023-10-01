// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function tileToIsometricX(_tx, _ty) {
	return ((_tx - _ty) * (TILE_W div 2)) + SCREEN_W div 2
}

function tileToIsometricY(_tx, _ty) {
	return ((_tx + _ty) * (TILE_H div 2));
}

function isoToTileX(_sx, _sy) {
	return ((_sx - SCREEN_W div 2) / (TILE_W) + _sy / TILE_H);
}

function isoToTileY(_sx, _sy) {
	return (- (_sx - SCREEN_W div 2) / (TILE_W) + _sy / TILE_H);
}