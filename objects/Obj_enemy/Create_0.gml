/// @description Insert description here
// You can write your code in this editor
enum states{
	idle,
	move,
	attack,
	hurt,
	attack_ready
}
in_sight = false;
state_change = true;
state = states.idle;