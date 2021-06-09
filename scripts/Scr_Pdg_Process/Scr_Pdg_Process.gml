/// @function Scr_Pdg_Process(map, width, height)
/// @param {ds_type_grid} map map to CellAutomata
/// @param {real} width The width of Dungeon
/// @param {real} height The height of Dungeon

function Scr_Pdg_Process(map, width, height){
	var newmap = ds_grid_create(width,height);
	ds_grid_set_grid_region(newmap,map,0,0,width,height,0,0);
	for(var _i = 1; _i < width - 1; _i++){
		for(var _j = 1; _j < height - 1; _j++){
			neighbor = Scr_Pdg_CountNeighbor(map, _i, _j);
			/*if(map[#_i, _j] == cellular.MutableWall && neighbor > 5){
				ds_grid_set(newmap, _i, _j, cellular.MutableGround);
			}
			if(map[#_i, _j] == cellular.MutableGround && neighbor < 3){
				ds_grid_set(newmap, _i, _j, cellular.MutableWall);
			}*/
			if(map[#_i, _j] == cellular.MutableGround && neighbor >= 4){
				ds_grid_set(newmap, _i, _j, cellular.MutableGround);
			} else if(map[#_i, _j] == cellular.MutableWall && neighbor >= 5){
				ds_grid_set(newmap, _i, _j, cellular.MutableGround);
			} else if(map[#_i, _j] == cellular.MutableWall || map[#_i, _j] == cellular.MutableGround) ds_grid_set(newmap, _i, _j, cellular.MutableWall);
		}
	}
	ds_grid_set_grid_region(map,newmap,0,0,width,height,0,0);
}