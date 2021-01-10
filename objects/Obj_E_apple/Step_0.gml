/// @description Insert description here
// You can write your code in this editor
if(chr_diff < 50 && in_sight && state_change){
	state = states.attack_ready;
	state_change = false;
	alarm[0] = change_delay;
}