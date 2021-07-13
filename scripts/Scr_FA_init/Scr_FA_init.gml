// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Scr_FA_init(_speed, _radius, _duration, _stop_duration){
	FA_stop				= false;
	FA_angle			= random(360);
	FA_move_speed		= _speed;
	FA_speed			= _speed;
	FA_center_x			= x;
	FA_center_y			= y;
	FA_center_radius	= _radius;
	seed				= irandom(300);
	
	
	Alarm[0]			= _duration;
	Alarm[1]			= _stop_duration;
}

function Scr_FA_attack_init(_radius, _delay, _atk_ready, _atk){
	FA_attack_radius	= _radius;
	FA_attack_delay		= _delay;
	
	FA_sprite_atk_ready	= _atk_ready;
	state_var[1]		= sprite_get_number(FA_sprite_atk_ready);
	FA_sprite_atk		= _atk;	
}