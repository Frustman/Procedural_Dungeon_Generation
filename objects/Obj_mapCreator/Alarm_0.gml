/// @description Insert description here


var map = Obj_map_bsp.geo_map;
for(var i = 0; i < Obj_map_bsp.dungeon_width; i++){
	for(var j = 0; j < Obj_map_bsp.dungeon_height; j++){
		if(map[#i, j] == 0){
			if(i != 0 && i != Obj_map_bsp.dungeon_width - 1 && j != 0 && j != Obj_map_bsp.dungeon_height - 1){
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
			
				var tile_data = tile_set_index(TileSet_wall,index + 1);
		
			} else{
				var tile_data = tile_set_index(TileSet_wall,46);
			}
			instance_create_layer(i * CELL_WIDTH, j * CELL_HEIGHT, layer_get_id("wall"),Obj_wall);
			tilemap_set_at_pixel(layer_tilemap_get_id("Tiles_1"), tile_data, i* CELL_WIDTH, j * CELL_HEIGHT);
		} else {
			var top = (map[#i, j-1] == 1) ? 1 : 0;
			var left = (map[#i-1, j] == 1) ? 1 : 0;
			var bottom = (map[#i, j+1] == 1) ? 1 : 0;
			var right = (map[#i+1, j] == 1) ? 1 : 0;
			var top_left = (map[#i-1, j-1] == 1 && top && left) ? 1 : 0;
			var top_right = (map[#i+1, j-1] == 1 && top && right) ? 1 : 0;
			var bottom_left = (map[#i-1, j+1] == 1 && bottom && left) ? 1 : 0;
			var bottom_right = (map[#i+1, j+1] == 1 && bottom && right) ? 1 : 0;
		
			var dir = 1*top_left + 2*top + 4*top_right + 8*left + 16*right + 32*bottom_left + 64*bottom + 128*bottom_right;
			var index = Scr_dir_to_index(dir);
			
			var tile_data = tile_set_index(TileSet_ground,index + 1);
			
			tilemap_set_at_pixel(layer_tilemap_get_id("Tiles_2"), tile_data, i* CELL_WIDTH, j * CELL_HEIGHT);
		}
	}
}