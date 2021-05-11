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
can_attack = true;

AttackBy = noone;

real_index = 0;

dx = 0;
dy = 0;

relax = false;
alarm[1] = 45;
alarm[2] = 600;

spawn_radius = 90;

seed = irandom(300);

_angle = random(360);
_speed = 0;

crit = false;

spawnX = x;
spawnY = y;

image_index = 0;
image_speed = 0;