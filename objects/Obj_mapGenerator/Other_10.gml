/// @description Insert description here
// You can write your code in this editor

randomize()
for(var i = 0; i < 9; i++){
	for(var j = 0; j < 8; j++){
		if(map_grid[# i, j] != 0){
			var c = irandom(dungeon_cnt - 1);
			if(map_grid[# i, j] == 1) {
				ds_grid_set_grid_region(real_map, map_list[c], 0, 0, dg_width - 1, dg_height - 1, i * dg_width, j * dg_height);
				global.path_grid[i * 10 + j] = map_list[c];
			}else {
				ds_grid_set_grid_region(real_map, map_list[0], 0, 0, dg_width - 1, dg_height - 1, i * dg_width, j * dg_height);
				global.path_grid[i * 10 + j] = map_list[0];
			}
			if(i == 4 && j == 3) ds_grid_set_grid_region(real_map, map_list[0], 0, 0, dg_width - 1, dg_height - 1, i * dg_width, j * dg_height);
			if(door_grid[# i, j] % 10 == 1){
				ds_grid_set(real_map, i * dg_width + dg_trim - 1, j * dg_height + dg_height / 2, 0);
				ds_grid_set(real_map, i * dg_width + dg_trim - 2, j * dg_height + dg_height / 2, 1);
				ds_grid_set(real_map, i * dg_width + dg_trim - 2, j * dg_height + dg_height / 2 - 1, 1);
				ds_grid_set(real_map, i * dg_width + dg_trim - 2, j * dg_height + dg_height / 2 + 1, 1);
				var door_L = instance_create_layer(floor(i * dg_width + dg_trim - 1) * CELL_WIDTH, floor(j * dg_height + dg_height / 2) * CELL_HEIGHT, "wall", Obj_door);	
				door_L.dir = 0;
			}
			if(door_grid[# i, j] div 10 % 10 == 1){
				ds_grid_set(real_map, i * dg_width + dg_width / 2, (j + 1) * dg_height - dg_trim, 0);
				ds_grid_set(real_map, i * dg_width + dg_width / 2, (j + 1) * dg_height - dg_trim + 1, 1);
				ds_grid_set(real_map, i * dg_width + dg_width / 2 - 1, (j + 1) * dg_height - dg_trim + 1, 1);
				ds_grid_set(real_map, i * dg_width + dg_width / 2 + 1, (j + 1) * dg_height - dg_trim + 1, 1);
				var door_D = instance_create_layer(floor(i * dg_width + dg_width / 2) * CELL_WIDTH, ((j + 1) * dg_height - dg_trim) * CELL_HEIGHT, "wall", Obj_door);	
				door_D.dir = 1;
			}
			if(door_grid[# i, j] div 100 % 10 == 1){
				ds_grid_set(real_map, (i + 1) * dg_width - dg_trim, j * dg_height + dg_height / 2, 0);
				ds_grid_set(real_map, (i + 1) * dg_width - dg_trim + 1, j * dg_height + dg_height / 2, 1);
				ds_grid_set(real_map, (i + 1) * dg_width - dg_trim + 1, j * dg_height + dg_height / 2 - 1, 1);
				ds_grid_set(real_map, (i + 1) * dg_width - dg_trim + 1, j * dg_height + dg_height / 2 + 1, 1);
				var door_R = instance_create_layer(floor((i + 1) * dg_width - dg_trim) * CELL_WIDTH, floor(j * dg_height + dg_height / 2) * CELL_HEIGHT, "wall", Obj_door);	
				door_R.dir = 2;
			}
			if(door_grid[# i, j] div 1000 % 10 == 1){
				ds_grid_set(real_map, i * dg_width + dg_width / 2, j * dg_height + dg_trim - 1, 0);
				ds_grid_set(real_map, i * dg_width + dg_width / 2, j * dg_height + dg_trim - 2, 1);
				ds_grid_set(real_map, i * dg_width + dg_width / 2 + 1, j * dg_height + dg_trim - 2, 1);
				ds_grid_set(real_map, i * dg_width + dg_width / 2 - 1, j * dg_height + dg_trim - 2, 1);
				var door_U = instance_create_layer(floor(i * dg_width + dg_width / 2) * CELL_WIDTH, floor(j * dg_height + dg_trim - 1) * CELL_HEIGHT, "wall", Obj_door);	
				door_U.dir = 3;
			}
		}
	}
}

var map = real_map;
for(var i = 0; i < real_width; i++){
	for(var j = 0; j < real_height; j++){
		if(map[#i, j] == 2){
			//instance_create_layer(i * CELL_WIDTH, j * CELL_HEIGHT, "Instances", Obj_door);
		}
		if(abs(map[#i, j]) == 1){
			if(i != 0 && i != real_width - 1 && j != 0 && j != real_height - 1){
				var top = (abs(map[#i, j-1]) == 1) ? 1 : 0;
				var left = (abs(map[#i-1, j]) == 1) ? 1 : 0;
				var bottom = (abs(map[#i, j+1]) == 1) ? 1 : 0;
				var right = (abs(map[#i+1, j]) == 1) ? 1 : 0;
				var top_left = (abs(map[#i-1, j-1]) == 1 && top && left) ? 1 : 0;
				var top_right = (abs(map[#i+1, j-1]) == 1 && top && right) ? 1 : 0;
				var bottom_left = (abs(map[#i-1, j+1]) == 1 && bottom && left) ? 1 : 0;
				var bottom_right = (abs(map[#i+1, j+1]) == 1 && bottom && right) ? 1 : 0;
		
				var dir = 1*top_left + 2*top + 4*top_right + 8*left + 16*right + 32*bottom_left + 64*bottom + 128*bottom_right;
				var index = Scr_dir_to_index(dir);
			
				var tile_data = tile_set_index(TileSet3,index + 1);
		
			} else{
				var tile_data = tile_set_index(TileSet3,46);
			}
			if(map[#i, j] == 1) instance_create_layer(i * CELL_WIDTH, j * CELL_HEIGHT, layer_get_id("wall"),Obj_wall);
			tilemap_set_at_pixel(layer_tilemap_get_id("Tiles_1"), tile_data, i* CELL_WIDTH, j * CELL_HEIGHT);
		} else {
			var top = (map[#i, j-1] == 0) ? 1 : 0;
			var left = (map[#i-1, j] == 0) ? 1 : 0;
			var bottom = (map[#i, j+1] == 0) ? 1 : 0;
			var right = (map[#i+1, j] == 0) ? 1 : 0;
			var top_left = (map[#i-1, j-1] == 0 && top && left) ? 1 : 0;
			var top_right = (map[#i+1, j-1] == 0 && top && right) ? 1 : 0;
			var bottom_left = (map[#i-1, j+1] == 0 && bottom && left) ? 1 : 0;
			var bottom_right = (map[#i+1, j+1] == 0 && bottom && right) ? 1 : 0;
		
			var dir = 1*top_left + 2*top + 4*top_right + 8*left + 16*right + 32*bottom_left + 64*bottom + 128*bottom_right;
			var index = Scr_dir_to_index(dir);
			
			var tile_data = tile_set_index(TileSet_ground,index + 1);
			
			tilemap_set_at_pixel(layer_tilemap_get_id("Tiles_2"), tile_data, i* CELL_WIDTH, j * CELL_HEIGHT);
		}
	}
}





instance_create_layer(0,0, "Instances",Obj_controller);

instance_create_layer((dg_width * 4 + dg_width / 2) * CELL_WIDTH, (dg_height * 3 + dg_height / 2) * CELL_HEIGHT, "Instances", Obj_chr);
//instance_create_layer((dg_width * 4 + dg_width / 2) * CELL_WIDTH, (dg_height * 3 + dg_height / 2) * CELL_HEIGHT, "Instances", Obj_enemy_contextMap);
//instance_create_layer((dg_width * 4 + dg_width / 2) * CELL_WIDTH, (dg_height * 3 + dg_height / 2) * CELL_HEIGHT + 64, "Instances", Obj_enemy_contextMap);
//instance_create_layer((dg_width * 4 + dg_width / 2) * CELL_WIDTH + 64, (dg_height * 3 + dg_height / 2) * CELL_HEIGHT, "Instances", Obj_enemy_contextMap);
instance_create_layer((dg_width * 4 + dg_width / 2) * CELL_WIDTH + 64, (dg_height * 3 + dg_height / 2) * CELL_HEIGHT + 64, "Instances", Obj_enemy_perlinNoise);
Obj_camera.x = (dg_width * 4 + dg_width / 2) * CELL_WIDTH;
Obj_camera.y = (dg_height * 3 + dg_height / 2) * CELL_HEIGHT;