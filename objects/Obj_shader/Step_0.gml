/// @description Insert description here
// You can write your code in this editor
// WAVE AGE:
//-----------------------------------------------------------------------------
view_w			= camera_get_view_width(view_camera[0]);
view_h			= camera_get_view_height(view_camera[0]);

var wave_list_size = ds_list_size(list_of_waves);
if (wave_list_size > 0) {
	var w, this_wave;
	for (w = 0; w < wave_list_size; w++) {
		this_wave = list_of_waves[|w];
		this_wave[|waveparam.age]	+= 0.5;
		
		if (this_wave[|waveparam.age] < wave_life) {
			this_wave[|waveparam.scale]	= Scr_cubic_out_simple(this_wave[|waveparam.age] / wave_life) * wave_scale_max;
			this_wave[|waveparam.alpha]	= 1 - Scr_quadratic_out_simple(this_wave[|waveparam.age] / wave_life);
		} else {
			ds_list_destroy(this_wave);
			ds_list_delete(list_of_waves, w);
			w--;
			wave_list_size--;
		}
	}
}