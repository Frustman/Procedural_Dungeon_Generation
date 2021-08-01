/// @description Insert description here
// You can write your code in this editor

var xpos = room_width / 2;
var ypos = room_height / 2;

var xx = xpos + lengthdir_x(handRadiusW, hand_dir);
var yy = ypos + 6 + lengthdir_y(handRadiusH, hand_dir);

var dx = lengthdir_x(length, sword_dir - 90);
var dy = lengthdir_y(length, sword_dir - 90);

previous_mouse_x = xx + dx;
previous_mouse_y = yy + dy;

