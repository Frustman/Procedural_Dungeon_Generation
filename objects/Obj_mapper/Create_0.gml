/// @description Insert description here
// You can write your code in this editor
room1 = room_duplicate(rm_level);
globalvar deviceWidth;
deviceWidth = display_get_width();
globalvar deviceHeight;
deviceHeight = display_get_height();

deviceWidth = 1480;
deviceHeight = 720;

cam_width = 370;
cam_height = 180;


room_set_viewport(room1,0,true,0,0,1480,720);
room_set_camera(room1,0,camera_create_view(0,0,cam_width,cam_height,0,-1,-1,-1,cam_width / 2, cam_height / 2));
room_goto(room1);