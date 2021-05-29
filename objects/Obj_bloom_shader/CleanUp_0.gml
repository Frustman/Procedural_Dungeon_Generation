/// @description Insert description here
// You can write your code in this editor

if (surface_exists(srf_ping)) surface_free(srf_ping);
if (surface_exists(srf_pong)) surface_free(srf_pong);
if (surface_exists(srf_distortion)) surface_free(srf_distortion);
if (surface_exists(srf_bloom)) surface_free(srf_bloom);
if (surface_exists(srf_final)) surface_free(srf_final);

application_surface_draw_enable(true);
gpu_set_tex_filter(false);

if (ds_exists(list_of_waves, ds_type_list)) {
	for (var w = 0; w < ds_list_size(list_of_waves); w++) {
		if (ds_exists(list_of_waves[|w], ds_type_list)) {
			ds_list_destroy(list_of_waves[|w]);
		}
	}
}