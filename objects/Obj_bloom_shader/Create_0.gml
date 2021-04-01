/// @description Insert description here
// You can write your code in this editor


distort_sprite	= Spr_leopard_haze;

shader			= Sha_heat_haze;
distort_tex		= sprite_get_texture(distort_sprite, 0);
u_distort_tex	= shader_get_sampler_index(shader, "distort_tex");
u_time			= shader_get_uniform(shader, "time");
u_size			= shader_get_uniform(shader, "size");		// should be turned into a constant once you're happy with the setting
u_strength		= shader_get_uniform(shader, "strength");	// should be turned into a constant once you're happy with the setting

u_show_result	= shader_get_uniform(shader, "show_result");// debug only. remove this and related lines inside the shader

time			= 0;

shader_bloom_lum		= Sha_bloom_filter_luminance;
u_bloom_threshold		= shader_get_uniform(shader_bloom_lum, "bloom_threshold");
u_bloom_range			= shader_get_uniform(shader_bloom_lum, "bloom_range");

shader_blur				= Sha_blur_2_pass_gauss_lerp;
u_blur_steps			= shader_get_uniform(shader_blur, "blur_steps");
u_sigma					= shader_get_uniform(shader_blur, "sigma");
u_blur_vector			= shader_get_uniform(shader_blur, "blur_vector");
u_texel_size			= shader_get_uniform(shader_blur, "texel_size");

shader_bloom_blend		= Sha_bloom_blend;
u_bloom_intensity		= shader_get_uniform(shader_bloom_blend, "bloom_intensity");
u_bloom_darken			= shader_get_uniform(shader_bloom_blend, "bloom_darken");
u_bloom_saturation		= shader_get_uniform(shader_bloom_blend, "bloom_saturation");
u_bloom_texture			= shader_get_sampler_index(shader_bloom_blend, "bloom_texture");

bloom_texture			= -1;
srf_ping				= -1;
srf_pong				= -1;

gui_w					= display_get_gui_width();
gui_h					= display_get_gui_height();

app_w					= gui_w / 3;
app_h					= gui_h / 3;

texel_w					= 1 / app_w;
texel_h					= 1 / app_h;

srf_final				= -1;


blur_steps		= round(0.1 * 15) + 1;
sigma			= max(0.5, 0.0001);
bloom_threshold = 0.3;
bloom_range		= 0.1;
bloom_intensity	= 0.25 * 2;
bloom_darken	= 0.9;
bloom_saturation= 1 * 2;


size		= 0.2 * 4;
strength	= 0.2 * 0.01;

application_surface_draw_enable(false);