// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Scr_update_depth(xpos, ypos){
	var cur_room = Scr_get_room_pos(xpos, ypos);
	layer = global.depth_grid[# 0, (ypos - (cur_room % 10) * Obj_mapGenerator.dg_height * CELL_HEIGHT) div 1];
}