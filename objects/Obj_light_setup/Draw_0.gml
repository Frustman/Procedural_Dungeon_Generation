/// @description Insert description here
// You can write your code in this editor
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

//Shadow surface setup
if (!surface_exists(shad_surf)){
	shad_surf = surface_create(screenW,screenH);
}

show_debug_message("camera matrix : " + string(camera_get_view_mat(view_camera[0])));
show_debug_message("matrix world(out) : " + string(matrix_get(matrix_world)));
//matrix_set(matrix_world,matrix_multiply(camera_get_view_mat(view_camera[0]), matrix_build(-1,-1,-1,-1,-1,-1,1,1,1)));
matrix_set(matrix_world,matrix_build(-_vx,-_vy,0,0,0,0,1,1,1));

show_debug_message("matrix world(in) : " + string(matrix_get(matrix_world)));
//Draw Normal (EDIT: this should be below the matrix set)
/*
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
draw_surface_ext(application_surface,_vx,_vy,1,1,0,c_white,0.2);
with(Obj_light){
	
	//Draw the shadows (AKA light blockers)
	gpu_set_blendmode_ext_sepalpha(bm_zero,bm_one,bm_one,bm_one);
	shader_set(Sha_shadow);
	shader_set_uniform_f(_u_pos2,x,y);
	vertex_submit(_vb,pr_trianglelist,-1);
	
	//Draw the Light
	gpu_set_blendmode_ext_sepalpha(bm_inv_dest_alpha,bm_one,bm_zero,bm_zero);
	shader_set(Sha_light);
	shader_set_uniform_f(_u_pos,x,y);
	shader_set_uniform_f(_u_zz,size);
	shader_set_uniform_f(_u_str,str);
	shader_set_uniform_f(_u_fov,fov);
	shader_set_uniform_f(_u_dir,dir);
	//texture_set_stage(_u_nmap,surface_get_texture(global.n_surf));
	//draw_rectangle_color(_vx,_vy,_vx+320,_vy+180,color,color,color,color,0); //canvas for drawing the light
	draw_surface(application_surface,_vx,_vy);
}
shader_reset();
surface_reset_target();

matrix_set(matrix_world,matrix_build(0,0,0,0,0,0,1,1,1));

show_debug_message("matrix world(last) : " + string(matrix_get(matrix_world)));

//Draw and blend the shadow surface to the application surface
gpu_set_blendmode_ext(bm_dest_alpha,bm_inv_dest_alpha);
draw_surface(shad_surf,_vx, _vy);

//reset shader and blendmode 
gpu_set_blendmode(bm_normal);