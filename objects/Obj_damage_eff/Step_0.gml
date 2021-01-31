/// @description Insert description here
// You can write your code in this editor
depth = -500;
cnt++;
var _channel = animcurve_get_channel(ac_damage_ypos, 0);
var _val = animcurve_channel_evaluate(_channel, cnt / 30);
y = curY - _val * up_speed;
image_xscale = 1.5 - power(1 - cnt/30, 5);
image_yscale = 1.5 - power(1 - cnt/30, 5);