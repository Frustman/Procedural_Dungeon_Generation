/// @description Insert description here
// You can write your code in this editor
if(random(1) <= 0.3){
	if(state == ai_state.wandering) state = ai_state.stop;
	else state = ai_state.wandering;
}
Alarm[1] = 45;