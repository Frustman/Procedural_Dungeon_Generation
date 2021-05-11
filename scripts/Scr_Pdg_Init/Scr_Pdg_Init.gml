/// @function Scr_Pdg_Init(width, height)
/// @param {real} height The height of Dungeon to make
/// @param {real} width The width of Dungeon to make

#macro CELL_WIDTH 64
#macro CELL_HEIGHT 64

function Scr_Pdg_Init(width, height){
	map = ds_grid_create(width, height); // create grid map [width, height]
	
	var centerX = width div 2;
	var centerY = width div 2 - 2;
	
	var cw = DG_WIDTH div 3;
	var ch = DG_HEIGHT div 3;
	
	for(var i = 0; i < width; i++){
		for(var j = 0; j < height; j++){ 
			if((i - centerX)*(i - centerX) / cw / cw + (j - centerY)*(j - centerY) / ch / ch >= 1){
				ds_grid_set(map, i, j, 1);
			}
			else if(random(100) < 45){
				ds_grid_set(map, i, j, 1);
			} else{
				ds_grid_set(map, i, j, 0);
			}
			if( (i - centerX) * (i - centerX) + (j - centerY)*(j - centerY) <= 25){	
				ds_grid_set(map, i, j, 0);
			}
		}
	}
	
	return map;
}