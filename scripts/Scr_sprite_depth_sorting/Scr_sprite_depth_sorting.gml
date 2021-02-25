// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Scr_sprite_depth_sorting(sprite, xpos, ypos){
	var cur_room = Scr_get_room_pos(xpos, ypos);
	layer_sprite_create(global.depth_grid[# 0, (ypos - (cur_room % 10) * Obj_mapGenerator.dg_height * CELL_HEIGHT) div 1], xpos, ypos, sprite);
}