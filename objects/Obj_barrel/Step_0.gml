/// @description Insert description here
// You can write your code in this editor
if(hit){
	ac_cnt++;
	var _channel = animcurve_get_channel(ac_hit_scale, 0);
	var _val = animcurve_channel_evaluate(_channel, ac_cnt / 10);
	image_xscale = _val;
	image_yscale = _val;
} else {
	image_xscale = 1.0;
	image_yscale = 1.0;
}