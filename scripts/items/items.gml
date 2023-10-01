// @desc Item definitions
enum DIRS {
	UP = 0,
	RIGHT = 1,
	DOWN = 2,
	LEFT = 3
}


function item_Grenade() constructor {
		name = "grenade";
		spr = spr_grenades;
		wiregate_location = [1, 1];
		wiregate_dir = DIRS.RIGHT;
		size = [2, 2];
		item_type = "item"; 
}

function item_Battery() constructor {
		name= "battery"
		spr= spr_battery
		wiregate_location= [0, 0]
		wiregate_dir= DIRS.UP
		size= [1, 2]
		item_type= "item" 
		power_charge = 100;
}

function item_Wire() constructor {
		name= "wire"
		spr= spr_wire
		wiregate_location= [-1, -1]
		wiregate_dir= -1
		size= [1, 1]
		item_type= "wired" 
}

global.WIRE_SPRITE_MAPPING = ds_map_create()

global.WIRE_SPRITE_MAPPING[? 0b0000] = 0; // none
global.WIRE_SPRITE_MAPPING[? 0b1111] = 7; // all

global.WIRE_SPRITE_MAPPING[? 0b0001] = 5; // UP
global.WIRE_SPRITE_MAPPING[? 0b0010] = 3; // RIGHT
global.WIRE_SPRITE_MAPPING[? 0b0100] = 6; // DOWN
global.WIRE_SPRITE_MAPPING[? 0b1000] = 2; // LEFT


global.WIRE_SPRITE_MAPPING[? 0b0101] = 4; // UP DOWN
global.WIRE_SPRITE_MAPPING[? 0b1010] = 1; // RIGHT LEFT

global.WIRE_SPRITE_MAPPING[? 0b0011] = 12; // UP RIGHT ELBOW
global.WIRE_SPRITE_MAPPING[? 0b0110] = 14; // RIGHT DOWN ELBOW
global.WIRE_SPRITE_MAPPING[? 0b1100] = 13; // DOWN LEFT ELBOW
global.WIRE_SPRITE_MAPPING[? 0b1001] = 15; // LEFT UP ELBOW

global.WIRE_SPRITE_MAPPING[? 0b0111] = 9; // ~LEFT T
global.WIRE_SPRITE_MAPPING[? 0b1110] = 8; // ~UP T
global.WIRE_SPRITE_MAPPING[? 0b1101] = 10; // ~RIGHT T
global.WIRE_SPRITE_MAPPING[? 0b1011] = 11; // ~DOWN T