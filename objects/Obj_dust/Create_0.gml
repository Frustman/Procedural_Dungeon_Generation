/// @description Insert description here
// You can write your code in this editor

image_speed = random_range(1/2,1/4);
image_index = irandom(5);


vx = random_range(-0.2,0.2);
vy = random_range(-0.2,0.2);

image_xscale = choose(1,-1);
image_yscale = choose(1,-1);
sprite_index = choose(Spr_dustA,Spr_dustB);
image_speed = global.timeScale;

angle_diff = irandom(20) - 10;