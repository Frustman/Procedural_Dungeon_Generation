/// @function Scr_weapon_func()
/// @function Scr_weapon_init(_name, _desc, _type)
/// @function Scr_weapon_reload_frame_set_event(_frame, _script, [argument])
/// @function Scr_weapon_shoot_frame_set_event(_frame, _script, [argument])
/// @function Scr_weapon_bullet_set_tick_event(_script, _tick, [argument])
/// @function Scr_weapon_bullet_set_create_event(_script, [argument])
/// @function Scr_weapon_bullet_set_hit_event(_script, [argument])
/// @function Scr_weapon_has_shoot_event()
/// @function Scr_weapon_has_reload_event()
/// @function Scr_weapon_bullet_has_create_event()
/// @function Scr_weapon_bullet_has_tick_event()
/// @function Scr_weapon_bullet_has_hit_event()

function Scr_weapon_func(){

}

function Scr_weapon_init(_name, _desc, _type){

	weapon_name			= _name;
	weapon_description	= _desc;
	weapon_type			= _type;
}

function Scr_weapon_image(_equipImage, _hasImage, _reloadAnim, _shootAnim, _origX, _origY, _muzzleX, _muzzleY){

	weapon_origin_x			= _origX;
	weapon_origin_y			= _origY;
	
	weapon_muzzle_x			= _muzzleX;
	weapon_muzzle_y			= _muzzleY;
	
	
	weapon_equip_image		= _equipImage;
	weapon_has_image		= _hasImage;
	weapon_reload_anim		= _reloadAnim;
	weapon_shoot_anim		= _shootAnim;
}

function Scr_weapon_reload_frame_set_event(_frame, _script){
	
	ds_list_add(weapon_reload_frame, [_frame, _script]);
	switch(argument_count){
		case 2:
			ds_map_add(weapon_reload_event_arg, _frame, []);
			break;
		case 3:
			ds_map_add(weapon_reload_event_arg, _frame, [argument[2]]);
			break;
		case 4:
			ds_map_add(weapon_reload_event_arg, _frame, [argument[2], argument[3]]);
			break;
		case 5:
			ds_map_add(weapon_reload_event_arg, _frame, [argument[2], argument[3], argument[4]]);
			break;
		case 6:
			ds_map_add(weapon_reload_event_arg, _frame, [argument[2], argument[3], argument[4], argument[5]]);
			break;
		case 7:
			ds_map_add(weapon_reload_event_arg, _frame, [argument[2], argument[3], argument[4], argument[5], argument[6]]);
			break;
		case 8:
			ds_map_add(weapon_reload_event_arg, _frame, [argument[2], argument[3], argument[4], argument[5], argument[6], argument[7]]);
			break;
		case 9:
			ds_map_add(weapon_reload_event_arg, _frame, [argument[2], argument[3], argument[4], argument[5], argument[6], argument[7], argument[8]]);
			break;
	}
}

function Scr_weapon_shoot_frame_set_event(_frame, _script){
	
	ds_list_add(weapon_shoot_frame, [_frame, _script]);
	switch(argument_count){
		case 2:
			ds_map_add(weapon_shoot_event_arg, _frame, []);
			break;
		case 3:
			ds_map_add(weapon_shoot_event_arg, _frame, [argument[2]]);
			break;
		case 4:
			ds_map_add(weapon_shoot_event_arg, _frame, [argument[2], argument[3]]);
			break;
		case 5:
			ds_map_add(weapon_shoot_event_arg, _frame, [argument[2], argument[3], argument[4]]);
			break;
		case 6:
			ds_map_add(weapon_shoot_event_arg, _frame, [argument[2], argument[3], argument[4], argument[5]]);
			break;
		case 7:
			ds_map_add(weapon_shoot_event_arg, _frame, [argument[2], argument[3], argument[4], argument[5], argument[6]]);
			break;
		case 8:
			ds_map_add(weapon_shoot_event_arg, _frame, [argument[2], argument[3], argument[4], argument[5], argument[6], argument[7]]);
			break;
		case 9:
			ds_map_add(weapon_shoot_event_arg, _frame, [argument[2], argument[3], argument[4], argument[5], argument[6], argument[7], argument[8]]);
			break;
	}
}

function Scr_weapon_bullet_set_tick_event(_script, _tick){
	
	ds_list_add(bullet_tick_event, _script);
	bullet_tick = _tick;
	switch(argument_count){
		case 2:
			ds_list_add(bullet_tick_event_arg, []);
			break;
		case 3:
			ds_list_add(bullet_tick_event_arg, [argument[2]]);
			break;
		case 4:
			ds_list_add(bullet_tick_event_arg, [argument[2], argument[3]]);
			break;
		case 5:
			ds_list_add(bullet_tick_event_arg, [argument[2], argument[3], argument[4]]);
			break;
		case 6:
			ds_list_add(bullet_tick_event_arg, [argument[2], argument[3], argument[4], argument[5]]);
			break;
		case 7:
			ds_list_add(bullet_tick_event_arg, [argument[2], argument[3], argument[4], argument[5], argument[6]]);
			break;
		case 8:
			ds_list_add(bullet_tick_event_arg, [argument[2], argument[3], argument[4], argument[5], argument[6], argument[7]]);
			break;
		case 9:
			ds_list_add(bullet_tick_event_arg, [argument[2], argument[3], argument[4], argument[5], argument[6], argument[7], argument[8]]);
			break;
	}
}

function Scr_weapon_bullet_set_create_event(_script){
	
	ds_list_add(bullet_create_event, _script);
	switch(argument_count){
		case 1:
			ds_list_add(bullet_create_event_arg, []);
			break;
		case 2:
			ds_list_add(weapon_shoot_event_arg, [argument[1]]);
			break;
		case 3:
			ds_list_add(weapon_shoot_event_arg, [argument[1], argument[2]]);
			break;
		case 4:
			ds_list_add(weapon_shoot_event_arg, [argument[1], argument[2], argument[3]]);
			break;
		case 5:
			ds_list_add(weapon_shoot_event_arg, [argument[1], argument[2], argument[3], argument[4]]);
			break;
		case 6:
			ds_list_add(weapon_shoot_event_arg, [argument[1], argument[2], argument[3], argument[4], argument[5]]);
			break;
		case 7:
			ds_list_add(weapon_shoot_event_arg, [argument[1], argument[2], argument[3], argument[4], argument[5], argument[6]]);
			break;
		case 8:
			ds_list_add(weapon_shoot_event_arg, [argument[1], argument[2], argument[3], argument[4], argument[5], argument[6], argument[7]]);
			break;
	}
}

function Scr_weapon_bullet_set_hit_event(_script){
	
	ds_list_add(bullet_hit_event, _script);
	switch(argument_count){
		case 1:
			ds_list_add(bullet_hit_event_arg, []);
			break;
		case 2:
			ds_list_add(bullet_hit_event_arg, [argument[1]]);
			break;
		case 3:
			ds_list_add(bullet_hit_event_arg, [argument[1], argument[2]]);
			break;
		case 4:
			ds_list_add(bullet_hit_event_arg, [argument[1], argument[2], argument[3]]);
			break;
		case 5:
			ds_list_add(bullet_hit_event_arg, [argument[1], argument[2], argument[3], argument[4]]);
			break;
		case 6:
			ds_list_add(bullet_hit_event_arg, [argument[1], argument[2], argument[3], argument[4], argument[5]]);
			break;
		case 7:
			ds_list_add(bullet_hit_event_arg, [argument[1], argument[2], argument[3], argument[4], argument[5], argument[6]]);
			break;
		case 8:
			ds_list_add(bullet_hit_event_arg, [argument[1], argument[2], argument[3], argument[4], argument[5], argument[6], argument[7]]);
			break;
	}
}


function Scr_weapon_has_shoot_event(){
	if(ds_list_size(weapon_shoot_frame) == 0) return false;
	else return true;
}

function Scr_weapon_has_reload_event(){
	if(ds_list_size(weapon_reload_frame) == 0) return false;
	else return true;
}

function Scr_weapon_bullet_has_create_event(){
	if(bullet_create_event == noone) return false;
	else return true;
}

function Scr_weapon_bullet_has_tick_event(){
	if(bullet_tick_event == noone) return false;
	else return true;
}

function Scr_weapon_bullet_has_hit_event(){
	if(bullet_hit_event == noone) return false;
	else return true;
}