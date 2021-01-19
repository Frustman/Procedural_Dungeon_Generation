/// @description Insert description here
// You can write your code in this editor
enum states{
	idle,
	move,
	attack,
	hurt,
	attack_ready
}
knuckback = false;
in_sight = false;
state_change = true;
state = states.idle;

anim_maxIndex = image_number;
anim_index = 0;
anim_fps = 10;

dx = 0;
dy = 0;