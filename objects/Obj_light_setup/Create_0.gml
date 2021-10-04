/// @description Insert description here
// You can write your code in this editor
//turn of automaic drawing of application surface


//surface_resize(application_surface,720,405);
display_set_gui_maximize();

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
srf_light = noone;
srf_wall = noone;
srf_wall_ping = noone;
srf_wall_pong = noone;

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
global.w_surf = noone;
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




shader_blur				= Sha_blur_2_pass_gauss_lerp;
u_blur_steps			= shader_get_uniform(shader_blur, "blur_steps");
u_sigma					= shader_get_uniform(shader_blur, "sigma");
u_blur_vector			= shader_get_uniform(shader_blur, "blur_vector");
u_texel_size			= shader_get_uniform(shader_blur, "texel_size");

//blur_steps		= round(0.15 * 15) + 1;
blur_steps		= round(0.15 * 15) + 1.5;
//sigma			= max(0.1, 0.0001);
sigma			= 0.2;

texel_w					= 1 / screenW / 2;
texel_h					= 1 / screenH / 2;