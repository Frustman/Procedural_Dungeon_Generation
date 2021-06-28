/// @description Insert description here
// You can write your code in this editor

var camera_x = camera_get_view_x(view_camera[0]);
var camera_y = camera_get_view_y(view_camera[0]);



var camera_w = window_get_width();
var camera_h = window_get_height();

xpos = (x - screenX) * camera_w / screenW;
ypos = (y - screenY) * camera_h / screenH;

draw_rectangle(xpos,ypos,xpos+100,ypos+100,false);
