/// @description Insert description here
// You can write your code in this editor
event_inherited();
sprite_index = Spr_slime;
if(state != ai_state.stop){
	draw_sprite_ext(Spr_slime,real_index,x,y,xscale,yscale,0,c_white,1.0);
} else {
	draw_sprite_ext(Spr_slime,0,x,y,xscale,yscale,0,c_white,1.0);
}

shader_reset();
draw_text(x,y,(stateMachine == state_machine.fight) ? "fight" : "wander");
draw_text(x,y + 10,(state == ai_state.stop) ? "stop" : "wander");