function try_move(_dx, _dy) {
	x += _dx;
	y += _dy;
	return true;
}

var _dx = x - oRobot.x;
var _dy = y - oRobot.y;
var _dist = sqrt(_dx * _dx + _dy * _dy)

switch (state) {
	case MOB_STATE.TRACKING:
		if (_dist < 100 && _dist > 3) {
			try_move(- _dx / _dist * 0.25, - _dy / _dist * 0.25)
		}
		if (_dist < 5) {
			state = MOB_STATE.ATTACKING
		}
		break;
	case MOB_STATE.ATTACKING:

}