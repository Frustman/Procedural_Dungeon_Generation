if(instance_exists(Obj_chr)){
	cur_room = Scr_get_room_pos(Obj_chr.x,Obj_chr.y);
	target = Obj_chr.AttackTarget;
	
	instance_deactivate_region((dg_width * (cur_room div 10)) * CELL_WIDTH,(dg_height * (cur_room % 10)) * CELL_HEIGHT,dg_width * CELL_WIDTH, dg_height * CELL_HEIGHT, false, true);
	instance_activate_region((dg_width * (cur_room div 10)) * CELL_WIDTH,(dg_height * (cur_room % 10)) * CELL_HEIGHT,dg_width * CELL_WIDTH, dg_height * CELL_HEIGHT, true);
	instance_activate_object(Obj_shake);
	instance_activate_object(Obj_controller);
	instance_activate_object(Obj_mapGenerator);
	instance_activate_object(Obj_chr);
	instance_activate_object(Obj_bullet_ui);
}

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


//version 2
if(instance_exists(Obj_chr)){
	var roomX = ((cur_room div 10) * dg_width + dg_width / 2) * CELL_WIDTH;
	var roomY = ((cur_room % 10) * dg_height + dg_height / 2) * CELL_HEIGHT;
	
	var dir = point_direction(roomX,roomY,Obj_chr.x,Obj_chr.y);
	var len = point_distance(roomX,roomY,Obj_chr.x,Obj_chr.y);
	
	var targetX = roomX + lengthdir_x(len / 2, dir);
	var targetY = roomY + lengthdir_y(len / 2, dir);
	
	cam_zoom = 0.7 + zoom_shake;
} else {
	var targetX = 0;
	var targetY = 0;
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

x = round(x);
y = round(y);

camera_set_view_border(view_camera[0], new_width / 2, new_height / 2);

camera_set_view_pos(view_camera[0], x - camera_get_view_border_x(view_camera[0]), y - camera_get_view_border_y(view_camera[0]));
