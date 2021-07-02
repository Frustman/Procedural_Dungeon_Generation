/// @description Insert description here
// You can write your code in this editor

if(parent != -1){
	var camera_w = window_get_width();
	var camera_h = window_get_height();
	
	var cir_x = lengthdir_x(50, point_direction(parent.x,parent.y,screenX+screenW/2,screenY+screenH/2));
	var cir_y = lengthdir_y(50, point_direction(parent.x,parent.y,screenX+screenW/2,screenY+screenH/2));

	x = (parent.x + cir_x - screenX) * camera_w / screenW;
	y = (parent.y - 50 + cir_y - screenY) * camera_h / screenH;
}
