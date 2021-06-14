// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Scr_get_map_template(_solid_map, _ground_map, _inst_list, _room){
	layer_set_target_room(_room);
	var lay_solid = layer_get_id("layer_solid");
	var map_solid = layer_tilemap_get_id(lay_solid);
	var index, data;
	for(var i = 0; i < DG_WIDTH; i++){
		for(var j = 0; j < DG_HEIGHT; j++){
			data = tilemap_get_at_pixel(map_solid, i * CELL_WIDTH + CELL_WIDTH / 2, j * CELL_HEIGHT + CELL_HEIGHT / 2);
			index = tile_get_index(data);
			if(index == 0) ds_grid_set(_solid_map, i, j, cellular.ImmutableGround);
			else ds_grid_set(_solid_map, i, j, cellular.ImmutableWall);
		}
	}
	for(var i = 0; i < DG_WIDTH; i++){
		for(var j = 0; j < DG_HEIGHT; j++){
			if(_solid_map[# i, j] == cellular.ImmutableWall && Scr_Pdg_CountNeighbor(_solid_map, i, j) != 0){
				ds_grid_set(_solid_map, i, j, cellular.WallReal);	
			}
		}
	}
	
	var lay_water = layer_get_id("layer_water");
	var map_water = layer_tilemap_get_id(lay_water);
	var lay_ground = layer_get_id("layer_ground");
	var map_ground = layer_tilemap_get_id(lay_ground);
	
	for(var i = 0; i < DG_WIDTH * 2; i++){
		for(var j = 0; j < DG_HEIGHT * 2; j++){
			data = tilemap_get_at_pixel(map_water, i * CELL_WIDTH / 2 + CELL_WIDTH / 4, j * CELL_HEIGHT / 2 + CELL_HEIGHT / 4);
			index = tile_get_index(data);
			if(index != -1 && index != 0) ds_grid_set(_ground_map, i, j, index);
			
			data = tilemap_get_at_pixel(map_ground, i * CELL_WIDTH / 2 + CELL_WIDTH / 4, j * CELL_HEIGHT / 2 + CELL_HEIGHT / 4);
			index = tile_get_index(data);
			if(index != -1 && index != 0) ds_grid_set(_ground_map, i, j, index + 100);
		}
	}
	var _list = layer_get_all_elements(layer_get_id("Asset"));
	for(var i = 0; i < array_length(_list); i++){
		if(layer_get_element_type(_list[i]) == layerelementtype_sprite){
			var data = ds_map_create();
			ds_map_add(data, "x", layer_sprite_get_x(_list[i]));
			ds_map_add(data, "y", layer_sprite_get_y(_list[i]));
			ds_map_add(data, "sprite_index", layer_sprite_get_sprite(_list[i]));
			ds_map_add(data, "image_index", layer_sprite_get_index(_list[i]));
			ds_map_add(data, "image_speed", layer_sprite_get_speed(_list[i]));
			ds_list_add(_inst_list, data);
		}
	}
	layer_reset_target_room();
}