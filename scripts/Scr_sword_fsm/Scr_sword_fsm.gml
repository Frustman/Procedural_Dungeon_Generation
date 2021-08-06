// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Scr_sword_fsm(){

}

function Scr_sword_idle(){
	
	if(state_new){
		trail = false;
		while(path_get_number(p_trail_i)){
			path_delete_point(p_trail_i, 0);	
		}
		while(path_get_number(p_trail_o)){
			path_delete_point(p_trail_o, 0);	
		}
	}
	
	var xpos = room_width / 2;
	var ypos = room_height / 2;
	
	mouse_dir = point_direction(xpos, ypos, mouse_x, mouse_y);

	hand_dir = mouse_dir - 90;

	sword_dir = mouse_dir - 150;
	handRadiusW = 10;
	handRadiusH = 4;
	
}

function Scr_sword_attack(){
	var anim_length = 60;
	if(state_new){
		var xpos = room_width / 2;
		var ypos = room_height / 2;

		var xx = xpos + lengthdir_x(handRadiusW, hand_dir);
		var yy = ypos + 6 + lengthdir_y(handRadiusH, hand_dir);

		var dx = lengthdir_x(length, sword_dir - 90);
		var dy = lengthdir_y(length, sword_dir - 90);
		
		path_add_point(p_trail_o, xx, yy, 100);
		path_add_point(p_trail_i, xx + dx, yy + dy, 100);
		
		state_var[0] = [mouse_dir, hand_dir, sword_dir];	// 공격 시작 위치
		state_var[1] = 0;			// anim 프레임
		
		trail = true;
	}
	
	state_var[1]++;
	
	var ac_channel = animcurve_get_channel(ac_sword_exponential, 0);
	var ac_hand = animcurve_get_channel(ac_sword_exponential, 1);
	
	handRadiusW = 10 + animcurve_channel_evaluate(ac_hand, state_var[1] / anim_length) * 10;
	handRadiusH = 4 + animcurve_channel_evaluate(ac_hand, state_var[1] / anim_length) * 4;
	
	sword_dir = state_var[0][2] + animcurve_channel_evaluate(ac_channel, state_var[1] / anim_length) * 150;
	hand_dir = state_var[0][1] + animcurve_channel_evaluate(ac_channel, state_var[1] / anim_length) * 180;
	
	if(state_var[1] == anim_length){
		Scr_SM_switch("IDLE");
		state_var[1] = 0;
		trail = false;
	}
}