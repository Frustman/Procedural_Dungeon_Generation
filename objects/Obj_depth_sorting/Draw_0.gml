/// @description Insert description here
// You can write your code in this editor
if(instance_exists(Obj_chr)){
	var cur_room = Scr_get_room_pos(Obj_chr.x,Obj_chr.y);
	chrY = (Obj_chr.y - (cur_room % 10) * DG_HEIGHT * CELL_HEIGHT) div 1;

	/*for(var i = 0; i < room_H; i++){
		layer_script_begin(global.deco_grid[#0, i], Scr_layer_set_alpha);
		layer_shader(global.deco_grid[#0, i], Sha_set_alpha);
		layer_script_end(global.deco_grid[#0, i],Scr_layer_end);
	}*/
}