var targetX = Obj_chr.x + lengthdir_x(30,ControllerID.directionBox);
var targetY = Obj_chr.y + lengthdir_y(30,ControllerID.directionBox);

x += (targetX - x) / CamDivSpeed;
y += (targetY - y) / CamDivSpeed;

camera_set_view_pos(view_camera[0], x - camera_get_view_border_x(view_camera[0]), y - camera_get_view_border_y(view_camera[0]));