/// @description Insert description here
// You can write your code in this editor
cur_room = Scr_get_room_pos(x,y);

Scr_alarm_step();
motion_set(dir,spd * global.timeScale);