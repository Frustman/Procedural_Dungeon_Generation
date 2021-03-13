/// @description Insert description here
// You can write your code in this editor
if(Obj_valueContainer.bullet_count > 0 && !reload){
	//Scr_shake(0.9,0.2,5,0.7,0.45,0.8);
	audio_play_sound(Pistol_Shot_02,0,false);
	//instance_create_layer(shootX,shootY, "sort_end", Obj_Catridge);
	shoot = true;
	anim_index = 0;
	alarm[1] = 20;
	
	AttackTarget = Scr_interpolate_aim(x,y,angle);
	
	var bullet = instance_create_layer(chargeX,chargeY,"sort_end",Obj_charge_bullet);
	with(bullet){
		image_xscale = 0.5 + other.charge / 100 * 0.5;
		image_yscale = 0.5 + other.charge / 100 * 0.5;
		var _angle;
		if(other.AttackTarget != noone)
			_angle = point_direction(other.x,other.y,other.AttackTarget.x,other.AttackTarget.y);
		else
			_angle = other.angle;
		damage = floor(other.charge / 100 * Obj_valueContainer.player_chargeMaxDamage);
		motion_set(_angle,7);
		image_angle = _angle;
	
		chainDamage = Obj_valueContainer.player_chainDamage;
		chain_lightning = Obj_valueContainer.player_chain;
		critical_chance = Obj_valueContainer.critical_chance;
	
		par = other.id;	
	
		fireshot = Obj_valueContainer.player_fireshot;
	
		target = other.AttackTarget;
		sharp_shooting = Obj_valueContainer.player_sharpshooting;
		cusion_max = Obj_valueContainer.sharp_cusionCount;
		cusion_dist = Obj_valueContainer.sharp_distance;
	}
	Obj_valueContainer.bullet_count--;
	with(bullet_ui[Obj_valueContainer.bullet_count]){
		event_perform(ev_other,ev_user0);
	}
	if(Obj_valueContainer.bullet_count == 0){
		reload = true;
		Obj_valueContainer.bullet_count = Obj_valueContainer.bullet_maxCount;
		alarm[3] = 90;
	}
}