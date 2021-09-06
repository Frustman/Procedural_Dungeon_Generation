/// @description Insert description here
// You can write your code in this editor

if(device_mouse_x_to_gui(0) <= slider_x - slider_width / 2
&& device_mouse_x_to_gui(0) >= slider_x + slider_width / 2
&& device_mouse_y_to_gui(0) <= slider_y - slider_height / 2
&& device_mouse_y_to_gui(0) >= slider_y + slider_height / 2){
	slider_toggle = true;	
}