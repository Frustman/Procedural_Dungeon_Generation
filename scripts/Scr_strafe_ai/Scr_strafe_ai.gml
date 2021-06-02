// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
enum ai_state{
	stop,
	wandering,
	chase,
	strafe,
	backward,
	attackready,
	attack
};

enum state_machine{
	wander,
	fight
};

function Scr_check_state_ai(range, state){
	if(x >= screenX && x <= screenX + screenW && y >= screenY && screenY + screenH){
		if(state != ai_state.backward){
			if(point_distance(x,y,Obj_chr.x,Obj_chr.y) <= range){
				return ai_state.chase;
			} else return ai_state.strafe;
		}
	}
}

function Scr_strafe_ai(state, speed){
	if(state == ai_state.chase){
		var dir = point_direction(x,y,Obj_chr.x,Obj_chr.y);
		var dx = lengthdir_x(speed, dir + 90);
		var dy = lengthdir_y(speed, dir + 90);
		
		Scr_force_update([dx,dy]);
	}
}