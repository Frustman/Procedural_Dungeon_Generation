/// @description Insert description here
// You can write your code in this editor

randomize()
for(var i = 0; i < 9; i++){
	for(var j = 0; j < 8; j++){
		if(map_grid[# i, j] != 0){
			var c = irandom(dungeon_cnt - 1);
			var deco_c = irandom(deco_cnt - 1);
			if(map_grid[# i, j] == 1) {
				ds_grid_set_grid_region(real_map, map_list[c], 0, 0, DG_WIDTH - 1, DG_HEIGHT - 1, i * DG_WIDTH, j * DG_HEIGHT);
				ds_grid_set_grid_region(deco_real, deco_list[deco_c], 0, 0, deco_width - 1, deco_height - 1, i * deco_width, j * deco_height);
				global.path_grid[i * 10 + j] = map_list[c];
			}else {
				if(map_grid[# i, j] == 3){
					var xCenter = (i * DG_WIDTH + DG_WIDTH / 2 - 1) * CELL_WIDTH + CELL_WIDTH / 2;
					var yCenter = (j * DG_HEIGHT + DG_HEIGHT / 2) * CELL_HEIGHT + CELL_HEIGHT / 2;
					with(instance_create_layer(xCenter + 80, yCenter + 76,"sort_start",Obj_deco_instance)){
						sprite_index = Spr_deco_wood;
						image_speed = 1;
					}
					with(instance_create_layer(xCenter + 80, yCenter - 64,"sort_start",Obj_deco_instance)){
						sprite_index = Spr_deco_wood;
						image_speed = 1;
					}
					with(instance_create_layer(xCenter - 80, yCenter + 76,"sort_start",Obj_deco_instance)){
						sprite_index = Spr_deco_wood;
						image_speed = 1;
					}
					with(instance_create_layer(xCenter - 80, yCenter - 64,"sort_start",Obj_deco_instance)){
						sprite_index = Spr_deco_wood;
						image_speed = 1;
					}
					instance_create_layer(xCenter, yCenter,"sort_start",Obj_itemTable);
					instance_create_layer(xCenter, yCenter,"sort_start",Obj_ground);
				}
				ds_grid_set_grid_region(real_map, map_list[0], 0, 0, DG_WIDTH - 1, DG_HEIGHT - 1, i * DG_WIDTH, j * DG_HEIGHT);
				global.path_grid[i * 10 + j] = map_list[0];
			}
			if(i == 4 && j == 3) ds_grid_set_grid_region(real_map, map_list[0], 0, 0, DG_WIDTH - 1, DG_HEIGHT - 1, i * DG_WIDTH, j * DG_HEIGHT);
			if(door_grid[# i, j] % 10 == 1){ // left door
				ds_grid_set_region(real_map, i * DG_WIDTH, j * DG_HEIGHT + DG_HEIGHT / 2 - 1, i * DG_WIDTH + dg_trim - 1, j * DG_HEIGHT + DG_HEIGHT / 2 + 1, 0);
				//ds_grid_set(real_map, i * DG_WIDTH + dg_trim - 2, j * DG_HEIGHT + DG_HEIGHT / 2, 1);
				//ds_grid_set(real_map, i * DG_WIDTH + dg_trim - 2, j * DG_HEIGHT + DG_HEIGHT / 2 - 1, 1);
				//ds_grid_set(real_map, i * DG_WIDTH + dg_trim - 2, j * DG_HEIGHT + DG_HEIGHT / 2 + 1, 1);
				//var door_L = instance_create_layer(floor(i * DG_WIDTH + dg_trim - 1) * CELL_WIDTH, floor(j * DG_HEIGHT + DG_HEIGHT / 2) * CELL_HEIGHT, "sort_start", Obj_door);	
				//door_L.dir = 0;
			}
			if(door_grid[# i, j] div 10 % 10 == 1){ //
				ds_grid_set_region(real_map, i * DG_WIDTH + DG_WIDTH / 2 - 1, (j + 1) * DG_HEIGHT, i * DG_WIDTH + DG_WIDTH / 2 + 1, (j + 1) * DG_HEIGHT - dg_trim, 0);
				//ds_grid_set(real_map, i * DG_WIDTH + DG_WIDTH / 2, (j + 1) * DG_HEIGHT - dg_trim + 1, 1);
				//ds_grid_set(real_map, i * DG_WIDTH + DG_WIDTH / 2 - 1, (j + 1) * DG_HEIGHT - dg_trim + 1, 1);
				//ds_grid_set(real_map, i * DG_WIDTH + DG_WIDTH / 2 + 1, (j + 1) * DG_HEIGHT - dg_trim + 1, 1);
				//var door_D = instance_create_layer(floor(i * DG_WIDTH + DG_WIDTH / 2) * CELL_WIDTH, ((j + 1) * DG_HEIGHT - dg_trim) * CELL_HEIGHT, "sort_start", Obj_door);	
				//door_D.dir = 1;
			}
			if(door_grid[# i, j] div 100 % 10 == 1){
				ds_grid_set_region(real_map, (i + 1) * DG_WIDTH, j * DG_HEIGHT + DG_HEIGHT / 2 - 1,(i + 1) * DG_WIDTH - dg_trim, j * DG_HEIGHT + DG_HEIGHT / 2 + 1, 0);
				//ds_grid_set(real_map, (i + 1) * DG_WIDTH - dg_trim + 1, j * DG_HEIGHT + DG_HEIGHT / 2, 1);
				//ds_grid_set(real_map, (i + 1) * DG_WIDTH - dg_trim + 1, j * DG_HEIGHT + DG_HEIGHT / 2 - 1, 1);
				//ds_grid_set(real_map, (i + 1) * DG_WIDTH - dg_trim + 1, j * DG_HEIGHT + DG_HEIGHT / 2 + 1, 1);
				//var door_R = instance_create_layer(floor((i + 1) * DG_WIDTH - dg_trim) * CELL_WIDTH, floor(j * DG_HEIGHT + DG_HEIGHT / 2) * CELL_HEIGHT, "sort_start", Obj_door);	
				//door_R.dir = 2;
			}
			if(door_grid[# i, j] div 1000 % 10 == 1){
				ds_grid_set_region(real_map, i * DG_WIDTH + DG_WIDTH / 2 - 1, j * DG_HEIGHT, i * DG_WIDTH + DG_WIDTH / 2 + 1, j * DG_HEIGHT + dg_trim - 1, 0);
				//ds_grid_set(real_map, i * DG_WIDTH + DG_WIDTH / 2, j * DG_HEIGHT + dg_trim - 2, 1);
				//ds_grid_set(real_map, i * DG_WIDTH + DG_WIDTH / 2 + 1, j * DG_HEIGHT + dg_trim - 2, 1);
				//ds_grid_set(real_map, i * DG_WIDTH + DG_WIDTH / 2 - 1, j * DG_HEIGHT + dg_trim - 2, 1);
				//var door_U = instance_create_layer(floor(i * DG_WIDTH + DG_WIDTH / 2) * CELL_WIDTH, floor(j * DG_HEIGHT + dg_trim - 1) * CELL_HEIGHT, "sort_start", Obj_door);	
				//door_U.dir = 3;
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
			var ind = Scr_bit_masking_16(map,i,j,real_width,real_height,1);
			
			var tile_data = tile_set_index(TileSet_desert,ind);
			real_mini_map[i][j] = ind;
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
			
			real_mini_water[i][j] = _ind;
			
			with(instance_create_layer(i * CELL_WIDTH / 2, j * CELL_HEIGHT / 2, "sort_start",Obj_wall32)){
				image_index = _ind;
				penetrate = true;
				solid = false;
			}
		}
		if(_map[#i, j] == 3){
			real_mini_water[i][j] = 0;
			with(instance_create_layer(i * CELL_WIDTH / 2 + CELL_WIDTH / 4,j * CELL_HEIGHT / 2 + CELL_HEIGHT / 4,"sort_start",Obj_deco_instance)){
				sprite_index = (irandom(1) == 0) ? Spr_desert_tree1A : Spr_desert_tree1B;
				image_speed = 1.0;
			}
			/*var tile_data = tile_set_index(TileSet_desert_anim,(irandom(1) == 0) ? 1: 9);
			
			tilemap_set_at_pixel(layer_tilemap_get_id("Tiles_anim"), tile_data, i * CELL_WIDTH / 2, j * CELL_HEIGHT / 2);*/
		}
		if(_map[#i, j] == 0 || _map[#i, j] == -1){
			real_mini_water[i][j] = 0;
			var randX = i * CELL_WIDTH / 2 + CELL_WIDTH / 4;
			var randY = j * CELL_HEIGHT / 2 + CELL_HEIGHT / 4;
			if(!instance_place(randX,randY,Obj_wall)){
				if(random(1) <= 0.03){
					//Scr_sprite_depth_sorting_index(Spr_desert_deco, randX, randY, irandom(35));
					with(instance_create_layer(randX,randY,"sort_start",Obj_deco_instance)){
						sprite_index = Spr_desert_deco;
						image_index = irandom(35);
					}
				}
			}
		}
	}
}


instance_create_layer(0,0, "controller",Obj_controller);

instance_create_layer((DG_WIDTH * 4 + DG_WIDTH / 2) * CELL_WIDTH, (DG_HEIGHT * 3 + DG_HEIGHT / 2) * CELL_HEIGHT, "sort_start", Obj_chr);
//instance_create_layer((DG_WIDTH * 4 + DG_WIDTH / 2) * CELL_WIDTH, (DG_HEIGHT * 3 + DG_HEIGHT / 2) * CELL_HEIGHT, "sort_start", Obj_shader);
instance_create_layer((DG_WIDTH * 4 + DG_WIDTH / 2) * CELL_WIDTH, (DG_HEIGHT * 3 + DG_HEIGHT / 2) * CELL_HEIGHT, "shader", Obj_bloom_shader);
//instance_create_layer((DG_WIDTH * 4 + DG_WIDTH / 2) * CELL_WIDTH, (DG_HEIGHT * 3 + DG_HEIGHT / 2) * CELL_HEIGHT + 64, "sort_start", Obj_itemTable);
//instance_create_layer((DG_WIDTH * 4 + DG_WIDTH / 2) * CELL_WIDTH, (DG_HEIGHT * 3 + DG_HEIGHT / 2) * CELL_HEIGHT + 64, "sort_start", Obj_itemTable);
//instance_create_layer((DG_WIDTH * 4 + DG_WIDTH / 2) * CELL_WIDTH, (DG_HEIGHT * 3 + DG_HEIGHT / 2) * CELL_HEIGHT + 64, "sort_start", Obj_itemTable);
//instance_create_layer((DG_WIDTH * 4 + DG_WIDTH / 2) * CELL_WIDTH, (DG_HEIGHT * 3 + DG_HEIGHT / 2) * CELL_HEIGHT + 64, "sort_start", Obj_itemTable);
//instance_create_layer((DG_WIDTH * 4 + DG_WIDTH / 2) * CELL_WIDTH, (DG_HEIGHT * 3 + DG_HEIGHT / 2) * CELL_HEIGHT + 64, "sort_start", Obj_itemTable);
//instance_create_layer((DG_WIDTH * 4 + DG_WIDTH / 2) * CELL_WIDTH, (DG_HEIGHT * 3 + DG_HEIGHT / 2) * CELL_HEIGHT + 64, "sort_start", Obj_itemTable);
instance_create_layer((DG_WIDTH * 4 + DG_WIDTH / 2) * CELL_WIDTH, (DG_HEIGHT * 3 + DG_HEIGHT / 2) * CELL_HEIGHT, "pause", Obj_pause);
//instance_create_layer((DG_WIDTH *  + DG_WIDTH / 2) * CELL_WIDTH, (DG_HEIGHT * 3 + DG_HEIGHT / 2) * CELL_HEIGHT, "Instances", Obj_enemy_contextMap);
instance_create_layer((DG_WIDTH * 4 + DG_WIDTH / 2) * CELL_WIDTH, (DG_HEIGHT * 3 + DG_HEIGHT / 2) * CELL_HEIGHT + 64, "Instances", Obj_enemy_basic);
//instance_create_layer((DG_WIDTH * 4 + DG_WIDTH / 2) * CELL_WIDTH, (DG_HEIGHT * 3 + DG_HEIGHT / 2) * CELL_HEIGHT + 64, "Instances", Obj_boss);
//instance_create_layer((DG_WIDTH * 4 + DG_WIDTH / 2) * CELL_WIDTH + 64, (DG_HEIGHT * 3 + DG_HEIGHT / 2) * CELL_HEIGHT, "Instances", Obj_enemy_contextMap);
//instance_create_layer((DG_WIDTH * 4 + DG_WIDTH / 2) * CELL_WIDTH + 64, (DG_HEIGHT * 3 + DG_HEIGHT / 2) * CELL_HEIGHT + 64, "sort_start", Obj_enemy_perlinNoise);
Obj_camera.x = (DG_WIDTH * 4 + DG_WIDTH / 2) * CELL_WIDTH;
Obj_camera.y = (DG_HEIGHT * 3 + DG_HEIGHT / 2) * CELL_HEIGHT;