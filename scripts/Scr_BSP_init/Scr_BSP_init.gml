/// @function Scr_BSP_init(width, height)
/// @param {real} width width to make a room
/// @param {real} height height to make a room

function Scr_BSP_init(width, height){
	map = ds_grid_create(width, height);
	ds_grid_set_region(map, 0, 0, width - 1, height - 1, 1);
	
	
}