/// @description Insert description here
// You can write your code in this editor

#region weapon setting

weapon_name				= noone;
weapon_description		= noone;
weapon_type				= -1;

weapon_origin_x			= 0;
weapon_origin_y			= 0;

weapon_muzzle_x			= 0;
weapon_muzzle_y			= 0;

#endregion

#region weapon image setting

weapon_equip_image		= -1;
weapon_has_image		= -1;
weapon_reload_anim		= -1;
weapon_shoot_anim		= -1;

#endregion

#region animation frame setting

weapon_shoot_frame		= 0;
weapon_reload_frame		= 0;

#endregion

#region bullet setting

bullet_image			= -1;
bullet_shoot_event		= noone;
bullet_tick_event		= noone;
bullet_hit_event		= noone;

bullet_shoot_event_arg  = [];
bullet_tick_event_arg   = [];
bullet_hit_event_arg    = [];

shootX					= Obj_chr.x;
shootY					= Obj_chr.y;

angle					= 0;
bullet_dir				= 0;

bullet_damage			= 0;
bullet_speed			= 10;
bullet_attackdelay		= 10;
player_recoil			= 0;
bullet_maxcount			= 7;
bullet_count			= 7;

#endregion


#region control variable

controller_attack		= false;

#endregion