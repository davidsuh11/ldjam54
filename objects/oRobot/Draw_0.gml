/// @description Insert description here
// You can write your code in this editor

var _sx = tileToIsometricX(curx, cury)
var _sy = tileToIsometricY(curx, cury)

curx += (ctx - curx) * 0.3
cury += (cty - cury) * 0.3
draw_sprite(spr_robot_1, 0, _sx, _sy - 36)