/// @description Insert description here
// You can write your code in this editor

width_val = animcurve_channel_evaluate(channel_w, cnt / eff_length) * size;
height_val = animcurve_channel_evaluate(channel_h, cnt / eff_length) * size;
cnt++;

if(cnt > eff_length) instance_destroy(self);