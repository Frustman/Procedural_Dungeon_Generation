
event_inherited();

#region bullet setting

bullet_image			= -1;
bullet_shoot_event		= noone;
bullet_tick_event		= noone;
bullet_hit_event		= noone;

bullet_dir              = 0;
bullet_speed            = 10;

bullet_shoot_event_arg  = [];
bullet_tick_event_arg   = [];
bullet_hit_event_arg    = [];

#endregion

#region variable

tick					= 0;
event_tick	            = 100;

#endregion

#region alarm

alarm[11] = 1;

#endregion