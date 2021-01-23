/// @description Insert description here
// You can write your code in this editor
/*draw_sprite(Spr_map_frame,0,0,0);
if(instance_exists(Obj_chr)){
	for(var i = 0; i < 9; i++){
		for(var j = 0; j < 8; j++){
			if(miniMap_grid[#i, j] == 1){
				if(i * 10 + j == Scr_get_room_pos(Obj_chr.x,Obj_chr.y))
					draw_sprite(Spr_mini_map,3,8 + 16 * i, 8 + 16 * j);
				else
					draw_sprite(Spr_mini_map,0,8 + 16 * i, 8 + 16 * j);
			}
			if(miniMap_grid[#i, j] == 2){
				if(i * 10 + j == Scr_get_room_pos(Obj_chr.x,Obj_chr.y))
					draw_sprite(Spr_mini_map,5,8 + 16 * i, 8 + 16 * j);
				else
					draw_sprite(Spr_mini_map,2,8 + 16 * i, 8 + 16 * j);
			}
			if(miniMap_grid[#i, j] == 3){
				if(i * 10 + j == Scr_get_room_pos(Obj_chr.x,Obj_chr.y))
					draw_sprite(Spr_mini_map,4,8 + 16 * i, 8 + 16 * j);
				else
					draw_sprite(Spr_mini_map,1,8 + 16 * i, 8 + 16 * j);
			}
		}
	}
}*/

for(var i = 0; i < 9; i++){
	for(var j = 0; j < 8; j++){
		draw_text(i * 10, j * 10, map_grid[#i,j]);
	}
}