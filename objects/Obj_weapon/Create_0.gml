/// @description Insert description here
// You can write your code in this editor

#region Alarm setting

Scr_alarm_init();

#endregion

#region weapon setting

weapon_name				= noone;
weapon_description		= noone;
weapon_type				= -1;

weapon_origin_x			= 0;
weapon_origin_y			= 0;

weapon_muzzle_x			= 0;
weapon_muzzle_y			= 0;

weapon_reloadDelay		= 20;

#endregion

#region weapon image setting

weapon_equip_image		= -1;
weapon_has_image		= -1;
weapon_reload_anim		= -1;
weapon_shoot_anim		= -1;

#endregion

#region animation frame setting

weapon_shoot_frame		= ds_list_create();
weapon_reload_frame		= ds_list_create();

weapon_shoot_event_arg  = ds_map_create();
weapon_reload_event_arg = ds_map_create();

#endregion

#region bullet setting

bullet_image			= -1;
bullet_create_event		= noone;
bullet_tick_event		= noone;
bullet_hit_event		= noone;

bullet_create_event_arg	= ds_list_create();
bullet_tick_event_arg   = ds_list_create();
bullet_hit_event_arg    = ds_list_create();

bullet_tick		= 10;

shootX					= Obj_chr.x;
shootY					= Obj_chr.y;

angle					= 0;
bullet_dir				= 0;

bullet_damage			= 0;
bullet_speed			= 10;
bullet_attackDelay		= 10;
player_recoil			= 0;
bullet_maxCount			= 7;
bullet_count			= 7;

#endregion

#region FSM setting

Scr_SM_default_init();

Scr_SM_create("USE", Scr_weapon_use);
Scr_SM_create("RELOAD", Scr_weapon_reload);
Scr_SM_create("BACK", Scr_weapon_back);
Scr_SM_init("USE");

#endregion


#region control variable

controller_attack		= false;

#endregion