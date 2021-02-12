/// @function Scr_Pdg_Init(width, height)
/// @param {real} height The height of Dungeon to make
/// @param {real} width The width of Dungeon to make

#macro CELL_WIDTH 32
#macro CELL_HEIGHT 32

function Scr_Pdg_Init(width, height){
	map = ds_grid_create(width, height); // create grid map [width, height]
	for(var i = 0; i < width; i++){
		for(var j = 0; j < height; j++){ // 45% = alive cell, others = dead cell
			if(i == 0 || i == width - 1 || j == 0 || j == height - 1){ // border cells are alive
				ds_grid_set(map, i, j, 1);
			}
			else if(random(100) < 50){
				ds_grid_set(map, i, j, 1);
			} else{
				ds_grid_set(map, i, j, 0);
			}
		}
	}
	
	return map;
}