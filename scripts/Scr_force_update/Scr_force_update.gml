// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Scr_force_update(force){
	var fx = force[0];
	var fy = force[1];
	
	if(!instance_place(x + fx, y, Obj_wall)){
		x += fx * Obj_valueContainer.game_timeScale;
	} else{
		while(!instance_place(x + sign(fx) / 10, y,Obj_wall)){
			x += sign(fx) / 10;
		}
	}
	if(!instance_place(x, y + fy, Obj_wall)){
		y += fy * Obj_valueContainer.game_timeScale;
	} else{
		while(!instance_place(x, y + sign(fy) / 10,Obj_wall)){
			y += sign(fy) / 10;
		}
	}
	
	
	if (instance_place(ceil(x),y,Obj_wall)){
	 x = floor(x);
	}
	if (instance_place(x,ceil(y),Obj_wall)){
	 y = floor(y);
	}
	if (instance_place(floor(x),y,Obj_wall)){
	 x = ceil(x);
	}
	if (instance_place(x,floor(y),Obj_wall)){
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