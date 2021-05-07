/// @description Insert description here
// You can write your code in this editor


for(var i = 0; i < ds_list_size(node_list) - 1;i++){
	var start = node_list[| i];
	var target = node_list[| i + 1];
	
	sx = start[0] div CELL_WIDTH;
	sy = start[1] div CELL_HEIGHT;
	tx = target[0] div CELL_WIDTH;
	ty = target[1] div CELL_HEIGHT;
	
	var ran = irandom(1);
	if(ran == 0){
		ds_grid_set_region(geo_map, sx, sy, tx, sy, LAND);
		sx = tx;
		ds_grid_set_region(geo_map, sx, sy, tx, ty, LAND);
	}
	if(ran == 1){
		ds_grid_set_region(geo_map, sx, sy, sx, ty, LAND);
		sy = ty;
		ds_grid_set_region(geo_map, sx, sy, tx, sy, LAND);
	}
	
}