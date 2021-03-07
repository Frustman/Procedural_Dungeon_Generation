/// @description Insert description here
// You can write your code in this editor
clickOne = device_mouse_check_button(0, mb_left);
clickTwo = device_mouse_check_button(1, mb_left);

device_x[0] = device_mouse_x_to_gui(0);
device_y[0] = device_mouse_y_to_gui(0);
device_x[1] = device_mouse_x_to_gui(1);
device_y[1] = device_mouse_y_to_gui(1);


if(clickOne && device_mouse_x_to_gui(0) <= view_wport[0] / 2){
	joyIndex = 0;
	move = true;
} else if(clickTwo && device_mouse_x_to_gui(1) <= view_wport[0] / 2){
	joyIndex = 1;
	move = true;
} else if(!keypress){
	joyIndex = -1;
	boxCenterX = 160;
	boxCenterY = deviceHeight - 256;
	distanceBox = 0;
	move = false;
}


attack = false;

if(clickOne && clickTwo){
	if(joyIndex != -1){
		if(point_distance(AttackCenterX, AttackCenterY, device_x[!joyIndex], device_y[!joyIndex]) <= AttackRadius){
			attackIndex = !joyIndex;
		}
		if(point_distance(dashCenterX, dashCenterY, device_x[!joyIndex], device_y[!joyIndex]) <= dashRadius){
			if(can_dash && !Obj_chr.shoot){
				with(Obj_chr){
					alarm[0] = 27;
					anim_index = 0;
					dashDir = other.directionBox;
					dashSpeed = 4;
					dash = true;
				}
				can_dash = false;
				alarm[1] = 30;
			}
		}
	} else{
		for(var i = 0; i < 2; i++){
			if(point_distance(AttackCenterX, AttackCenterY, device_x[i], device_y[i]) <= AttackRadius){
				attackIndex = i;
			}
			if(point_distance(dashCenterX, dashCenterY, device_x[i], device_y[i]) <= dashRadius){
				if(can_dash && !Obj_chr.shoot){
					with(Obj_chr){
						alarm[0] = 27;
						anim_index = 0;
						dashDir = other.directionBox;
						dashSpeed = 4;
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
	if(joyIndex == -1 && device_x[0] >= view_wport[0] / 2){
		if(point_distance(AttackCenterX, AttackCenterY, device_x[0], device_y[0]) <= AttackRadius){
			attackIndex = 0;
		}
		if(point_distance(dashCenterX, dashCenterY, device_x[0], device_y[0]) <= dashRadius){
			if(can_dash && !Obj_chr.shoot){
				with(Obj_chr){
					alarm[0] = 27;
					anim_index = 0;
					dashDir = other.directionBox;
					dashSpeed = 4;
					dash = true;
				}
				can_dash = false;
				alarm[1] = 30;
			}
		}
	}
}
if(attackIndex != -1){
	if(device_x[attackIndex] >= view_wport[0] / 2){
		AttackDirection = point_direction(AttackCenterX,AttackCenterY,device_x[attackIndex],device_y[attackIndex]);
		AttackDistance = point_distance(AttackCenterX,AttackCenterY,device_x[attackIndex],device_y[attackIndex]);
		if(can_attack && !Obj_chr.dash){
			with(Obj_chr){
				event_perform(ev_other,ev_user1);
				other.alarm[0] = bullet_delay;
			}
			can_attack = false;
		}
	} else {
		attackIndex = -1;	
	}
}

if(attackIndex != -1 && device_mouse_check_button_released(attackIndex, mb_left)){
	attackIndex = -1;
}

if(attackIndex == -1){
	AttackDirection = 90;
	AttackDistance = 0;
}

if(joyIndex != -1){
	if(device_mouse_check_button(joyIndex, mb_left)){
		distanceBox = point_distance(boxCenterX, boxCenterY, device_mouse_x_to_gui(joyIndex), device_mouse_y_to_gui(joyIndex));
		directionBox = point_direction(boxCenterX, boxCenterY, device_mouse_x_to_gui(joyIndex), device_mouse_y_to_gui(joyIndex));
	}
}