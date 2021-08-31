/// @description Insert description here
// You can write your code in this editor
clickOne = device_mouse_check_button(0, mb_left);
clickTwo = device_mouse_check_button(1, mb_left);

device_x[0] = device_mouse_x_to_gui(0);
device_y[0] = device_mouse_y_to_gui(0);
device_x[1] = device_mouse_x_to_gui(1);
device_y[1] = device_mouse_y_to_gui(1);

if(instance_exists(Obj_cutscene)){
	move = false;	
}

if(clickOne && device_mouse_x_to_gui(0) <= view_wport[0] / 2){
	if(joyIndex != 0){
		device_press_x[0] = device_mouse_x_to_gui(0);
		device_press_y[0] = device_mouse_y_to_gui(0);
	}
	joyIndex = 0;
	move = true;
} else if(clickTwo && device_mouse_x_to_gui(1) <= view_wport[0] / 2){
	if(joyIndex != 1){
		device_press_x[1] = device_mouse_x_to_gui(1);
		device_press_y[1] = device_mouse_y_to_gui(1);
	}
	joyIndex = 1;
	move = true;
} else if(!keypress){
	joyIndex = -1;
	device_press_x[0] = 0;
	device_press_y[0] = 0;
	device_press_x[1] = 0;
	device_press_y[1] = 0
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
					event_perform(ev_other,ev_user2);
				}
				can_dash = false;
				Alarm[1] = dash_delay;
			}
		}
		if(point_distance(dashCenterX, dashCenterY, device_x[!joyIndex], device_y[!joyIndex]) <= dashRadius){
			if(can_dash && !Obj_chr.shoot){
				with(Obj_chr){
					event_perform(ev_other,ev_user2);
				}
				can_dash = false;
				Alarm[1] = dash_delay;
			}
		}
		if(point_distance(infoCenterX, infoCenterY, device_x[!joyIndex], device_y[!joyIndex]) <= infoRadius){
			if(can_info){
				with(Obj_pause){
					event_perform(ev_other,ev_user0);
				}
				can_info = false;
				Alarm[2] = 5;
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
						event_perform(ev_other,ev_user2);
					}
					can_dash = false;
					Alarm[1] = dash_delay;
				}
			}
			if(point_distance(infoCenterX, infoCenterY, device_x[i], device_y[i]) <= infoRadius){
				if(can_info){
					with(Obj_pause){
						event_perform(ev_other,ev_user0);
					}
					can_info = false;
					Alarm[2] = 5;
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
					event_perform(ev_other,ev_user2);
				}
				can_dash = false;
				Alarm[1] = dash_delay;
			}
		}
		if(point_distance(infoCenterX, infoCenterY, device_x[0], device_y[0]) <= infoRadius){
			if(can_info){
				with(Obj_pause){
					event_perform(ev_other,ev_user0);
				}
				can_info = false;
				Alarm[2] = 5;
			}
		}
	}
}
if(attackIndex != -1){
	if(device_x[attackIndex] >= view_wport[0] / 2){
		CONTAINER.player_curWeapon.angle = AttackDirection;
		if(!Obj_valueContainer.player_charge){
			AttackDirection = point_direction(AttackCenterX,AttackCenterY,device_x[attackIndex],device_y[attackIndex]);
			AttackDistance = point_distance(AttackCenterX,AttackCenterY,device_x[attackIndex],device_y[attackIndex]);
			Obj_chr.angle = AttackDirection;
			if(can_attack){
				with(Obj_chr){
					event_perform(ev_other,ev_user1);
					other.Alarm[0] = CONTAINER.player_attackdelay;
				}
				can_attack = false;
			}
		} else {
			if(!instance_exists(Obj_charging_eff))
				instance_create_layer(Obj_chr.x,Obj_chr.y,"sort_start",Obj_charging_eff);
			AttackDirection = point_direction(AttackCenterX,AttackCenterY,device_x[attackIndex],device_y[attackIndex]);
			AttackDistance = point_distance(AttackCenterX,AttackCenterY,device_x[attackIndex],device_y[attackIndex]);
			Obj_chr.angle = AttackDirection;
			Obj_chr.charging = true;
			with(Obj_chr){
				AttackTarget = Scr_interpolate_aim(x,y,other.AttackDirection);	
			}
			charge++;
			if(charge >= chargeMax){
				charge = chargeMax;	
			}
		}
	} else {
		attackIndex = -1;
	}
}

if(attackIndex != -1 && device_mouse_check_button_released(attackIndex, mb_left)){
	if(Obj_valueContainer.player_charge){
		instance_destroy(Obj_charging_eff);
		Obj_chr.charging = false;
		Obj_chr.charge = charge;
		with(Obj_chr){
			event_perform(ev_other,ev_user0);	
		}
		charge = 1;
	}
	attackIndex = -1;
}

if(attackIndex == -1){
	AttackDistance = 0;
}

if(joyIndex != -1){
	if(device_mouse_check_button(joyIndex, mb_left)){
		boxCenterX = device_press_x[joyIndex];
		boxCenterY = device_press_y[joyIndex];
		distanceBox = point_distance(boxCenterX, boxCenterY, device_mouse_x_to_gui(joyIndex), device_mouse_y_to_gui(joyIndex));
		directionBox = point_direction(boxCenterX, boxCenterY, device_mouse_x_to_gui(joyIndex), device_mouse_y_to_gui(joyIndex));
	}
}


Scr_alarm_step();