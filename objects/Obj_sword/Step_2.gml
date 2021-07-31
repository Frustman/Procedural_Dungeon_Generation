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

previous_mouse_x = xx + dx;
previous_mouse_y = yy + dy;