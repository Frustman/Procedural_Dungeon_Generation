/// @description Insert description here
// You can write your code in this editor

#macro CELL_WIDTH 64
#macro CELL_HEIGHT 64

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
instance_create_layer((dg_width * 4 + dg_width / 2) * CELL_WIDTH, (dg_height * 3 + dg_height / 2) * CELL_HEIGHT, "Instances", Obj_E_apple);
instance_create_layer((dg_width * 4 + dg_width / 2) * CELL_WIDTH, (dg_height * 3 + dg_height / 2) * CELL_HEIGHT, "Instances", Obj_camera);