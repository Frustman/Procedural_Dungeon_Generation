target = instance_nearest(Obj_chr.x, Obj_chr.y, Obj_enemy);

if(Scr_get_room_pos(Obj_chr.x, Obj_chr.y) == Scr_get_room_pos(target.x, target.y)){
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
}

var view_width = camera_get_view_width(view_camera[0]);
var view_height = camera_get_view_height(view_camera[0]);

var new_width = lerp(view_width, cam_zoom * cam_width, rate);
var new_height = lerp(view_height, cam_zoom * cam_height, rate);

camera_set_view_size(view_camera[0], new_width, new_height);

view_width = camera_get_view_width(view_camera[0]);
view_height = camera_get_view_height(view_camera[0]);

x = lerp(x,targetX, rate);
y = lerp(y,targetY, rate);

camera_set_view_border(view_camera[0], new_width / 2, new_height / 2);

camera_set_view_pos(view_camera[0], x - camera_get_view_border_x(view_camera[0]), y - camera_get_view_border_y(view_camera[0]));
