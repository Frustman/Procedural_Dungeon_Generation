/// @description Insert description here
// You can write your code in this editor
chr_diff = point_distance(Obj_chr.x, Obj_chr.y, x, y);
for(var i = -1;i < 2; i++){
	for(var j = -1 ; j < 2; j++){
		in_sight = collision_line(x + sprite_width * i,y + sprite_height * j,Obj_chr.x,Obj_chr.y,Obj_wall,true,false) == noone;
		if(in_sight) break;
	}
	if(in_sight) break;
}