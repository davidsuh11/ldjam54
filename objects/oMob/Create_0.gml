/// @description Insert description here
// You can write your code in this editor

var _xx = tileToIsometricX(x / 16, y / 16)
var _yy = tileToIsometricY(x / 16, y / 16)
x = _xx
y = _yy
state = MOB_STATE.TRACKING

enum MOB_STATE {
	TRACKING,
	ATTACKING,
}