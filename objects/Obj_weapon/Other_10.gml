/// @description Insert description here
// You can write your code in this editor

var target = Scr_interpolate_aim(shootX, shootY, bullet_dir);

if(target == noone){
	bullet_dir = angle;
} else {
	bullet_dir = point_direction(shootX, shootY, target.x, target.y);
}
