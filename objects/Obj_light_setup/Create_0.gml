/// @description Insert description here
// You can write your code in this editor
//turn of automaic drawing of application surface


surface_resize(application_surface,720,405);
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
shad_surf = noone;
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
