/// @description Insert description here
// You can write your code in this editor

if(lengthdir_x(1,bullet_dir) >= 0){
	shootX = Obj_chr.x + lengthdir_x(weapon_muzzle_x - weapon_origin_x, bullet_dir);
	shootY = Obj_chr.y + lengthdir_y(weapon_muzzle_y - weapon_origin_y, bullet_dir - 90);
} else {
	shootX = Obj_chr.x - lengthdir_x(weapon_muzzle_x - weapon_origin_x, bullet_dir);
	shootY = Obj_chr.y + lengthdir_y(weapon_muzzle_y - weapon_origin_y, bullet_dir - 90);
}

switch(sprite_index){
    case weapon_shoot_anim:
        if(image_index == weapon_shoot_frame){
            #region shoot func
			event_perform(ev_other, ev_user0);
			#endregion
        }
        break;
    case weapon_reload_anim:
        if(image_index == weapon_reload_frame){
            #region reload func
			#endregion
        }
        break;
}

Scr_alarm_step();