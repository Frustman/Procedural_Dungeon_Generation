if(device_mouse_x_to_gui(0) < view_wport[0] / 2){
	boxCenterX = device_mouse_x_to_gui(0);
	boxCenterY = device_mouse_y_to_gui(0);
	move = true;
} else {
	if(point_distance(AttackCenterX, AttackCenterY,device_mouse_x_to_gui(0), device_mouse_y_to_gui(0)) < AttackRadius){
		show_message("attack");
	}
}