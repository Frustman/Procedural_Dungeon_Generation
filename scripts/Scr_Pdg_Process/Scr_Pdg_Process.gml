/// @function Scr_Pdg_Process(map, width, height)
/// @param {ds_type_grid} map map to CellAutomata
/// @param {real} width The width of Dungeon
/// @param {real} height The height of Dungeon

function Scr_Pdg_Process(map, width, height){
	for(var _i = 1; _i < width - 1; _i++){
		for(var _j = 1; _j < height - 1; _j++){
			neighbor = Scr_Pdg_CountNeighbor(map, _i, _j);
			if(ds_grid_get(map, _i, _j) == 0){
				if(neighbor == 6 || neighbor == 7 || neighbor == 8){
				ds_grid_set(map, _i, _j, 1);
				}
			} else{
				if(neighbor < 4){
				ds_grid_set(map, _i, _j, 0);
				}
			}
		}
	}
}