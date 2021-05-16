/// @description Insert description here
// You can write your code in this editor
event_inherited();

maxhp = 50;
hp = 50;
chr_diff = 100;

state_change = true;

chr_diff = point_distance(Obj_chr.x, Obj_chr.y, x, y);
in_sight = collision_line(x,y,Obj_chr.x,Obj_chr.y,Obj_wall,true,false) == noone;

state = ai_state.chase;

stun = false;

targetX = x;
targetY = y;
targeted = false;

attack_delay = false;

AttackBy = noone;

real_index = 0;

dx = 0;
dy = 0;

dir[0] = 1;
dir[1] = 0;

sp_index = 0;

ray_count = 16;
ray_distance = 20;

ray_left = false;

for(var i = 0; i < ray_count; i++){
	var degree = point_direction(0,0,dir[0],dir[1]) + 360 / ray_count * i;
	context_dir[i][0] = lengthdir_x(1, degree);
	context_dir[i][1] = lengthdir_y(1, degree);
	context_dir[i][2] = degree;
	context_map[i] = 0;
	context_dangerous[i] = false;
}
max_val = -1;
max_idx = 0;

max_val_dir = -1;
max_idx_dir = 0;

strafe_range = 70;

_speed = 0.7;
player_dist = 0;

context_interval = 3;
context_val = 0;

force[0] = 0;
force[1] = 0;

max_distance = 20;

image_index = 0;
image_speed = 0;