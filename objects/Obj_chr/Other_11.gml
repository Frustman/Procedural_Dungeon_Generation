/// @description Insert description here
// You can write your code in this editor
if(Obj_valueContainer.bullet_count > 0 && !reload){
	audio_play_sound(Pistol_Shot_02,0,false);
	instance_create_depth(shootX,shootY, -1, Obj_Catridge);
	shoot = true;
	anim_index = 0;
	alarm[1] = 20;
	var bullet = instance_create_depth(shootX,shootY,0,Obj_bullet_eff);
	with(bullet){
		damage = Obj_valueContainer.player_bulletDamage;
		motion_set(other.angle,7);
		image_angle = other.angle;
	
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