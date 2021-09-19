
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
	
} else {
	
	if(focus_id == -1){
		targetX = Obj_chr.x;
		targetY = Obj_chr.y;
	} else {
		targetX = focus_id.x;
		targetY = focus_id.y;
	}
	
	x += (targetX - x) / 7;	
	y += (targetY - y) / 7;
	
	var new_width = cam_width * cam_zoom;
	var new_height = cam_height * cam_zoom;
	
	cam_width = lerp(cam_width, new_width, rate);
	cam_height = lerp(cam_height, new_height, rate);
	
	camera_set_view_size(view_camera[0], cam_width, cam_height);
	camera_set_view_pos(view_camera[0], x - cam_width / 2, y - cam_height / 2);
}

global.timeScale = lerp(global.timeScale, targetTimeScale, 0.05);
CONTAINER.game_surface_blur_sigma = abs(1.0 - global.timeScale);

screenX = camera_get_view_x(view_camera[0]);
screenY = camera_get_view_y(view_camera[0]);
screenW = camera_get_view_width(view_camera[0]);
screenH = camera_get_view_height(view_camera[0]);