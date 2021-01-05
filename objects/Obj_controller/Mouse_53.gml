/// @description Insert description here
// You can write your code in this editor
if(device_mouse_check_button(0, mb_left) && device_mouse_check_button(1, mb_left)){
	if(device_mouse_x_to_gui(0) < device_mouse_x_to_gui(1)){
		boxCenterX = device_mouse_x_to_gui(0);
		boxCenterY = device_mouse_y_to_gui(0);
	} else{
		boxCenterX = device_mouse_x_to_gui(1);
		boxCenterY = device_mouse_y_to_gui(1);
	}
} else if(device_mouse_check_button(0, mb_left) && !device_mouse_check_button(1, mb_left)){
	boxCenterX = device_mouse_x_to_gui(0);
	boxCenterY = device_mouse_y_to_gui(0);
} else if(!device_mouse_check_button(0, mb_left) && device_mouse_check_button(1, mb_left)){
	boxCenterX = device_mouse_x_to_gui(1);
	boxCenterY = device_mouse_y_to_gui(1);
}