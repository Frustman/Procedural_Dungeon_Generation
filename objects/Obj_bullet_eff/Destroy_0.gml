/// @description Insert description here
// You can write your code in this editor
with(instance_create_layer(x,y,"sort_start",Obj_bullet_hit_eff)){
	if(other.crit) sprite_index = (irandom(1)) ? Spr_hitmsk3 : Spr_hitmsk4;	
	else sprite_index = (irandom(1)) ? Spr_hitmsk1 : Spr_hitmsk2;
	
	image_angle = other.image_angle;
}