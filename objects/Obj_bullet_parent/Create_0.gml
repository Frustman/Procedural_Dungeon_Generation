/// @description Insert description here
// You can write your code in this editor

#region default setting

damage = 0;
dir = 0;
spd = 0;
par = noone;
Scr_update_depth(x,y);
cur_room = Scr_get_room_pos(x,y);
image_speed = global.timeScale;

#endregion

Scr_alarm_init();