/// @description Insert description here
// You can write your code in this editor
if(!recur)	cnt += global.timeScale;
else cnt -= global.timeScale;

var _channel_E = animcurve_get_channel(ac_exponential, 0);
var _channel_S = animcurve_get_channel(ac_item_sequence, 0);

_val_E = animcurve_channel_evaluate(_channel_E, cnt / sequence_length);
_val_S = animcurve_channel_evaluate(_channel_S, cnt / sequence_length);

if(cnt >= sequence_length * 3 / 4){
	recur = true;
}
if(cnt < 0){
	instance_destroy(self);
}