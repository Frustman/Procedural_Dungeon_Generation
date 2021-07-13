// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Scr_FA_move(){
	
	if(point_distance(FA_center_x, FA_center_y, x, y) >= FA_center_radius){
		FA_angle = lerp(FA_angle,point_direction(x,y,FA_center_x,FA_center_y),0.1);
	}
	FA_angle += Scr_perlin_noise_1d(seed + current_time / 100) * 2;
	
	if(FA_stop == false){
		FA_speed = lerp(FA_speed, FA_move_speed, random(0.05) + 0.07);
		motion_set(FA_angle, FA_move_speed);
	} else {
		FA_speed = 0;
		motion_set(FA_angle, FA_speed);	
	}
	
	if(instance_place(x + lengthdir_x(10, FA_angle), y + lengthdir_y(10, FA_angle),Obj_wall)){
		FA_angle = lerp(FA_angle,point_direction(x,y,FA_center_x,FA_center_y), 0.1);
	}
	
	if(player_dist <= FA_attack_radius){
		state_var[0]++;
	}
	
	
	if(lengthdir_x(1,FA_angle) < 0){
		xscale *= (sign(xscale) == 1) ? 1 : -1;
	} else {
		xscale *= (sign(xscale) == 1) ? -1 : 1;
	}
	
	if(state_var[0] > FA_attack_delay){
		state_var[0] = 0;
		Scr_SM_switch("ATTACK");
	}
}