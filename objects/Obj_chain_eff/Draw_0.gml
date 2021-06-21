/// @description Insert description here
// You can write your code in this editor
var px = 0;
var py = 0;
var tx = 0;
var ty = 0;
if(target != -1 && instance_exists(target)){
	tx = target.x;
	ty = target.y;
} else{
	tx = tarX;
	ty = tarY;
}
if(par != -1 && instance_exists(par)){
	px = par.x;
	py = par.y;
} else{
	px = parX;
	py = parY;
}
var dir = point_direction(px,py,tx,ty);
var dist = point_distance(px,py,tx,ty);
draw_sprite_ext(Spr_chain_burst1,image_index,px,py,1.0,1.0,dir,c_white,1.0);
draw_sprite_ext(Spr_chain_burst1,image_index,tx,ty,1.0,1.0,dir,c_white,1.0);
draw_sprite_ext(Spr_chain_burst2,image_index,px,py,1.0,1.0,dir,c_white,1.0);
draw_sprite_ext(Spr_chain_burst2,image_index,tx,ty,1.0,1.0,dir,c_white,1.0);
/*var cnt = dist div len;
var ratio = (dist - cnt * len) / len;
//if(cnt == 0) draw_sprite_ext(Spr_chain_mid,image_index,par.x,par.y,1.0,1.0,dir,c_white,1.0);
for(var i = 0; i < cnt; i++){
	draw_sprite_ext(Spr_chain_mid,image_index,px + lengthdir_x((dist / cnt) * i, dir),py + lengthdir_y((dist / cnt)* i, dir),1.0,1.0,dir,c_white,1.0);
}
if(cnt != 0){
	draw_sprite_ext(Spr_chain_mid,image_index,tx + lengthdir_x(len, dir + 180),ty + lengthdir_y(len, dir + 180),1.0,1.0,dir,c_white,1.0);
} else{
	draw_sprite_ext(Spr_chain_mid,image_index,px,py,ratio,1.0,dir,c_white,1.0);
}*/
Scr_draw_sprite_part_angle(Spr_chain_mid,image_index,0,0,dist,72,px,py,dir);
//draw_sprite_ext(Spr_chain_mid,image_index,px,py,1,1,dir,c_white,1);
//Scr_draw_lightning(par.x,par.y,target.x,target.y,false,c_white);