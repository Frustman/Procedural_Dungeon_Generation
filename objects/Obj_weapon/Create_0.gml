/// @description Insert description here
// You can write your code in this editor

#region weapon setting

weapon_name = noone;
weapon_description = noone;
weapon_type_num = -1;

#endregion

#region weapon image setting

weapon_equip_image = -1;
weapon_has_image = -1;
weapon_reload_anim = -1;
weapon_shoot_anim = -1;

#endregion


#region animation frame setting

weapon_shoot_frame = 0;
weapon_reload_frame = 0;

#endregion

#region bullet setting

bullet_image = -1;
bullet_shoot_event = noone;
bullet_tick_event = noone;
bullet_hit_event = noone;

shootX = Obj_chr.x;
shootY = Obj_chr.y;

bullet_dir = Obj_chr.angle;

bullet_damage = 0;
bullet_speed = 10;

#endregion