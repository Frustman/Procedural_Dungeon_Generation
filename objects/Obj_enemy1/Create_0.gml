/// @description Insert description here
// You can write your code in this editor
event_inherited();

player_path = path_add();
path_set_kind(player_path,0);

hp = 30;
chr_diff = 100;

state_change = true;

chr_diff = point_distance(Obj_chr.x, Obj_chr.y, x, y);
in_sight = collision_line(x,y,Obj_chr.x,Obj_chr.y,Obj_wall,true,false) == noone;

stun = false;

targetX = x;
targetY = y;
targeted = false;

AttackBy = noone;

dx = 0;
dy = 0;

sp_index = 0;


image_index = 0;
image_speed = 0;