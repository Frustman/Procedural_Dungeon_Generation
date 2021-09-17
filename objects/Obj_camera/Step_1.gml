


//version 2
/*if(instance_exists(Obj_chr)){
	if(focus_id == -1){
		targetX = Obj_chr.x;
		targetY = Obj_chr.y;
	} else {
		targetX = (focus_id.parent.x + Obj_chr.x) / 2;
		targetY = (focus_id.parent.y + Obj_chr.y) / 2;
	}
	cam_zoom = 1.0 - zoom_shake;
} else if(global.paused == true){
	targetX = x;
	targetY = y;
}
else{
	targetX = 0;
	targetY = 0;
}
/*
//version 3
if(instance_exists(Obj_chr)){
	var targetX = Obj_chr.x;
	var targetY = Obj_chr.y;
	cam_zoom = 0.7 - zoom_shake;
} else{
	var targetX = 0;
	var targetY = 0;
}*/

/*
x += (targetX - x) / 7 * global.timeScale;
y += (targetY - y) / 7 * global.timeScale;

/*x = round(x);
y = round(y);*/

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


global.timeScale = lerp(global.timeScale, targetTimeScale, 0.05);
CONTAINER.game_surface_blur_sigma = abs(1.0 - global.timeScale);

screenX = camera_get_view_x(view_camera[0]);
screenY = camera_get_view_y(view_camera[0]);
screenW = camera_get_view_width(view_camera[0]);
screenH = camera_get_view_height(view_camera[0]);