/// @description Insert description here
// You can write your code in this editor
if(target != -1 && par != -1 && instance_exists(target) && instance_exists(par)){
	var dir = point_direction(par.x,par.y,target.x,target.y);
	var dist = point_distance(par.x,par.y,target.x,target.y);
	draw_sprite_ext(Spr_chain_burst1,image_index,par.x,par.y,1.0,1.0,dir,c_white,1.0);
	draw_sprite_ext(Spr_chain_burst1,image_index,target.x,target.y,1.0,1.0,dir,c_white,1.0);
	draw_sprite_ext(Spr_chain_burst2,image_index,par.x,par.y,1.0,1.0,dir,c_white,1.0);
	draw_sprite_ext(Spr_chain_burst2,image_index,target.x,target.y,1.0,1.0,dir,c_white,1.0);
	var cnt = dist div len;
	var ratio = (dist - cnt * len) / len;
	//if(cnt == 0) draw_sprite_ext(Spr_chain_mid,image_index,par.x,par.y,1.0,1.0,dir,c_white,1.0);
	for(var i = 0; i < cnt; i++){
		draw_sprite_ext(Spr_chain_mid,image_index,par.x + lengthdir_x((dist / cnt) * i, dir),par.y + lengthdir_y((dist / cnt)* i, dir),1.0,1.0,dir,c_white,1.0);
	}
	if(cnt != 0){
		draw_sprite_ext(Spr_chain_mid,image_index,target.x + lengthdir_x(len, dir + 180),target.y + lengthdir_y(len, dir + 180),1.0,1.0,dir,c_white,1.0);
	} else{
		draw_sprite_ext(Spr_chain_mid,image_index,par.x,par.y,ratio,1.0,dir,c_white,1.0);
	}
	//Scr_draw_lightning(par.x,par.y,target.x,target.y,false,c_white);
}