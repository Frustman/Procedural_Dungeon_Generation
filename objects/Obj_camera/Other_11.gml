/// @description Insert description here
// You can write your code in this editor

d3d_mode = !d3d_mode;

if(d3d_mode == true){
	camera_destroy(view_camera[0]);
	var cam = camera_create();
	var mat_proj = matrix_build_projection_perspective_fov(fov, cam_width / cam_height, 1, 32000);
	camera_set_proj_mat(cam, mat_proj);
	view_set_camera(0, cam);


	layer_script_end(layer_get_id("Assets_deco"),Scr_z_tilt_reset);
	layer_script_end(layer_get_id("Tiles_ground"),Scr_z_tilt_set);
	Scr_tilt_layer_sprite();
} else {
	camera_destroy(view_camera[0]);
	var cam = camera_create();
	camera_set_view_size(cam, cam_width, cam_height);
	camera_set_view_border(cam, cam_width / 2, cam_height / 2);
	view_set_camera(0, cam);
}




/*if(instance_exists(Obj_chr)){
	instance_deactivate_region((DG_WIDTH * (cur_room div 10)) * CELL_WIDTH,(DG_HEIGHT * (cur_room % 10)) * CELL_HEIGHT,DG_WIDTH * CELL_WIDTH, DG_HEIGHT * CELL_HEIGHT, false, true);
	instance_activate_region((DG_WIDTH * (cur_room div 10)) * CELL_WIDTH,(DG_HEIGHT * (cur_room % 10)) * CELL_HEIGHT,DG_WIDTH * CELL_WIDTH, DG_HEIGHT * CELL_HEIGHT, true);
	instance_activate_object(Obj_shake);
	instance_activate_object(Obj_controller);
	instance_activate_object(Obj_bloom_shader);
	instance_activate_object(Obj_valueContainer);
	instance_activate_object(Obj_mapController);
	instance_activate_object(Obj_depth_sorting);
	instance_activate_object(Obj_status);
	instance_activate_object(Obj_chr);
	instance_activate_object(Obj_bullet_ui);
	instance_activate_object(Obj_uniform_setter);
	instance_activate_object(Obj_pause);
	instance_activate_object(Obj_item_sequence);
	
	Obj_mapController.mapW_target = 3.0;
	Obj_mapController.mapH_target = 3.0;
	Obj_mapController.mini_resize = true;
	Obj_mapController.alarm[1] = 120;
}*/