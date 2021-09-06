/// @description Insert description here
// You can write your code in this editor

if (shader_type >= 1) { // GLSL ES || GLSL || HLSL
	if (!surface_exists(srf_ping)) {
		srf_ping = surface_create(app_w, app_h);
		bloom_texture = surface_get_texture(srf_ping);
	}
	if (!surface_exists(srf_pong)) {
		srf_pong = surface_create(app_w, app_h);
	}
}

if (shader_type >= 2) { // GLSL || HLSL
	shader_set(shader_bloom_lum);
	surface_set_target_ext(0, application_surface);
	surface_set_target_ext(1, srf_ping);
	camera_apply(view_camera[0]);
}