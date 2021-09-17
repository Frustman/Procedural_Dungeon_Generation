// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function Scr_place_meeting_3d(_x, _y, _obj){
	var inst = instance_place(_x, _y, _obj);
	
	if((inst == noone) || (z <= inst.z || zHeight >= inst.z)) return false
	return true;
}

function Scr_force_update(force){
	var fx = force[0];
	var fy = force[1];
	
	if(!Scr_place_meeting_3d(x + fx, y, Obj_wall)){
		x += fx * Obj_valueContainer.game_timeScale;
	} else{
		while(!Scr_place_meeting_3d(x + sign(fx) / 10, y,Obj_wall)){
			x += sign(fx) / 10;
		}
	}
	if(!Scr_place_meeting_3d(x, y + fy, Obj_wall)){
		y += fy * Obj_valueContainer.game_timeScale;
	} else{
		while(!Scr_place_meeting_3d(x, y + sign(fy) / 10,Obj_wall)){
			y += sign(fy) / 10;
		}
	}
	
	
	if (Scr_place_meeting_3d(ceil(x),y,Obj_wall)){
	 x = floor(x);
	}
	if (Scr_place_meeting_3d(x,ceil(y),Obj_wall)){
	 y = floor(y);
	}
	if (Scr_place_meeting_3d(floor(x),y,Obj_wall)){
	 x = ceil(x);
	}
	if (Scr_place_meeting_3d(x,floor(y),Obj_wall)){
	 y = ceil(y);
	}
}
/*
function Scr_force_update(force){
	var fx = force[0];
	var fy = force[1];
	
	if(place_(x + fx, y, Obj_wall)){
		x += fx * Obj_valueContainer.game_timeScale;
	} else if(!place_empty(x + fx, y, Obj_wall)){
		while(place_empty(x + sign(fx) / 100, y,Obj_wall)){
			x += sign(fx) / 100;
		}
	}
	if(place_empty(x, y + fy, Obj_wall)){
		y += fy * Obj_valueContainer.game_timeScale;
	} else if(!place_empty(x, y + fy, Obj_wall)){
		while(place_empty(x, y + sign(fy) / 100,Obj_wall)){
			y += sign(fy) / 100;
		}
	}
	
	
	if (!place_empty(ceil(x),y,Obj_wall)){
	 x = floor(x);
	}
	if (!place_empty(x,ceil(y),Obj_wall)){
	 y = floor(y);
	}
	if (!place_empty(floor(x),y,Obj_wall)){
	 x = ceil(x);
	}
	if (!place_empty(x,floor(y),Obj_wall)){
	 y = ceil(y);
	}
}*/