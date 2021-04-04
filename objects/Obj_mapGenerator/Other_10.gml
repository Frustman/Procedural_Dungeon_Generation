/// @description Insert description here
// You can write your code in this editor

randomize()
for(var i = 0; i < 9; i++){
	for(var j = 0; j < 8; j++){
		if(map_grid[# i, j] != 0){
			var c = irandom(dungeon_cnt - 1);
			var deco_c = irandom(deco_cnt - 1);
			if(map_grid[# i, j] == 1) {
				ds_grid_set_grid_region(real_map, map_list[c], 0, 0, dg_width - 1, dg_height - 1, i * dg_width, j * dg_height);
				ds_grid_set_grid_region(deco_real, deco_list[deco_c], 0, 0, deco_width - 1, deco_height - 1, i * deco_width, j * deco_height);
				global.path_grid[i * 10 + j] = map_list[c];
			}else {
				ds_grid_set_grid_region(real_map, map_list[0], 0, 0, dg_width - 1, dg_height - 1, i * dg_width, j * dg_height);
				global.path_grid[i * 10 + j] = map_list[0];
			}
			if(i == 4 && j == 3) ds_grid_set_grid_region(real_map, map_list[0], 0, 0, dg_width - 1, dg_height - 1, i * dg_width, j * dg_height);
			if(door_grid[# i, j] % 10 == 1){ // left door
				ds_grid_set(real_map, i * dg_width + dg_trim - 1, j * dg_height + dg_height / 2, 0);
				ds_grid_set(real_map, i * dg_width + dg_trim - 2, j * dg_height + dg_height / 2, 1);
				ds_grid_set(real_map, i * dg_width + dg_trim - 2, j * dg_height + dg_height / 2 - 1, 1);
				ds_grid_set(real_map, i * dg_width + dg_trim - 2, j * dg_height + dg_height / 2 + 1, 1);
				var door_L = instance_create_layer(floor(i * dg_width + dg_trim - 1) * CELL_WIDTH, floor(j * dg_height + dg_height / 2) * CELL_HEIGHT, "sort_start", Obj_door);	
				door_L.dir = 0;
			}
			if(door_grid[# i, j] div 10 % 10 == 1){ //
				ds_grid_set(real_map, i * dg_width + dg_width / 2, (j + 1) * dg_height - dg_trim, 0);
				ds_grid_set(real_map, i * dg_width + dg_width / 2, (j + 1) * dg_height - dg_trim + 1, 1);
				ds_grid_set(real_map, i * dg_width + dg_width / 2 - 1, (j + 1) * dg_height - dg_trim + 1, 1);
				ds_grid_set(real_map, i * dg_width + dg_width / 2 + 1, (j + 1) * dg_height - dg_trim + 1, 1);
				var door_D = instance_create_layer(floor(i * dg_width + dg_width / 2) * CELL_WIDTH, ((j + 1) * dg_height - dg_trim) * CELL_HEIGHT, "sort_start", Obj_door);	
				door_D.dir = 1;
			}
			if(door_grid[# i, j] div 100 % 10 == 1){
				ds_grid_set(real_map, (i + 1) * dg_width - dg_trim, j * dg_height + dg_height / 2, 0);
				ds_grid_set(real_map, (i + 1) * dg_width - dg_trim + 1, j * dg_height + dg_height / 2, 1);
				ds_grid_set(real_map, (i + 1) * dg_width - dg_trim + 1, j * dg_height + dg_height / 2 - 1, 1);
				ds_grid_set(real_map, (i + 1) * dg_width - dg_trim + 1, j * dg_height + dg_height / 2 + 1, 1);
				var door_R = instance_create_layer(floor((i + 1) * dg_width - dg_trim) * CELL_WIDTH, floor(j * dg_height + dg_height / 2) * CELL_HEIGHT, "sort_start", Obj_door);	
				door_R.dir = 2;
			}
			if(door_grid[# i, j] div 1000 % 10 == 1){
				ds_grid_set(real_map, i * dg_width + dg_width / 2, j * dg_height + dg_trim - 1, 0);
				ds_grid_set(real_map, i * dg_width + dg_width / 2, j * dg_height + dg_trim - 2, 1);
				ds_grid_set(real_map, i * dg_width + dg_width / 2 + 1, j * dg_height + dg_trim - 2, 1);
				ds_grid_set(real_map, i * dg_width + dg_width / 2 - 1, j * dg_height + dg_trim - 2, 1);
				var door_U = instance_create_layer(floor(i * dg_width + dg_width / 2) * CELL_WIDTH, floor(j * dg_height + dg_trim - 1) * CELL_HEIGHT, "sort_start", Obj_door);	
				door_U.dir = 3;
			}
		}
	}
}

var map = real_map;
for(var i = 0; i < real_width; i++){
	for(var j = 0; j < real_height; j++){
		var rand = irandom(6);
		var _tile_data = tile_set_index(TileSet_desert,16 + rand);
			
		tilemap_set_at_pixel(layer_tilemap_get_id("Tiles_2"), _tile_data, i* CELL_WIDTH, j * CELL_HEIGHT);
		
		
		if(abs(map[#i, j]) == 1){
			var tile_data = Scr_auto_tiling_16(map,i,j,real_width,real_height,TileSet_desert,1);
			
			var ind = tile_get_index(tile_data);
			if(map[#i, j] == 1)
				with(instance_create_layer(i * CELL_WIDTH, j * CELL_HEIGHT, "sort_start",Obj_wall)){
					image_index = ind;	
				}
			
			tilemap_set_at_pixel(layer_tilemap_get_id("Tiles_1"), tile_data, i* CELL_WIDTH, j * CELL_HEIGHT);
		}
	}
}

var _map = deco_real;
for(var i = 0; i < real_width * 2; i++){
	for(var j = 0; j < real_height * 2; j++){
		if(_map[#i, j] == 2){
			var tile_data = Scr_auto_tiling_16(_map,i,j,real_width * 2,real_height * 2,TileSet_desert_water, 2);
			tilemap_set_at_pixel(layer_tilemap_get_id("Tiles_water"), tile_data, i* CELL_WIDTH / 2, j * CELL_HEIGHT / 2);
			
			var _ind = tile_get_index(tile_data);
			
			with(instance_create_layer(i * CELL_WIDTH / 2, j * CELL_HEIGHT / 2, "sort_start",Obj_wall32)){
				image_index = _ind;
				penetrate = true;
				solid = false;
			}
		}
		if(_map[#i, j] == 3){
			Scr_sprite_depth_sorting((irandom(1) == 0) ? Spr_desert_tree1A : Spr_desert_tree1B, i * CELL_WIDTH / 2 + CELL_WIDTH / 4, j * CELL_HEIGHT / 2 + CELL_HEIGHT / 4);
			/*var tile_data = tile_set_index(TileSet_desert_anim,(irandom(1) == 0) ? 1: 9);
			
			tilemap_set_at_pixel(layer_tilemap_get_id("Tiles_anim"), tile_data, i * CELL_WIDTH / 2, j * CELL_HEIGHT / 2);*/
		}
		if(_map[#i, j] == 0 || _map[#i, j] == -1){
			var randX = i * CELL_WIDTH / 2;
			var randY = j * CELL_HEIGHT / 2;
			if(!instance_place(randX,randY,Obj_wall)){
				if(random(1) <= 0.03){
					var tile_data = tile_set_index(TileSet_desert_deco,irandom(35));
			
					tilemap_set_at_pixel(layer_tilemap_get_id("Tiles_deco"), tile_data, randX, randY);
				}
			}
		}
	}
}


instance_create_layer(0,0, "controller",Obj_controller);

instance_create_layer((dg_width * 4 + dg_width / 2) * CELL_WIDTH, (dg_height * 3 + dg_height / 2) * CELL_HEIGHT, "sort_start", Obj_chr);
//instance_create_layer((dg_width * 4 + dg_width / 2) * CELL_WIDTH, (dg_height * 3 + dg_height / 2) * CELL_HEIGHT, "sort_start", Obj_shader);
//instance_create_layer((dg_width * 4 + dg_width / 2) * CELL_WIDTH, (dg_height * 3 + dg_height / 2) * CELL_HEIGHT, "shader", Obj_bloom_shader);
//instance_create_layer((dg_width * 4 + dg_width / 2) * CELL_WIDTH, (dg_height * 3 + dg_height / 2) * CELL_HEIGHT + 64, "sort_start", Obj_barrel);
instance_create_layer((dg_width * 4 + dg_width / 2) * CELL_WIDTH, (dg_height * 3 + dg_height / 2) * CELL_HEIGHT, "pause", Obj_pause);
//instance_create_layer((dg_width * 4 + dg_width / 2) * CELL_WIDTH, (dg_height * 3 + dg_height / 2) * CELL_HEIGHT, "Instances", Obj_enemy_contextMap);
//instance_create_layer((dg_width * 4 + dg_width / 2) * CELL_WIDTH, (dg_height * 3 + dg_height / 2) * CELL_HEIGHT + 64, "Instances", Obj_enemy_contextMap);
//instance_create_layer((dg_width * 4 + dg_width / 2) * CELL_WIDTH + 64, (dg_height * 3 + dg_height / 2) * CELL_HEIGHT, "Instances", Obj_enemy_contextMap);
//instance_create_layer((dg_width * 4 + dg_width / 2) * CELL_WIDTH + 64, (dg_height * 3 + dg_height / 2) * CELL_HEIGHT + 64, "sort_start", Obj_enemy_perlinNoise);
Obj_camera.x = (dg_width * 4 + dg_width / 2) * CELL_WIDTH;
Obj_camera.y = (dg_height * 3 + dg_height / 2) * CELL_HEIGHT;