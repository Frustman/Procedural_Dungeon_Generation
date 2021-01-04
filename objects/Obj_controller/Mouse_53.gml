if(device_mouse_x_to_gui(0)){
	if(device_mouse_x_to_gui(0) < view_wport[0] / 2){
		boxCenterX = device_mouse_x_to_gui(0);
		boxCenterY = device_mouse_y_to_gui(0);
		move = true;
	} else {
		if(point_distance(DashCenterX, DashCenterY,device_mouse_x_to_gui(0), device_mouse_y_to_gui(0)) < DashRadius){
			with(Obj_chr){
				alarm[0] = 15;
				anim_index = 0;
				dashDir = other.directionBox;
				dash = true;
			}
		} else{
			_move = true;
		}
	}
}
if(device_mouse_x_to_gui(1)){
	if(device_mouse_x_to_gui(1) < view_wport[0] / 2){
		boxCenterX = device_mouse_x_to_gui(1);
		boxCenterY = device_mouse_y_to_gui(1);
		move = true;
	} else {
		if(point_distance(DashCenterX, DashCenterY,device_mouse_x_to_gui(1), device_mouse_y_to_gui(1)) < DashRadius){
			with(Obj_chr){
				alarm[0] = 15;
				anim_index = 0;
				dashDir = other.directionBox;
				dash = true;
			}
		} else{
			_move = true;
		}
	}
}