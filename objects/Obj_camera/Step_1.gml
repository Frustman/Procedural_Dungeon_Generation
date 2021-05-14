

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

 new_width = lerp(view_width, cam_zoom * cam_width, rate);
 new_height = lerp(view_height, cam_zoom * cam_height, rate);

camera_set_view_size(view_camera[0], new_width, new_height);

view_width = camera_get_view_width(view_camera[0]);
view_height = camera_get_view_height(view_camera[0]);



//version 2
if(instance_exists(Obj_chr)){
	cur_room = Scr_get_room_pos(Obj_chr.x,Obj_chr.y);
	var roomX = ((cur_room div 10) * DG_WIDTH + DG_WIDTH / 2) * CELL_WIDTH;
	var roomY = ((cur_room % 10) * DG_HEIGHT + DG_HEIGHT / 2) * CELL_HEIGHT;
	
	var dir = point_direction(roomX,roomY,Obj_chr.x,Obj_chr.y);
	var len = point_distance(roomX,roomY,Obj_chr.x,Obj_chr.y);
	
	var targetX = roomX + lengthdir_x(len / 7 * 6, dir);
	var targetY = roomY + lengthdir_y(len / 7 * 6, dir);
	
	targetX = min(targetX, roomX + DG_WIDTH * CELL_WIDTH / 2 - view_width / 2);
	targetX = max(targetX, roomX - DG_WIDTH * CELL_WIDTH / 2 + view_width / 2);
	
	targetY = min(targetY, roomY  + DG_HEIGHT * CELL_HEIGHT / 2 - view_height / 2);
	targetY = max(targetY, roomY - DG_HEIGHT * CELL_HEIGHT / 2 + view_height / 2);
	
	cam_zoom = 1 - zoom_shake;
} else if(global.paused == true){
	var targetX = x;
	var targetY = y;
}
else{
	var targetX = 0;
	var targetY = 0;
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


x += (targetX - x)/7;
y += (targetY - y)/7;

/*x = round(x);
y = round(y);*/

camera_set_view_border(view_camera[0], new_width / 2, new_height / 2);


camera_set_view_pos(view_camera[0], x - camera_get_view_border_x(view_camera[0]) + offsetX, y - camera_get_view_border_y(view_camera[0]) + offsetY);


screenX = camera_get_view_x(view_camera[0]);
screenY = camera_get_view_y(view_camera[0]);
screenW = view_width;
screenH = view_height;