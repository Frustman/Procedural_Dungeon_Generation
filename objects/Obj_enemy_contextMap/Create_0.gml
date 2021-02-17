/// @description Insert description here
// You can write your code in this editor
event_inherited();

maxhp = 50;
hp = 50;
chr_diff = 100;

state_change = true;

chr_diff = point_distance(Obj_chr.x, Obj_chr.y, x, y);
in_sight = collision_line(x,y,Obj_chr.x,Obj_chr.y,Obj_wall,true,false) == noone;

stun = false;

targetX = x;
targetY = y;
targeted = false;

attack_delay = false;

AttackBy = noone;

real_index = 0;

dx = 0;
dy = 0;

sp_index = 0;

for(var i = 0; i < 16; i++){
	var degree = 360 / 16 * i;
	context_dir[i][0] = lengthdir_x(1, degree);
	context_dir[i][1] = lengthdir_y(1, degree);
	context_dir[i][2] = degree;
	context_map[i] = 0;
	context_dangerous[i] = false;
}
max_val = 0;
max_idx = 0;

_speed = random(0.5);

final_dir[0] = 0;
final_dir[1] = 0;

max_distance = 100;

image_index = 0;
image_speed = 0;