/// @description Insert description here
// You can write your code in this editor

room_H = 19 * CELL_HEIGHT;

global.depth_grid = ds_grid_create(1,room_H);

for(var i = 0; i < room_H; i++){
	global.depth_grid[# 0, i] = layer_create(layer_get_depth("sort_begin") - i);
}

instance_create_layer(0,0,"sort_end",Obj_mapGenerator);