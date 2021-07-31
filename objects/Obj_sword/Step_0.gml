/// @description Insert description here
// You can write your code in this editor

var xpos = room_width / 2;
var ypos = room_height / 2;

var handRadiusW = 10;
var handRadiusH = 4;

var mouse_dir = point_direction(xpos, ypos, mouse_x, mouse_y);

var xx = xpos + lengthdir_x(handRadiusW, mouse_dir - 90);
var yy = ypos + 6 + lengthdir_y(handRadiusH, mouse_dir - 90);

var dx = lengthdir_x(length, mouse_dir - 240);
var dy = lengthdir_y(length, mouse_dir - 240);
/*
tick++;
if(tick == 2){
	if(point_distance(xx, yy, previous_mouse_x, previous_mouse_y) > 0.25){
		ds_list_add(point_list, [xx, yy, xx + dx, yy + dy]);
	
		if(ds_list_size(point_list) > 10){
			ds_list_delete(point_list, 0)
		}
	} else {
		if(ds_list_size(point_list) > 0){
			ds_list_delete(point_list, 0)
		}
	}
	tick = 0;
}
*/

if(point_distance(xx + dx, yy + dy, previous_mouse_x, previous_mouse_y) > 2){
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