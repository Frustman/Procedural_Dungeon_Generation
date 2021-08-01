/// @description Insert description here
// You can write your code in this editor

var xpos = room_width / 2;
var ypos = room_height / 2;


var xx = xpos + lengthdir_x(handRadiusW, hand_dir);
var yy = ypos + 6 + lengthdir_y(handRadiusH, hand_dir);

var dx = lengthdir_x(length, sword_dir - 90);
var dy = lengthdir_y(length, sword_dir - 90);

if(point_distance(xx + dx, yy + dy, previous_mouse_x, previous_mouse_y) > 0.1){
	path_add_point(p_trail_o, xx, yy, 100);
	path_add_point(p_trail_i, xx + dx, yy + dy, 100);
	
	if(path_get_number(p_trail_o) > 10){
		path_delete_point(p_trail_o,0);
	}
	if(path_get_number(p_trail_i) > 10){
		path_delete_point(p_trail_i,0);
	}
} else {
	if(path_get_number(p_trail_o) > 0){
		path_delete_point(p_trail_o,0);
	}
	if(path_get_number(p_trail_i) > 0){
		path_delete_point(p_trail_i,0);
	}
}

Scr_SM_update();