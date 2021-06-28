/// @description Insert description here
// You can write your code in this editor

randomize()
ds_grid_set(map_grid,4,3,-1);
for(var i = 0; i < 9; i++){
	for(var j = 0; j < 8; j++){
		//real_solid = Scr_Pdg_Map_Init(map_grid, door_grid, real_width, real_height, 6, 4);
		if(map_grid[# i, j] != 0){
			if(map_grid[# i, j] == -1) {
				for(var k = 0; k < ds_list_size(inst_list[0]); k++){
					var data = inst_list[0][| k];
					var xx = data[? "x"] + i * DG_WIDTH * CELL_WIDTH;	
					var yy = data[? "y"] + j * DG_HEIGHT * CELL_HEIGHT;	
					var _image_speed= data[? "image_speed"];	
					var _image_index = data[? "image_index"];	
					var _sprite_index = data[? "sprite_index"];	
					with(instance_create_layer(xx,yy,"sort_start",Obj_desert_deco)){
						sprite_index = _sprite_index;
						image_speed = _image_speed;
						image_index = _image_index;
					}
				}
				ds_grid_set_grid_region(real_solid, solid_map[0], 0, 0, DG_WIDTH - 1, DG_HEIGHT - 1, i * DG_WIDTH, j * DG_HEIGHT);
			}
			if(map_grid[# i, j] == 1) {
				var ran = irandom(dungeon_cnt - 1);
				for(var k = 0; k < ds_list_size(inst_list[ran]); k++){
					var data = inst_list[ran][| k];
					var xx = data[? "x"] + i * DG_WIDTH * CELL_WIDTH;	
					var yy = data[? "y"] + j * DG_HEIGHT * CELL_HEIGHT;	
					var _image_speed= data[? "image_speed"];	
					var _image_index = data[? "image_index"];	
					var _sprite_index = data[? "sprite_index"];	
					with(instance_create_layer(xx,yy,"sort_start",Obj_desert_deco)){
						sprite_index = _sprite_index;
						image_speed = _image_speed;
						image_index = _image_index;
					}
				}
				ds_grid_set_grid_region(real_solid, solid_map[ran], 0, 0, DG_WIDTH - 1, DG_HEIGHT - 1, i * DG_WIDTH, j * DG_HEIGHT);
				ds_grid_set_grid_region(real_ground, ground_map[ran], 0, 0, deco_width - 1, deco_height - 1, i * deco_width, j * deco_height);
			} else if (map_grid[# i, j] == 2){
				var rewardRan = irandom(reward_cnt - 1);
				for(var k = 0; k < ds_list_size(reward_inst_list[rewardRan]); k++){
					var data = reward_inst_list[rewardRan][| k];
					var xx = data[? "x"] + i * DG_WIDTH * CELL_WIDTH;	
					var yy = data[? "y"] + j * DG_HEIGHT * CELL_HEIGHT;	
					var _image_speed= data[? "image_speed"];	
					var _image_index = data[? "image_index"];	
					var _sprite_index = data[? "sprite_index"];	
					with(instance_create_layer(xx,yy,"sort_start",Obj_desert_deco)){
						sprite_index = _sprite_index;
						image_speed = _image_speed;
						image_index = _image_index;
					}
				}
				ds_grid_set_grid_region(real_solid, reward_solid_map[rewardRan], 0, 0, DG_WIDTH - 1, DG_HEIGHT - 1, i * DG_WIDTH, j * DG_HEIGHT);
				ds_grid_set_grid_region(real_ground, reward_ground_map[rewardRan], 0, 0, deco_width - 1, deco_height - 1, i * deco_width, j * deco_height);
			} else if(map_grid[# i, j] == 3){
				var rewardRan = irandom(reward_cnt - 1);
				for(var k = 0; k < ds_list_size(reward_inst_list[rewardRan]); k++){
					var data = reward_inst_list[rewardRan][| k];
					var xx = data[? "x"] + i * DG_WIDTH * CELL_WIDTH;	
					var yy = data[? "y"] + j * DG_HEIGHT * CELL_HEIGHT;	
					var _image_speed= data[? "image_speed"];	
					var _image_index = data[? "image_index"];	
					var _sprite_index = data[? "sprite_index"];	
					with(instance_create_layer(xx,yy,"sort_start",Obj_desert_deco)){
						sprite_index = _sprite_index;
						image_speed = _image_speed;
						image_index = _image_index;
					}
				}
				ds_grid_set_grid_region(real_solid, reward_solid_map[rewardRan], 0, 0, DG_WIDTH - 1, DG_HEIGHT - 1, i * DG_WIDTH, j * DG_HEIGHT);
				ds_grid_set_grid_region(real_ground, reward_ground_map[rewardRan], 0, 0, deco_width - 1, deco_height - 1, i * deco_width, j * deco_height);
					
				var xCenter = (DG_WIDTH * CELL_WIDTH * i) + DG_WIDTH / 2 * CELL_WIDTH;
				var yCenter = (DG_HEIGHT * CELL_HEIGHT * j) + DG_HEIGHT / 2 * CELL_HEIGHT;
					
				instance_create_layer(xCenter, yCenter,"sort_start",Obj_itemTable);
			}
		}
	}
}
var _chance = 55;
for(var i = 0; i < 9; i++){
	for(var j = 0; j < 8; j++){
		if(real_solid[# i, j] != 0){
			/*if(_door[# i, j] % 10 == 1){ // left door
				var xx = i * DG_WIDTH;
				var yy = j * DG_HEIGHT + DG_HEIGHT div 2;
				ds_grid_set_region(_real_map, xx, yy, xx + dg_trim - 1, yy, cellular.ImmutableGround);
				_door_check[# i, j] = true;
				_door_check[# i - 1, j] = true;
			}*/
			if(door_grid[# i, j] div 10 % 10 == 1){ // down door
				var xx = i * DG_WIDTH + DG_WIDTH div 2;
				var y1 = j * DG_HEIGHT + DG_HEIGHT div 2 + 4;
				var y2 = (j + 1) * DG_HEIGHT + DG_HEIGHT div 2 - 4;
				var offset = irandom_range(-1,1);
				for(var yy = y1; yy <= y2; yy++){
					if(real_solid[# xx + offset + 1, yy] == cellular.ImmutableWall) ds_grid_set(real_solid, xx + offset + 1, yy, cellular.WallReal);
					if(real_solid[# xx + offset - 1, yy] == cellular.ImmutableWall) ds_grid_set(real_solid, xx + offset - 1, yy, cellular.WallReal);
					ds_grid_set(real_solid, xx + offset, yy, cellular.MutableGround);
				}
			}
			if(door_grid[# i, j] div 100 % 10 == 1){ // right door
				var x1 = i * DG_WIDTH + DG_WIDTH div 2 + 4;
				var x2 = (i + 1) * DG_WIDTH + DG_WIDTH div 2 - 4;
				var yy = j * DG_HEIGHT + DG_HEIGHT div 2;
				var offset = irandom_range(-1,1);
				
				for(var xx = x1; xx <= x2; xx++){
					if(real_solid[# xx, yy + offset + 1] == cellular.ImmutableWall) ds_grid_set(real_solid, xx, yy + offset + 1, cellular.WallReal);
					if(real_solid[# xx, yy + offset - 1] == cellular.ImmutableWall) ds_grid_set(real_solid, xx, yy + offset - 1, cellular.WallReal);
					ds_grid_set(real_solid, xx, yy + offset, cellular.MutableGround);
				}
					
				ds_grid_set_region(real_solid, x1, yy + offset, x2, yy + offset, cellular.ImmutableGround);
			}
			/*if(_door[# i, j] div 1000 % 10 == 1){ // up door
				var xx = i * DG_WIDTH + DG_WIDTH div 2;
				var y1 = j * DG_HEIGHT;
				var y2 = j * DG_HEIGHT;
				var maxR = min(_WH_map[i][j][1], _WH_map[i + 1][j][1]);
				var offset = irandom(maxR) - maxR div 2;
					
				ds_grid_set_region(_real_map, xx + offset, y1, xx + offset, y2, cellular.ImmutableGround);
				_door_check[# i, j] = true;
				_door_check[# i, j + 1] = true;
			}*/
		}
	}
}




for(var _i = 0; _i < real_width; _i++){
	for(var _j = 0; _j < real_height; _j++){
		if(real_solid[#_i,_j] == cellular.ImmutableGround)
			real_solid[#_i,_j] = cellular.MutableGround;
		if(real_solid[#_i,_j] == cellular.ImmutableWall)
			real_solid[#_i,_j] = cellular.MutableWall;
	}
}

var map = real_solid;
for(var i = 0; i < real_width; i++){
	for(var j = 0; j < real_height; j++){
		var rand = irandom(6);
		var _tile_data = tile_set_index(TileSet_desert,16 + rand);
			
		tilemap_set_at_pixel(layer_tilemap_get_id("Tiles_2"), _tile_data, i* CELL_WIDTH, j * CELL_HEIGHT);
		
		
		if(abs(map[#i, j]) == cellular.MutableWall){
			//var ind = Scr_bit_masking_16(map,i,j,real_width,real_height,cellular.MutableWall);
			var ind = Scr_bit_masking_47(map,i,j,real_width,real_height,cellular.MutableWall);
			
			if(random(100) <= 30){
				with(instance_create_layer(i * CELL_WIDTH + CELL_WIDTH / 2 + random_range(-10, 10), j * CELL_HEIGHT + CELL_HEIGHT / 2 + random_range(-10, 10), "sort_start", Obj_desert_deco)){		
					switch(irandom(5)){
						case 0 :
							sprite_index = Spr_desert_tree1A;
							break;
						case 1 :
							sprite_index = Spr_desert_tree1B;
							break;
						case 2 :
							sprite_index = Spr_desert_tree2A;
							break;
						case 3 :
							sprite_index = Spr_desert_tree2B;
							break;
						case 4 :
							sprite_index = Spr_desert_tree3A;
							break;
						case 5 :
							sprite_index = Spr_desert_tree3B;
							break;
					}
					image_speed = 1.0;
				}
			}
			
			var tile_data = tile_set_index(TileSet_desert47,ind);
			real_mini_map[i][j] = ind;
			if(map[#i, j] == cellular.WallReal){
				with(instance_create_layer(i * CELL_WIDTH, j * CELL_HEIGHT, "sort_start",Obj_wall)){
					image_index = ind;
				}
			}
			tilemap_set_at_pixel(layer_tilemap_get_id("Tiles_1"), tile_data, i* CELL_WIDTH, j * CELL_HEIGHT);
		}
	}
}

var _map = real_ground;
for(var i = 0; i < real_width * 2; i++){
	for(var j = 0; j < real_height * 2; j++){
		/*if(_map[#i, j] == 2){
			var tile_data = Scr_auto_tiling_16(_map,i,j,real_width,real_height,TileSet_desert_water, 2);
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
		/*}
		if(_map[#i, j] == 0 || _map[#i, j] == -1){
			real_mini_water[i][j] = 0;
			var randX = i * CELL_WIDTH / 2 + CELL_WIDTH / 4;
			var randY = j * CELL_HEIGHT / 2 + CELL_HEIGHT / 4;
			if(map[# i div 2 , j div 2] == 0 && !instance_place(randX,randY,Obj_wall)){
				if(random(1) <= 0.03){
					//Scr_sprite_depth_sorting_index(Spr_desert_deco, randX, randY, irandom(35));
					with(instance_create_layer(randX,randY,"sort_start",Obj_deco_instance)){
						sprite_index = Spr_desert_deco;
						image_index = irandom(35);
					}
				}
			}
		}*/
		real_mini_water[i][j] = 0;
		if(_map[#i, j] >= 100){
			var tile_data = tile_set_index(TileSet_ground_deco, _map[# i, j] - 100);
			tilemap_set_at_pixel(layer_tilemap_get_id("Tiles_ground"), tile_data, i * CELL_WIDTH / 2, j * CELL_HEIGHT / 2);
		} else if(_map[# i, j] > 0){
			//show_debug_message("water" + string( _map[# i, j]));
			var tile_data = tile_set_index(TileSet_desert_water, _map[# i, j]);
			tilemap_set_at_pixel(layer_tilemap_get_id("Tiles_water"), tile_data, i * CELL_WIDTH / 2, j * CELL_HEIGHT / 2);
			real_mini_water[i][j] = _map[# i, j];
			with(instance_create_layer(i * CELL_WIDTH / 2, j * CELL_HEIGHT / 2, "sort_start",Obj_wall32)){
				image_index = _map[# i, j];
				penetrate = true;
				solid = false;
			}
		}
	}
}



instance_create_layer(0,0, "controller",Obj_controller);

instance_create_layer((DG_WIDTH * 4 + DG_WIDTH / 2) * CELL_WIDTH, (DG_HEIGHT * 3 + DG_HEIGHT / 2 + 2) * CELL_HEIGHT, "sort_start", Obj_chr);
instance_create_layer((DG_WIDTH * 4 + DG_WIDTH / 2) * CELL_WIDTH, (DG_HEIGHT * 3 + DG_HEIGHT / 2) * CELL_HEIGHT, "sort_start", Obj_npc);
//instance_create_layer((DG_WIDTH * 4 + DG_WIDTH / 2) * CELL_WIDTH, (DG_HEIGHT * 3 + DG_HEIGHT / 2) * CELL_HEIGHT, "shader", Obj_bloom_shader);
//instance_create_layer((DG_WIDTH * 4 + DG_WIDTH / 2) * CELL_WIDTH, (DG_HEIGHT * 3 + DG_HEIGHT / 2) * CELL_HEIGHT + 64, "sort_start", Obj_itemTable);
//instance_create_layer((DG_WIDTH * 4 + DG_WIDTH / 2) * CELL_WIDTH, (DG_HEIGHT * 3 + DG_HEIGHT / 2) * CELL_HEIGHT + 64, "sort_start", Obj_itemTable);
//instance_create_layer((DG_WIDTH * 4 + DG_WIDTH / 2) * CELL_WIDTH, (DG_HEIGHT * 3 + DG_HEIGHT / 2) * CELL_HEIGHT + 64, "sort_start", Obj_itemTable);
//instance_create_layer((DG_WIDTH * 4 + DG_WIDTH / 2) * CELL_WIDTH, (DG_HEIGHT * 3 + DG_HEIGHT / 2) * CELL_HEIGHT + 64, "sort_start", Obj_itemTable);
//instance_create_layer((DG_WIDTH * 4 + DG_WIDTH / 2) * CELL_WIDTH, (DG_HEIGHT * 3 + DG_HEIGHT / 2) * CELL_HEIGHT + 64, "sort_start", Obj_barrel);
//instance_create_layer((DG_WIDTH * 4 + DG_WIDTH / 2) * CELL_WIDTH, (DG_HEIGHT * 3 + DG_HEIGHT / 2) * CELL_HEIGHT + 64, "sort_start", Obj_itemTable);
instance_create_layer((DG_WIDTH * 4 + DG_WIDTH / 2) * CELL_WIDTH, (DG_HEIGHT * 3 + DG_HEIGHT / 2) * CELL_HEIGHT, "pause", Obj_pause);
//instance_create_layer((DG_WIDTH *  + DG_WIDTH / 2) * CELL_WIDTH, (DG_HEIGHT * 3 + DG_HEIGHT / 2) * CELL_HEIGHT, "Instances", Obj_enemy_contextMap);
instance_create_layer((DG_WIDTH * 4 + DG_WIDTH / 2) * CELL_WIDTH, (DG_HEIGHT * 3 + DG_HEIGHT / 2) * CELL_HEIGHT, "Instances", Obj_enemy_flower);
instance_create_layer((DG_WIDTH * 4 + DG_WIDTH / 2) * CELL_WIDTH, (DG_HEIGHT * 3 + DG_HEIGHT / 2) * CELL_HEIGHT + 64, "Instances", Obj_enemy_flower);
instance_create_layer((DG_WIDTH * 4 + DG_WIDTH / 2) * CELL_WIDTH + 64, (DG_HEIGHT * 3 + DG_HEIGHT / 2) * CELL_HEIGHT, "Instances", Obj_enemy_flower);
instance_create_layer((DG_WIDTH * 4 + DG_WIDTH / 2) * CELL_WIDTH + 64, (DG_HEIGHT * 3 + DG_HEIGHT / 2) * CELL_HEIGHT + 64, "Instances", Obj_enemy_flower);
//instance_create_layer((DG_WIDTH * 4 + DG_WIDTH / 2) * CELL_WIDTH, (DG_HEIGHT * 3 + DG_HEIGHT / 2) * CELL_HEIGHT + 64, "Instances", Obj_boss);
//instance_create_layer((DG_WIDTH * 4 + DG_WIDTH / 2) * CELL_WIDTH + 64, (DG_HEIGHT * 3 + DG_HEIGHT / 2) * CELL_HEIGHT, "Instances", Obj_enemy_contextMap);
//instance_create_layer((DG_WIDTH * 4 + DG_WIDTH / 2) * CELL_WIDTH + 64, (DG_HEIGHT * 3 + DG_HEIGHT / 2) * CELL_HEIGHT + 64, "sort_start", Obj_enemy_perlinNoise);
Obj_camera.x = (DG_WIDTH * 4 + DG_WIDTH / 2) * CELL_WIDTH;
Obj_camera.y = (DG_HEIGHT * 3 + DG_HEIGHT / 2) * CELL_HEIGHT;