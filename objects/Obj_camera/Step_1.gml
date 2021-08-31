

//vesion 1

/*if(target != noone && instance_exists(target) && cur_room == Scr_get_room_pos(target.x, target.y)){
	var targetX = (Obj_chr.x + target.x * 2) / 3;
	var targetY = (Obj_chr.y + target.y * 2) / 3;

	cam_zoom = 1.0 + point_distance(Obj_chr.x, Obj_chr.y, Obj_enemy.x, Obj_enemy.y) / 600 + zoom_shake;
}
else{
	if(instance_exists(Obj_controller)){
		var targetX = Obj_chr.x + lengthdir_x(30 * cam_zoom,Obj_controller.directionBox);
		var targetY = Obj_chr.y + lengthdir_y(30 * cam_zoom,Obj_controller.directionBox);
	} else{
		var targetX = 0;
		var targetY = 0;
	}
	cam_zoom = 1.0 + zoom_shake;
}*/


var view_width = camera_get_view_width(view_camera[0]);
var view_height = camera_get_view_height(view_camera[0]);

 new_width = lerp(view_width, cam_zoom * cam_width, rate * global.timeScale);
 new_height = lerp(view_height, cam_zoom * cam_height, rate * global.timeScale);

camera_set_view_size(view_camera[0], new_width, new_height);

view_width = camera_get_view_width(view_camera[0]);
view_height = camera_get_view_height(view_camera[0]);



//version 2
if(instance_exists(Obj_chr)){
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


x += (targetX - x) / 7 * global.timeScale;
y += (targetY - y) / 7 * global.timeScale;

/*x = round(x);
y = round(y);*/

camera_set_view_border(view_camera[0], new_width / 2, new_height / 2);


camera_set_view_pos(view_camera[0], x - camera_get_view_border_x(view_camera[0]) + offsetX, y - camera_get_view_border_y(view_camera[0]) + offsetY);

global.timeScale = lerp(global.timeScale, targetTimeScale, 0.05);
CONTAINER.game_surface_blur_sigma = abs(1.0 - global.timeScale);

screenX = camera_get_view_x(view_camera[0]);
screenY = camera_get_view_y(view_camera[0]);
screenW = view_width;
screenH = view_height;