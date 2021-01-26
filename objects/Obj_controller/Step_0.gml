/// @description Insert description here
// You can write your code in this editor
clickOne = device_mouse_check_button(0, mb_left);
clickTwo = device_mouse_check_button(1, mb_left);

if(clickOne && device_mouse_x_to_gui(0) <= view_wport[0] / 2){
	joyIndex = 0;
	move = true;
} else if(clickTwo && device_mouse_x_to_gui(1) <= view_wport[0] / 2){
	joyIndex = 1;
	move = true;
} else {
	joyIndex = -1;
	boxCenterX = 240;
	boxCenterY = 1200 + 32;
	distanceBox = 0;
	move = false;
}

if(clickOne && clickTwo){
	if(joyIndex != -1){
		if(point_distance(AttackCenterX, AttackCenterY, device_mouse_x_to_gui(!joyIndex), device_mouse_y_to_gui(!joyIndex)) <= AttackRadius){
			if(can_attack && !Obj_chr.dash){
				with(Obj_chr){
					event_perform(ev_other,ev_user0);
				}
				can_attack = false;
				if(Obj_chr.bullet_count == Obj_chr.bullet_maxCount)	alarm[0] = 20;
				else if(Obj_chr.bullet_count == 0)	alarm[0] = 20;
				else alarm[0] = 10;
			}
		}
		if(point_distance(dashCenterX, dashCenterY, device_mouse_x_to_gui(!joyIndex), device_mouse_y_to_gui(!joyIndex)) <= dashRadius){
			if(can_dash && !Obj_chr.shoot){
				with(Obj_chr){
					alarm[0] = 27;
					anim_index = 0;
					dashDir = other.directionBox;
					dashSpeed = 4.5;
					dash = true;
				}
				can_dash = false;
				alarm[1] = 30;
			}
		}
	} else{
		for(var i = 0; i < 2; i++){
			if(point_distance(AttackCenterX, AttackCenterY, device_mouse_x_to_gui(i), device_mouse_y_to_gui(i)) <= AttackRadius){
				if(can_attack && !Obj_chr.dash){
					
				with(Obj_chr){
					event_perform(ev_other,ev_user0);
				}
					can_attack = false;
					if(Obj_chr.bullet_count == Obj_chr.bullet_maxCount)	alarm[0] = 20;
					else if(Obj_chr.bullet_count == 0)	alarm[0] = 20;
					else alarm[0] = 10;
				}
			}
			if(point_distance(dashCenterX, dashCenterY, device_mouse_x_to_gui(i), device_mouse_y_to_gui(i)) <= dashRadius){
				if(can_dash && !Obj_chr.shoot){
					with(Obj_chr){
						alarm[0] = 27;
						anim_index = 0;
						dashDir = other.directionBox;
						dashSpeed = 4.5;
						dash = true;
					}
					can_dash = false;
					alarm[1] = 30;
				}
			}
		}
	}
} 
if(clickOne){
	if(joyIndex == -1 && device_mouse_x_to_gui(0) >= view_wport[0] / 2){
		if(point_distance(AttackCenterX, AttackCenterY, device_mouse_x_to_gui(0), device_mouse_y_to_gui(0)) <= AttackRadius){
			if(can_attack && !Obj_chr.dash){
				with(Obj_chr){
					event_perform(ev_other,ev_user0);
				}
				can_attack = false;
				if(Obj_chr.bullet_count == Obj_chr.bullet_maxCount)	alarm[0] = 20;
				else if(Obj_chr.bullet_count == 0)	alarm[0] = 20;
				else alarm[0] = 10;
			}
		}
		if(point_distance(dashCenterX, dashCenterY, device_mouse_x_to_gui(0), device_mouse_y_to_gui(0)) <= dashRadius){
			if(can_dash && !Obj_chr.shoot){
				with(Obj_chr){
					alarm[0] = 27;
					anim_index = 0;
					dashDir = other.directionBox;
					dashSpeed = 4.5;
					dash = true;
				}
				can_dash = false;
				alarm[1] = 30;
			}
		}
	}
}

if(joyIndex != -1){
	if(device_mouse_check_button(joyIndex, mb_left)){
		distanceBox = point_distance(boxCenterX, boxCenterY, device_mouse_x_to_gui(joyIndex), device_mouse_y_to_gui(joyIndex));
		directionBox = point_direction(boxCenterX, boxCenterY, device_mouse_x_to_gui(joyIndex), device_mouse_y_to_gui(joyIndex));
	}
}