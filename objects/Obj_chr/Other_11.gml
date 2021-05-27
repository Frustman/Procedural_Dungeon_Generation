/// @description Insert description here
// You can write your code in this editor
if(Obj_valueContainer.bullet_count > 0 && !reload){
	Scr_shake(2,0,3,15);
	audio_play_sound(Pistol_Shot_02,0,false);
	
	AttackTarget = Scr_interpolate_aim(x,y,angle);
	TargetAngle = angle;
	gun_index = 0;
	
	if(AttackTarget == noone){
		if(sign(image_xscale) > 0){
			shootX = x + lengthdir_x(20,angle + 90 - 79.215702132437);
			chargeX = x + lengthdir_x(30,angle + 90 - 79.215702132437);
		} else{
			shootX = x + lengthdir_x(20,angle - 90 + 79.215702132437);
			chargeX = x + lengthdir_x(30,angle - 90 + 79.215702132437);
		}
		if(sign(image_xscale) > 0){
			shootY = y + lengthdir_y(20,angle + 90 - 79.215702132437);
			chargeY = y + lengthdir_y(30,angle + 90 - 79.215702132437);
		} else{
			shootY = y + lengthdir_y(20,angle - 90 + 79.215702132437);
			chargeY = y + lengthdir_y(30,angle - 90 + 79.215702132437);
		}
	} else if(AttackTarget != noone && instance_exists(AttackTarget)){
		if(x < AttackTarget.x){
			shootX = x + lengthdir_x(20,angle + 90 - 79.215702132437);
			chargeX = x + lengthdir_x(30,angle + 90 - 79.215702132437);
		} else{
			shootX = x + lengthdir_x(20,angle - 90 + 79.215702132437);
			chargeX = x + lengthdir_x(30,angle - 90 + 79.215702132437);
		}
		if(x < AttackTarget.x){
			shootY = y + lengthdir_y(20,angle + 90 - 79.215702132437);
			chargeY = y + lengthdir_y(30,angle + 90 - 79.215702132437);
		} else{
			shootY = y + lengthdir_y(20,angle - 90 + 79.215702132437);
			chargeY = y + lengthdir_y(30,angle - 90 + 79.215702132437);
		}
		shootX = x;
		shootY = y;
		TargetAngle = point_direction(shootX,shootY,AttackTarget.x,AttackTarget.y);
	}
	
	var _angle = TargetAngle;
	
	with(instance_create_layer(shootX,shootY, "sort_end", Obj_Catridge)){
		hspd = -sign(lengthdir_x(1,_angle)) * random(3);
	}
	shoot = true;
	Alarm[1] = 20;
	if(Obj_valueContainer.player_flameShot == true){
		with(instance_create_layer(x,y,"sort_end",Obj_flame_pen_eff)){
			damage = 5;
			par = other.id;
			dir = _angle;
		}
	} else{
		var bullet = instance_create_layer(shootX,shootY,"sort_end",Obj_bullet_eff);
		with(bullet){
			damage = Obj_valueContainer.player_bulletDamage;
			motion_set(_angle,15);
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
	}
	var fx = lengthdir_x(1.5,_angle - 180);
	var fy = lengthdir_y(1.5,_angle - 180);
	Scr_force_update([fx,fy]);
	
	Obj_valueContainer.bullet_count--;
	with(global.bullet_ui[Obj_valueContainer.bullet_count]){
		event_perform(ev_other,ev_user0);
	}
	if(Obj_valueContainer.bullet_count == 0){
		reload = true;
		Obj_valueContainer.bullet_count = Obj_valueContainer.bullet_maxCount;
		Alarm[3] = 90;
	}
}