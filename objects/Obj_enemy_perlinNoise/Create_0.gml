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

seed = irandom(300);

_angle = 0;
_speed = 0;

image_index = 0;
image_speed = 0;