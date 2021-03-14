/// @description Insert description here
// You can write your code in this editor
global.paused = !global.paused;
if(global.paused == false){
	instance_activate_layer(layer_get_id("controller"));
	for(var i = 0; i < room_H; i++){
		instance_activate_layer(global.depth_grid[# 0, i]);
	}
	sprite_delete(paused_surf);
	instance_destroy(Obj_status);
    paused_surf = -1;
}