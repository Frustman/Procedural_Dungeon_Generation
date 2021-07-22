// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Scr_weapon_fsm(){

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

function Scr_weapon_shoot_frame_set(_frame, _event){
	
	if(argument_count > 2){
		switch(argument_count){
			case 2:
		}
	}
}