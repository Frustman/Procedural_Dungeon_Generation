/// @description Insert description here
// You can write your code in this editor
with(instance_create_layer(x,y,"sort_start",Obj_bullet_hit_eff)){
	if(other.crit) sprite_index = (irandom(1)) ? Spr_hitmsk3 : Spr_hitmsk4;	
	else sprite_index = (irandom(1)) ? Spr_hitmsk1 : Spr_hitmsk2;
	
	image_angle = other.image_angle;
}


with(instance_create_layer(x, y,"gui",Obj_catridge_eff)){
	if(lengthdir_x(1,other.image_angle) > 0) dir = -1;
	for(var i = 0; i < cat_cnt; i++){
		var yy = lengthdir_y(1,other.image_angle);
		cat_dir[i] *= dir;
		cat_vspeed_st[i] = -6 + random(8) - random(6) * yy;
	}
}