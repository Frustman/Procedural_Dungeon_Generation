
//--------------------------------------------------------

#region variable setting

rate = 0.1; // lerp rate

cam_width = 720;
cam_height = 405;

cam_zoom = 1.0;

focus_id = -1;

zoom_shake = 0;

targetX = x;
targetY = y;

targetTimeScale = 1.0;

globalvar screenX;
globalvar screenY;
globalvar screenW;
globalvar screenH;

screenW = 720;
screenH = 405;

z = -810;

fov = 30;

ddx = 0;
ddy = 0;

d3d_mode = false;

#endregion

//--------------------------------------------------------

#region camera setting

if(d3d_mode == true){
	camera_destroy(view_camera[0]);
	var cam = camera_create();
	var mat_proj = matrix_build_projection_perspective_fov(fov, cam_width / cam_height, 1, 32000);
	camera_set_proj_mat(cam, mat_proj);
	view_set_camera(0, cam);

	layer_script_end(layer_get_id("Assets_deco"),Scr_z_tilt_reset);
	layer_script_end(layer_get_id("Tiles_ground"),Scr_z_tilt_set);
	Scr_tilt_layer_sprite();
}

#endregion

//--------------------------------------------------------