/// @description Insert description here
// You can write your code in this editor
audio_play_sound(Pistol_Shot_02,0,false);
instance_create_depth(shootX,shootY, -1, Obj_Catridge);
shoot = true;
anim_index = 0;
alarm[1] = 20;
var bullet = instance_create_depth(shootX,shootY,0,Obj_bullet_eff);
with(bullet){
	damage = 4 + irandom(5);
	motion_set(other.angle,7);
	image_angle = other.angle;
	
	chainDamage = 3;
	chain_lightning = false;
	
	par = other.id;	
	
	fireshot = false;
	
	target = other.AttackTarget;
	sharp_shooting = false;
	cusion_max = 7;
	cusion_dist = 400;
}