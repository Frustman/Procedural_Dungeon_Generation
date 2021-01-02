/// @description Insert description here
// You can write your code in this editor
for(var i = 0; i < 9; i++){
	for(var j = 0; j < 8; j++){
		//draw_text(i * 40, j * 40, door_grid[# i, j]);
	}
}
if(instance_exists(Obj_chr))
	draw_text(0,30,Scr_get_room_pos(Obj_chr.x, Obj_chr.y));