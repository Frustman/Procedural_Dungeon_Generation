//Local variables setup
var _u_pos = u_pos;
var _u_zz = u_zz;
var _u_str = u_str;
var _u_dir = u_dir;
var _u_fov = u_fov;
var _u_pos2 = u_pos2;
var _vb = vb;
var _vx = global.vx;
var _vy = global.vy;
var _u_nmap = u_nmap;

//Shadow surface setup
if (!surface_exists(shad_surf)){
	shad_surf = surface_create(screenW, screenH);
}

var mat = matrix_get(matrix_world);

matrix_set(matrix_world,matrix_build(-_vx,-_vy,0,0,0,0,1,1,1));
/*
//Draw Normal (EDIT: this should be below the matrix set)
surface_set_target(global.n_surf);
shader_set(shd_norm);
with(obj_robo){
	draw_self();	
}
shader_reset();
surface_reset_target();*/

//Draw lights and shadows
surface_set_target(shad_surf);
draw_clear_alpha(c_black,0);
//draw_surface_ext(application_surface,_vx,_vy,0.5,0.5,0,c_white,0.2);
with(Obj_light){
	
	//Draw the shadows (AKA light blockers)
	//gpu_set_blendmode_ext_sepalpha(bm_zero,bm_one,bm_one,bm_one);
	gpu_set_blendmode_ext_sepalpha(bm_zero,bm_one,bm_one,bm_one);
	//gpu_set_blendmode_ext_sepalpha(bm_zero,bm_one,bm_inv_dest_alpha,bm_dest_alpha);
	shader_set(Sha_shadow);
	shader_set_uniform_f(_u_pos2,x,y);
	vertex_submit(_vb,pr_trianglelist,-1);

	//Draw the Light
	//gpu_set_blendmode_ext_sepalpha(bm_inv_dest_alpha,bm_one,bm_zero,bm_zero);
	//gpu_set_blendmode_ext_sepalpha(bm_inv_dest_alpha,bm_one,bm_inv_dest_alpha,bm_dest_alpha); G
	gpu_set_blendmode_ext_sepalpha(bm_inv_dest_alpha,bm_one,bm_zero,bm_zero);
	//gpu_set_blendmode(bm_add);
	shader_set(Sha_light);
	shader_set_uniform_f(_u_pos,x,y);
	shader_set_uniform_f(_u_zz,size);
	shader_set_uniform_f(_u_str,str);
	shader_set_uniform_f(_u_fov,fov);
	shader_set_uniform_f(_u_dir,dir);
	//draw_rectangle_color(_vx,_vy,_vx+screenW,_vy+screenH,color,color,color,color,0); //canvas for drawing the light
	draw_surface_ext(application_surface,_vx,_vy,0.5,0.5,0,color,1);
	gpu_set_blendmode(bm_normal);
	shader_reset();
	shader_set(Sha_bloom_hlsl_luminance);
}
surface_reset_target();


matrix_set(matrix_world, mat);
//matrix_set(matrix_world,matrix_build(0,0,0,0,0,0,1,1,1));

global.s_surf = shad_surf;