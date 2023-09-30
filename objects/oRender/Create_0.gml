/// @description Insert description here
// You can write your code in this editor
layer_set_visible("Map", false)
global.map = ds_grid_create(MAP_W, MAP_H)

var _tilemap = layer_tilemap_get_id("Map")


for (var _tx = 0; _tx < MAP_W; ++_tx) {
	for (var _ty = 0; _ty < MAP_H; ++_ty) {
		var _tilemap_data = tilemap_get(_tilemap, _tx, _ty)
		var _this_tile = [-1, 0]
		_this_tile[TILE.SPRITE] = _tilemap_data;
		_this_tile[TILE.Z] = 0;
		global.map[# _tx, _ty] = _this_tile
	}
}

