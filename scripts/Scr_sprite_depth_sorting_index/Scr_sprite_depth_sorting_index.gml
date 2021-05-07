// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Scr_sprite_depth_sorting_index(sprite, xpos, ypos, index){
	var cur_room = Scr_get_room_pos(xpos, ypos);
	var ls = layer_sprite_create(global.deco_grid[# 0, (ypos - (cur_room % 10) * DG_HEIGHT * CELL_HEIGHT) div 1], xpos, ypos, sprite);
	layer_sprite_index(ls, index);
	layer_sprite_speed(ls, 0);
	return ls;
}