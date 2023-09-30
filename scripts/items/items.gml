// @desc Item definitions
enum DIRS {
	UP = 0,
	RIGHT = 1,
	DOWN = 2,
	LEFT = 3
}
global.ITEMS = [
	{
		name : "grenade",
		spr : spr_grenades,
		wiregate_location : [1, 1],
		wiregate_dir : DIRS.RIGHT,
		size : [2, 2]
	},
	{
		name: "battery",
		spr: spr_battery,
		wiregate_location : [0,0],
		wiregate_dir: DIRS.UP,
		size: [1, 2]
	}
]