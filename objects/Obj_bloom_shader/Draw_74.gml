/// @description Insert description here
// You can write your code in this editor
/*var blur_steps		= round(0.1 * 15) + 1;
var sigma			= max(0.5, 0.0001);
var bloom_threshold = 0.3;
var bloom_range		= 0.1;
var bloom_intensity	= 0.25 * 2;
var bloom_darken	= 0.9;
var bloom_saturation= 1 * 2;


time			+= 0.2 * 0.02;
var size		= 0.2 * 4;
var strength	= 0.2 * 0.01;*/

time			+= 0.2 * 0.02 * global.timeScale;

// DRAW:
//-----------------------------------------------------------------------------
if (!surface_exists(srf_ping)) {
	srf_ping = surface_create(gui_w, gui_h);
	bloom_texture = surface_get_texture(srf_ping);
}
if (!surface_exists(srf_pong)) {
	srf_pong = surface_create(gui_w, gui_h);
}
if (!surface_exists(srf_ping_app)) {
	srf_ping_app = surface_create(gui_w, gui_h);
}
if (!surface_exists(srf_pong_app)) {
	srf_pong_app = surface_create(gui_w, gui_h);
}
if (!surface_exists(srf_final)) {
	srf_final = surface_create(gui_w, gui_h);
}
if (!surface_exists(srf_distortion)) {
	srf_distortion = surface_create(gui_w, gui_h);
}


// 1st pass: Draw brights to bloom surface:
// AppSrf -> srf_ping
shader_set(shader_bloom_lum);
	shader_set_uniform_f(u_bloom_threshold,		bloom_threshold);
	shader_set_uniform_f(u_bloom_range,			bloom_range);
	
	surface_set_target(srf_ping);
		draw_surface(application_surface, 0, 0);
	surface_reset_target();
	
// 2nd pass: blur horizontally
// srf_ping -> srf_pong
gpu_set_tex_filter(true);
shader_set(shader_blur);
	shader_set_uniform_f(u_blur_steps,		blur_steps);
	shader_set_uniform_f(u_sigma,			sigma);
	shader_set_uniform_f(u_blur_vector,		1, 0);
	shader_set_uniform_f(u_texel_size,		texel_w, texel_h);
	
	surface_set_target(srf_pong);
		draw_surface(srf_ping, 0, 0);
	surface_reset_target();
	
// 3rd pass: blur vertically
// srf_pong -> srf_ping
	shader_set_uniform_f(u_blur_vector,		0, 1);
	
	surface_set_target(srf_ping);
		draw_surface(srf_pong, 0, 0);
	surface_reset_target();
	
gpu_set_tex_filter(false);

// 4th pass: Blend bloom surface with app surface
// AppSrf & srf_ping -> screen
surface_set_target(srf_final);
shader_set(shader_bloom_blend);
	shader_set_uniform_f(u_bloom_intensity, bloom_intensity);
	shader_set_uniform_f(u_bloom_darken, bloom_darken);
	shader_set_uniform_f(u_bloom_saturation, bloom_saturation);
	texture_set_stage(u_bloom_texture, bloom_texture);
	gpu_set_tex_filter_ext(u_bloom_texture, true);
	draw_surface(application_surface, 0, 0);	
shader_reset();
surface_reset_target();
gpu_set_tex_filter_ext(u_distort_tex, true);



surface_set_target(srf_ping_app);
	draw_surface(srf_final, 0, 0);
surface_reset_target();


if(CONTAINER.game_surface_blur_sigma > 0){
	gpu_set_tex_filter(true);
	shader_set(shader_blur_app);
		shader_set_uniform_f(u_blurA_steps,		blur_steps);
		shader_set_uniform_f(u_blurA_vector,	1, 0);
		shader_set_uniform_f(u_texelA_size,		texel_w, texel_h);
		shader_set_uniform_f(u_sigma_app,		CONTAINER.game_surface_blur_sigma);
		shader_set_uniform_f(u_app_wh,			gui_w / 2, gui_h / 2);
	
		surface_set_target(srf_pong_app);
			draw_surface(srf_ping_app, 0, 0);
		surface_reset_target();
	
		shader_set_uniform_f(u_blur_vector,		0, 1);
		surface_set_target(srf_ping_app);
			draw_surface(srf_pong_app, 0, 0);
		surface_reset_target();
	
	gpu_set_tex_filter(false);
}
surface_set_target(srf_distortion);
shader_set(shader);
	texture_set_stage(u_distort_tex, distort_tex);
	shader_set_uniform_f(u_time, time);
	shader_set_uniform_f(u_size, size);					// should be turned into a constant once you're happy with the setting
	shader_set_uniform_f(u_strength, strength);			// should be turned into a constant once you're happy with the setting
	draw_surface(srf_ping_app, 0, 0);
shader_reset();
surface_reset_target();


var wave_list_size = ds_list_size(list_of_waves);

if (wave_list_size <= 0) {
	draw_surface(srf_distortion, 0, 0);
} else {
	// set values based on sliders. In a game you'd use constants inside the shader instead
	var fx_strength	= 0.85 * 0.2 - 0.1;
	var aberration	= 0.65 * 2 - 1;
		
	// create waves surface:
	if (!surface_exists(srf_waves)) {
		srf_waves = surface_create(view_w * srf_waves_scale, view_h * srf_waves_scale);
		tex_waves = surface_get_texture(srf_waves);
	}
	
	gpu_set_texfilter(true);
	
	surface_set_target(srf_waves);
		draw_clear_alpha($FF7F7F, 1);
		gpu_set_blendmode_ext(bm_dest_color, bm_src_color);
		shader_set(Sha_add_normal);
		
		var w, this_wave;
		//var wave_list_size = ds_list_size(list_of_waves);
		for (w = 0; w < wave_list_size; w++) {
			this_wave = list_of_waves[|w];
			draw_sprite_ext(sprite_wave, 0,
							(this_wave[|waveparam.xx] - camera_get_view_x(view_camera[0])) * srf_waves_scale,
							(this_wave[|waveparam.yy] - camera_get_view_y(view_camera[0])) * srf_waves_scale,
							this_wave[|waveparam.scale] * srf_waves_scale,
							this_wave[|waveparam.scale] * srf_waves_scale,
							0, c_white, this_wave[|waveparam.alpha]);
		}
		
		shader_reset();
		gpu_set_blendmode(bm_normal);
	surface_reset_target();
	
	// draw application surface with waves surface as 2nd texture:
	shader_set(shader_wave);
		shader_set_uniform_f(u_fx_strength, fx_strength);
		shader_set_uniform_f(u_aspect, aspect);
		shader_set_uniform_f(u_aberration, aberration);
		texture_set_stage(u_tex_waves, tex_waves);
		draw_surface(srf_distortion, 0, 0);
	shader_reset();
	
	gpu_set_texfilter(false);
	
}
