var fingerX = 0;
var fingerY = 0;

if(device_mouse_check_button(0, mb_left)){
	var fingerX = device_mouse_x_to_gui(0);
	var fingerY = device_mouse_y_to_gui(0);
}
if(device_mouse_check_button(1, mb_left)){
	var fingerX = device_mouse_x_to_gui(1);
	var fingerY = device_mouse_y_to_gui(1);
}

if(move){
	distanceBox = point_distance(boxCenterX, boxCenterY, fingerX, fingerY);
	directionBox = point_direction(boxCenterX, boxCenterY, fingerX, fingerY);
	if(maxWidth < distanceBox){
		boxControlX = lengthdir_x(maxWidth, directionBox);
		boxControlY = lengthdir_y(maxWidth, directionBox);
	} else{
		boxControlX = lengthdir_x(distanceBox, directionBox);
		boxControlY = lengthdir_y(distanceBox, directionBox);
	}
} else{
	distanceBox = 0;
	boxControlX = 0;
	boxControlY = 0;
}

if(_move){
	AttackdistanceBox = point_distance(AttackCenterX, AttackCenterY, fingerX, fingerY);
	AttackdirectionBox = point_direction(AttackCenterX, AttackCenterY, fingerX, fingerY);
	if(maxWidth < AttackdistanceBox){
		AttackControlX = lengthdir_x(maxWidth, AttackdirectionBox);
		AttackControlY = lengthdir_y(maxWidth, AttackdirectionBox);
	} else{
		AttackControlX = lengthdir_x(AttackdistanceBox, AttackdirectionBox);
		AttackControlY = lengthdir_y(AttackdistanceBox, AttackdirectionBox);
	}
} else{
	AttackdistanceBox = 0;
	AttackControlX = 0;
	AttackControlY = 0;
}

draw_sprite_ext(Spr_controlBox, 0, boxCenterX, boxCenterY, 1, 1, 0 , c_white, 1);
draw_sprite_ext(Spr_controller, 0, boxCenterX + boxControlX, boxCenterY + boxControlY, 1, 1, 0 , c_white, 1);

draw_sprite_ext(Spr_DashBox, 0, DashCenterX, DashCenterY, 1, 1, 0 , c_white, 1);

draw_sprite_ext(Spr_controlBox, 0, AttackCenterX, AttackCenterY, 1, 1, 0 , c_white, 1);
draw_sprite_ext(Spr_controller, 0, AttackCenterX + AttackControlX, AttackCenterY + AttackControlY, 1, 1, 0 , c_white, 1);

