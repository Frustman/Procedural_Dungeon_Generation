/// @description Insert description here
// You can write your code in this editor

room_H = DG_HEIGHT * CELL_HEIGHT;

global.depth_grid = ds_grid_create(1,room_H);
global.deco_grid = ds_grid_create(1,room_H);

for(var i = 0; i < room_H; i++){
	global.depth_grid[# 0, i] = layer_create(layer_get_depth("sort_end") - i);
	global.deco_grid[# 0, i] = layer_create(layer_get_depth("sort_end") - i);
}

/*for(var i = 0; i < room_H; i++){
		layer_script_begin(global.deco_grid[#0, i], Scr_layer_set_alpha);
		layer_shader(global.deco_grid[#0, i], Sha_set_alpha);
		layer_script_end(global.deco_grid[#0, i],Scr_layer_end);
}*/

instance_create_layer(0,0,"sort_end",Obj_mapController);

tex_alpha = shader_get_uniform(Sha_set_alpha,"tex_alpha");

for(var i = 0; i < room_H; i++){
	//global.depth_grid[# 0, i] = layer_create(layer_get_depth("sort_end") - i);
	layer_depth(global.depth_grid[# 0, i], 0);
}
layer_depth(layer_get_id("cutscene"),0);
layer_depth(layer_get_id("gui"),-1);
layer_depth(layer_get_id("Tiles_ground"),8);
layer_depth(layer_get_id("Tiles_water"),9);
layer_depth(layer_get_id("Tiles_mud"),9);
layer_depth(layer_get_id("Tiles_2"),10);