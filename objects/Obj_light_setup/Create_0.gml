/// @description Insert description here
// You can write your code in this editor
//turn of automaic drawing of application surface


surface_resize(application_surface,720,405);
display_set_gui_maximize();
application_surface_draw_enable(false);

//Shader uniform variable setup
u_pos = shader_get_uniform(Sha_light,"u_pos");
u_zz = shader_get_uniform(Sha_light,"zz");
u_str = shader_get_uniform(Sha_light,"u_str");
u_dir = shader_get_uniform(Sha_light,"u_dir");
u_fov = shader_get_uniform(Sha_light,"u_fov");

u_pos2 = shader_get_uniform(Sha_shadow,"u_pos");

//Vertex format and buffer setup
vertex_format_begin();
vertex_format_add_position_3d();
vf = vertex_format_end();
vb = vertex_create_buffer();

//shadow surface variable declaration
shad_surf = noone;
srf_temp = noone;
srf_light = noone;
srf_app = noone;


//Background layer functions
function BGbegin(){
	gpu_set_colorwriteenable(1,1,1,0);
}

function BGend(){
	gpu_set_colorwriteenable(1,1,1,1);
}

/*var _bg_layer = layer_get_id("Tiles_2");
var _bg_layer2 = layer_get_id("Asset_deco");
layer_script_begin(_bg_layer,BGbegin);
layer_script_end(_bg_layer,BGend);*/

global.s_surf = noone;
global.n_surf = noone;
global.vx = 0;
global.vy = 0;
/*
function Nbegin(){
	if (!surface_exists(global.n_surf)){
		global.n_surf = surface_create(640,360);
	}
	surface_set_target(global.n_surf);
	matrix_set(matrix_world,matrix_build(-global.vx,-global.vy,0,0,0,0,1,1,1));
	draw_clear_alpha(c_white,0);
}

function Nend(){
	surface_reset_target();
	matrix_set(matrix_world,matrix_build(0,0,0,0,0,0,1,1,1));
}

var _n_layer = layer_get_id("Normal");
layer_script_begin(_n_layer,Nbegin);
layer_script_end(_n_layer,Nend);

*/



#region bloom

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

gui_w					= screenW;
gui_h					= screenH;

app_w					= gui_w / 3;
app_h					= gui_h / 3;

texel_w					= 1 / app_w;
texel_h					= 1 / app_h;


#endregion
