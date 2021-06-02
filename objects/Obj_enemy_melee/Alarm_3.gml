/// @description Insert description here
// You can write your code in this editor
with(instance_create_layer(x,y,"sort_start",Obj_enemy_attackmsk)){
	dir = other.attackDir;	
}
state = ai_state.chase;