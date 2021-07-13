// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Scr_FA_attack(){
	if(state_new){
		sprite_index = FA_sprite_atk_ready;
		FA_speed = 0;
		motion_set(FA_angle, FA_speed);
	}
	
	if(image_index > image_number - 1){
		with(instance_create_layer(x,y,"sort_start",Obj_projectile_slime)){
			motion_set(point_direction(x,y,Obj_chr.x,Obj_chr.y + 12),2);
			dir = point_direction(x,y,Obj_chr.x,Obj_chr.y + 12);
			image_angle = point_direction(x,y,Obj_chr.x,Obj_chr.y + 12);
		}
		sprite_index = FA_sprite_atk;
		Scr_SM_switch("MOVE");
	}
}