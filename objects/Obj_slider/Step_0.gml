/// @description Insert description here
// You can write your code in this editor

if(slider_toggle == true){
	var mouseX		= device_mouse_x_to_gui(0);
	
	var slider_xS	= slider_x - slider_width / 2;
	var slider_xE	= slider_x + slider_width / 2;
	var mouse_xS	= max(min(mouseX, slider_xE), slider_xS) - slider_xS;
	
	slider_val = slider_minVal + mouse_xS / slider_width * (slider_maxVal - slider_minVal);
	Obj_debug.sliderList[|slider_index][2] = slider_val;
}