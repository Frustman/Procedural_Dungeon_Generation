/// @description Insert description here
#macro DG_WIDTH 16
#macro DG_HEIGHT 12

#macro ALARMINACTIVE -100

for(var i = 0; i < 12; i++){
	Alarm[i] = ALARMINACTIVE;
}

randomize();

window_set_size(deviceWidth,deviceHeight);
surface_resize(application_surface,deviceWidth,deviceHeight);
display_set_gui_size(deviceWidth,deviceHeight);

display_reset(8, true);

Alarm[0] = 1;


global.paused = false;

clear = true;

mapW_target = 2.0;
mapH_target = 2.0;

mapW = 1.0;
mapH = 1.0;

mapX = 90 * mapW;
bosshpY = deviceHeight + 60;

event_perform(ev_other, ev_user0);