/// @description Insert description here
// You can write your code in this editor


shader_type		= 0;

if (shaders_are_supported()) {
	if (shader_is_compiled(Sha_bloom_MRT_luminance))	shader_type = 2;
	else if (shader_is_compiled(Sha_bloom_filter_luminance))	shader_type = 1;
}

distort_sprite	= Spr_leopard_haze;

shader			= Sha_heat_haze;
distort_tex		= sprite_get_texture(distort_sprite, 0);
u_distort_tex	= shader_get_sampler_index(shader, "distort_tex");
u_time			= shader_get_uniform(shader, "time");
u_size			= shader_get_uniform(shader, "size");		// should be turned into a constant once you're happy with the setting
u_strength		= shader_get_uniform(shader, "strength");	// should be turned into a constant once you're happy with the setting

u_show_result	= shader_get_uniform(shader, "show_result");// debug only. remove this and related lines inside the shader

time			= 0;

if(shader_type == 1){
	shader_bloom_lum		= Sha_bloom_filter_luminance;
	u_bloom_threshold		= shader_get_uniform(shader_bloom_lum, "bloom_threshold");
	u_bloom_range			= shader_get_uniform(shader_bloom_lum, "bloom_range");
} else if (shader_type == 2){
	shader_bloom_lum		= Sha_bloom_MRT_luminance;
	u_bloom_intensity		= shader_get_uniform(shader_bloom_lum, "bloom_layer_intensity");
	u_bloom_threshold		= shader_get_uniform(shader_bloom_lum, "bloom_layer_threshold");
	u_bloom_range			= shader_get_uniform(shader_bloom_lum, "bloom_layer_range");
}

if(shader_type > 0){
	shader_blur				= Sha_blur_2_pass_gauss_lerp;
	u_blur_steps			= shader_get_uniform(shader_blur, "blur_steps");
	u_sigma					= shader_get_uniform(shader_blur, "sigma");
	u_blur_vector			= shader_get_uniform(shader_blur, "blur_vector");
	u_texel_size			= shader_get_uniform(shader_blur, "texel_size");

	shader_blur_app			= Sha_blur_app;
	u_blurA_steps			= shader_get_uniform(shader_blur_app, "blur_steps");
	u_blurA_vector			= shader_get_uniform(shader_blur_app, "blur_vector");
	u_sigma_app				= shader_get_uniform(shader_blur_app, "sigma");
	u_texelA_size			= shader_get_uniform(shader_blur_app, "texel_size");
	u_app_wh				= shader_get_uniform(shader_blur_app, "app_wh");

	shader_bloom_blend		= Sha_bloom_blend;
	u_bloom_intensity		= shader_get_uniform(shader_bloom_blend, "bloom_intensity");
	u_bloom_darken			= shader_get_uniform(shader_bloom_blend, "bloom_darken");
	u_bloom_saturation		= shader_get_uniform(shader_bloom_blend, "bloom_saturation");
	u_bloom_texture			= shader_get_sampler_index(shader_bloom_blend, "bloom_texture");


	sprite_wave				= Spr_normal_map; //_256

	shader_wave				= Sha_distortion_wave;
	u_fx_strength			= shader_get_uniform(shader_wave, "fx_strength");
	u_aspect				= shader_get_uniform(shader_wave, "aspect");
	u_aberration			= shader_get_uniform(shader_wave, "aberration");
	u_tex_waves				= shader_get_sampler_index(shader_wave, "tex_waves");
	aspect					= camera_get_view_width(view_camera[0]) / camera_get_view_height(view_camera[0]);
	tex_waves				= -1;

	// wave parameters:
	wave_life				= 20;	// life in seconds
	wave_scale_max			= 800 / sprite_get_width(sprite_wave);		// size in pixels in room space
	enum waveparam {xx, yy, age, scale, alpha, life, maxScale}				// should be in unreferenced script rather

	// create waves list which will hold lists for each active wave.
	// those lists will be created in step event on click
	// and will age and be deleted in step event as well
	list_of_waves			= ds_list_create();

	// prepare waves surface
	srf_waves				= -1;
	srf_waves_scale			= 1/4;
	view_w					= camera_get_view_width(view_camera[0]);
	view_h					= camera_get_view_height(view_camera[0]);

	bloom_texture			= -1;
	srf_ping				= -1;
	srf_pong				= -1;
	srf_ping_app			= -1;
	srf_pong_app			= -1;
	srf_distortion			= -1;
	srf_bloom				= -1;
	srf_final				= -1;

	gui_w					= display_get_gui_width();
	gui_h					= display_get_gui_height();

	app_w					= gui_w / 3;
	app_h					= gui_h / 3;

	texel_w					= 1 / app_w;
	texel_h					= 1 / app_h;



	blur_steps		= round(0.15 * 15) + 1;
	sigma			= max(0.1, 0.0001);
	bloom_threshold = 0.2;
	bloom_range		= 0.4;
	bloom_intensity	= 0.25 * 2;
	bloom_darken	= 0.9;
	bloom_saturation= 3;


	size		= 0.2 * 4;
	strength	= 0.2 * 0.01;
}
application_surface_draw_enable(false);
