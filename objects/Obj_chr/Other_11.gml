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
		damage = 4 + irandom(2);
		motion_set(other.angle,7);
		image_angle = other.angle;
	
		chainDamage = 3;
		chain_lightning = false;
		critical_chance = other.critical_chance;
	
		par = other.id;	
	
		fireshot = false;
	
		target = other.AttackTarget;
		sharp_shooting = true;
		cusion_max = 7;
		cusion_dist = 400;
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