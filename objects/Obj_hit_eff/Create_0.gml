/// @description Insert description here
// You can write your code in this editor
randomize();

channel_w = animcurve_get_channel(ac_hit_eff, 0);
channel_h = animcurve_get_channel(ac_hit_eff, 1);

cnt = 0;
eff_length = 10 + irandom(5);

size = 5 + irandom(10);

angle = random(360);

width_val = 1;
height_val = 1;