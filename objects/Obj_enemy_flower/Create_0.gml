/// @description Insert description here
// You can write your code in this editor
event_inherited();

maxhp = 20;
hp = 20;
chr_diff = 100;

state_change = true;

chr_diff = point_distance(Obj_chr.x, Obj_chr.y, x, y);
in_sight = collision_line(x,y,Obj_chr.x,Obj_chr.y,Obj_wall,true,false) == noone;

stun = false;

real_index = 0;

targetX = x;
targetY = y;
targeted = false;

AttackBy = noone;

dx = 0;
dy = 0;

sp_index = 0;


image_index = 0;
image_speed = 0;