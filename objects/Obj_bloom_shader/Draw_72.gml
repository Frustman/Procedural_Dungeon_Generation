/// @description Insert description here
// You can write your code in this editor

if (!surface_exists(srf_ping)) {
	srf_ping = surface_create(gui_w, gui_h);
	bloom_texture = surface_get_texture(srf_ping);
}
if (!surface_exists(srf_pong)) {
	srf_pong = surface_create(gui_w, gui_h);
}

shader_set(shader_bloom_lum);
surface_set_target_ext(0, application_surface);
surface_set_target_ext(1, srf_ping);