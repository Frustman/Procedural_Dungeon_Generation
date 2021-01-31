/// @description Insert description here
// You can write your code in this editor
audio_play_sound(Pistol_Shot_02,0,false);
instance_create_depth(shootX,shootY, -1, Obj_Catridge);
shoot = true;
anim_index = 0;
alarm[1] = 20;
var bullet = instance_create_depth(shootX,shootY,0,Obj_bullet_eff);
with(bullet){
	damage = 5;
	image_angle = other.angle;
	motion_set(other.angle,15);
}