// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Scr_girl_FSM(){

}

function Scr_girl_idle(){
	if(state_new){
		sprite_index = Spr_girl_idle;
		image_index = 0;
	}
	if(!instance_exists(Obj_cutscene) && !instance_exists(Obj_wokialog)){
		if(point_distance(x,y,targetX,targetY) > 20){
			Scr_SM_switch("MOVE");	
		}
	}
}

function Scr_girl_move(){
	if(state_new){
		sprite_index = Spr_girl_move;
		image_index = 0;
	}
	if(!instance_exists(Obj_cutscene) && !instance_exists(Obj_wokialog)){
		if(point_distance(x,y,targetX,targetY) <= 20){
			Scr_SM_switch("MOVETOSTOP");	
		}
		mp_potential_step(targetX, targetY, spd, false);
	}
}

function Scr_girl_move_to_stop(){
	if(state_new){
		sprite_index = Spr_girl_move_to_stop;
		image_index = 2;
	}
	if(image_index > image_number - 1){
		Scr_SM_switch("IDLE");	
	}
}

function Scr_girl_crouching(){
	if(state_new){
		sprite_index = Spr_girl_crouch;
		image_index = 0;
	}
	if(image_index > image_number - 1){
		Scr_SM_switch("CROUCH");	
	}
}

function Scr_girl_crouch(){
	if(state_new){
		sprite_index = Spr_girl_crouch;
		image_index = 6;
	}
}