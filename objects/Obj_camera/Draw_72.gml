/// @description Insert description here
// You can write your code in this editor
if(d3d_mode == true){

	var camera = view_camera[0]

	var camDist = z;
	var camAsp = cam_width / cam_height;

	var _camW   = camera_get_view_width(camera);
	var _camH   = camera_get_view_height(camera);
	var _camX   = 1800;
	var _camY   = 1800;

	var _viewMat = matrix_build_lookat(Obj_chr.x + ddx, Obj_chr.y + ddy, camDist, Obj_chr.x, Obj_chr.y, 0, 0, 1, 0);
	var _projMat = matrix_build_projection_perspective_fov(fov, camAsp, 3, 30000);

	camera_set_view_mat(camera, _viewMat);
	camera_set_proj_mat(camera, _projMat);

	camera_apply(camera);

}