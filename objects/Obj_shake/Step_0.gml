/// @description Insert description here
// You can write your code in this editor
shake_cnt++;
if(shake_cnt > shake_duration){
	shake_cnt = shake_duration;
}

_channel = animcurve_get_channel(ac_shake_duration, 0);
_val = animcurve_channel_evaluate(_channel, shake_cnt / shake_duration);

_offsetX = Scr_perlin_noise_1d(shake_cnt + seed) * _val * max_offset;
_offsetY = Scr_perlin_noise_1d(shake_cnt + seed + 100) * _val * max_offset;
_offsetR = Scr_perlin_noise_1d(shake_cnt + seed + 1000) * _val * max_roll;

camera_set_view_pos(view_camera[0], camera_get_view_x(view_camera[0]) + _offsetX, camera_get_view_y(view_camera[0]) + _offsetY);

camera_set_view_angle(view_camera[0], _offsetR);
if (zoom > 0) Obj_camera.zoom_shake = zoom * _val;