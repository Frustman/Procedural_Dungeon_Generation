
if(d3d_mode == true){
	x = Obj_chr.x;
	y = Obj_chr.y;
	
	var up = keyboard_check(vk_up);
	var down = keyboard_check(vk_down);
	var left = keyboard_check(vk_left);
	var right = keyboard_check(vk_right);

	var inputX = right - left;
	var inputY = down - up;

	var dir = point_direction(0,0,inputX,inputY);

	dx = 0;
	dy = 0;

	if(up || down || left || right){
		dx = lengthdir_x(4, dir);
		dy = lengthdir_y(4, dir);
	}

	ddx += dx;
	ddy += dy;
	
	global.vx = x - cam_width / 2;
	global.vy = y - cam_height / 2;
	
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

} else {
	
	if(focus_id == -1){
		targetX = Obj_chr.x;
		targetY = Obj_chr.y;
	} else {
		targetX = (focus_id.parent.x + Obj_chr.x) / 2;
		targetY = (focus_id.parent.y + Obj_chr.y) / 2;
	}
	
	x += (targetX - x) / 7;	
	y += (targetY - y) / 7;
	
	var new_width = cam_width * cam_zoom;
	var new_height = cam_height * cam_zoom;
	
	cam_width = lerp(cam_width, new_width, rate);
	cam_height = lerp(cam_height, new_height, rate);
	
	camera_set_view_size(view_camera[0], cam_width, cam_height);
	camera_set_view_pos(view_camera[0], x - cam_width / 2, y - cam_height / 2);
	global.vx = x - cam_width / 2;
	global.vy = y - cam_height / 2;
	
	screenW = cam_width;
	screenH = cam_height;
}

global.timeScale = lerp(global.timeScale, targetTimeScale, 0.05);
CONTAINER.game_surface_blur_sigma = abs(1.0 - global.timeScale);

screenX = camera_get_view_x(view_camera[0]);
screenY = camera_get_view_y(view_camera[0]);
