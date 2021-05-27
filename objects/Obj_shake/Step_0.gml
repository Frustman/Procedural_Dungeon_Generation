/// @description Insert description here
// You can write your code in this editor
shake_cnt += global.timeScale;
if(shake_cnt > shake_duration){
	instance_destroy(self);
}

_channel = animcurve_get_channel(ac_shake_duration, 0);
_val = animcurve_channel_evaluate(_channel, shake_cnt / shake_duration);

//_offsetX = Scr_perlin_noise_1d(shake_cnt / 100 + seed) * _val * max_offset;
//_offsetY = Scr_perlin_noise_1d(shake_cnt / 100 + seed + 100) * _val * max_offset;
//_offsetR = Scr_perlin_noise_1d(shake_cnt / 100 + seed + 1000) * _val * max_roll;

_offsetX = Scr_perlin_noise_1d(shake_cnt / 100 + seed) * max_offset;
_offsetY = Scr_perlin_noise_1d(shake_cnt / 100 + seed + 100) * max_offset;
_offsetR = Scr_perlin_noise_1d(shake_cnt / 100 + seed + 1000) * max_roll;

if(max_offset > 0) camera_set_view_pos(view_camera[0], Obj_camera.targetX - camera_get_view_width(view_camera[0]) / 2 + (_offsetX / (1 + zoom * _val)), Obj_camera.targetY  - camera_get_view_height(view_camera[0]) / 2 + (_offsetY / (1 + zoom * _val)));

if(max_roll > 0) camera_set_view_angle(view_camera[0], _offsetR);
if (zoom > 0) Obj_camera.zoom_shake = zoom * _val;