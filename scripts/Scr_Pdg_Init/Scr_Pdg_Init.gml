/// @function Scr_Pdg_Init(width, height)
/// @param {real} height The height of Dungeon to make
/// @param {real} width The width of Dungeon to make

#macro CELL_WIDTH 64
#macro CELL_HEIGHT 64

enum cellular{
	MutableGround,
	MutableWall,
	ImmutableGround,
	ImmutableWall
};

function Scr_Pdg_Init(width, height){
	var map = ds_grid_create(width, height); // create grid map [width, height]
	ds_grid_set_region(map,0,0,width,height,cellular.MutableWall);
	
	var centerX = width div 2;
	var centerY = width div 2 - 2;
	
	var cw = 7;
	var ch = 5;
	
	for(var i = 0; i < width; i++){
		for(var j = 0; j < height; j++){ 
			/*if((i - centerX)*(i - centerX) / cw / cw + (j - centerY)*(j - centerY) / ch / ch <= 1){
				if(random(100) < 55){
					ds_grid_set(map, i, j, cellular.MutableGround);
				}
			} else{
				ds_grid_set(map, i, j, cellular.MutableWall);
			}
			if((i - centerX)*(i - centerX) + (j - centerY)*(j - centerY) <= 16)
				ds_grid_set(map, i, j, cellular.ImmutableGround);
			/*if( (i - centerX) * (i - centerX) + (j - centerY)*(j - centerY) <= 25){	
				ds_grid_set(map, i, j, 0);
			}*/
			if(i <= 1 || j <= 1 || i >= width - 2 || j >= height - 2){
				ds_grid_set(map,i,j,cellular.MutableWall);	
			} else if(random(100) < 55){
				ds_grid_set(map,i,j,cellular.MutableGround);	
			}
			
			if((i - centerX)*(i - centerX) + (j - centerY)*(j - centerY) <= 16)
				ds_grid_set(map, i, j, cellular.ImmutableGround);
		}
	}
	
	return map;
}