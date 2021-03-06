/// @description Insert description here
// You can write your code in this editor
if(CONTAINER.bullet_count > 0 && !reload){
	//Scr_shake(0.9,0.2,5,0.7,0.45,0.8);
	audio_play_sound(Pistol_Shot_02,0,false);
	//instance_create_layer(shootX,shootY, "sort_end", Obj_Catridge);
	shoot = true;
	Alarm[1] = 20;
	
	AttackTarget = Scr_interpolate_aim(x,y,angle);
	gun_index = 0;
	TargetAngle = angle;
	var _angle = angle;
	
	if(AttackTarget == noone){
		if(sign(image_xscale) > 0){
			shootX = x + lengthdir_x(38,angle) + lengthdir_x(-7,angle + 90);
			chargeX = x + lengthdir_x(38,angle) + lengthdir_x(-7,angle + 90);
		} else{
			shootX = x + lengthdir_x(38,angle) + lengthdir_x(-7,angle + 90);
			chargeX = x + lengthdir_x(38,angle) + lengthdir_x(-7,angle + 90);
		}
		if(sign(image_xscale) > 0){
			shootY = y + lengthdir_y(38,angle) + lengthdir_y(-7,angle + 90);
			chargeY = y + lengthdir_y(38,angle) + lengthdir_y(-7,angle + 90);
		} else{
			shootY = y + lengthdir_y(38,angle) + lengthdir_y(-7,angle + 90);
			chargeY = y + lengthdir_y(38,angle) + lengthdir_y(-7,angle + 90);
		}
	} else if(AttackTarget != noone && instance_exists(AttackTarget)){
		if(x < AttackTarget.x){
			shootX = x + lengthdir_x(38,angle) + lengthdir_x(-7,angle + 90);
			chargeX = x + lengthdir_x(38,angle) + lengthdir_x(-7,angle + 90);
		} else{
			shootX = x + lengthdir_x(38,angle) + lengthdir_x(-7,angle + 90);
			chargeX = x + lengthdir_x(38,angle) + lengthdir_x(-7,angle + 90);
		}
		if(x < AttackTarget.x){
			shootY = y + lengthdir_y(38,angle) + lengthdir_y(-7,angle + 90);
			chargeY = y + lengthdir_y(38,angle) + lengthdir_y(-7,angle + 90);
		} else{
			shootY = y + lengthdir_y(38,angle) + lengthdir_y(-7,angle + 90);
			chargeY = y + lengthdir_y(38,angle) + lengthdir_y(-7,angle + 90);
		}
		TargetAngle = point_direction(shootX,shootY,AttackTarget.x,AttackTarget.y);
	}
	
	
	var bullet = instance_create_layer(chargeX,chargeY,"sort_end",Obj_charge_bullet);
	with(bullet){
		image_xscale = 0.5 + other.charge / 100 * 0.5;
		image_yscale = 0.5 + other.charge / 100 * 0.5;
		damage = floor(other.charge / 100 * CONTAINER.player_chargeMaxDamage);
		dir = _angle;
		spd = 7;
		motion_set(dir,spd * global.timeScale);
		image_angle = _angle;
	
		chainDamage = CONTAINER.player_chainDamage;
		chain_lightning = CONTAINER.player_chain;
		critical_chance = CONTAINER.critical_chance;
	
		par = other.id;	
	
		fireshot = CONTAINER.player_fireshot;
	
		target = other.AttackTarget;
		sharp_shooting = CONTAINER.player_sharpshooting;
		cusion_max = CONTAINER.sharp_cusionCount;
		cusion_dist = CONTAINER.sharp_distance;
	}
	CONTAINER.bullet_count--;
	with(global.bullet_ui[CONTAINER.bullet_count]){
		event_perform(ev_other,ev_user0);
	}
	if(CONTAINER.bullet_count == 0){
		reload = true;
		CONTAINER.bullet_count = CONTAINER.bullet_maxCount;
		Alarm[3] = 90;
	}
}