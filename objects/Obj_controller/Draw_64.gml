var fingerX = device_mouse_x_to_gui(0);
var fingerY = device_mouse_y_to_gui(0);

//draw_text(0,0,fingerX);
//draw_text(0,20,view_wport[0]);

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

draw_sprite_ext(Spr_controlBox, 0, boxCenterX, boxCenterY, 1, 1, 0 , c_white, 1);

draw_sprite_ext(Spr_AttackBox, 0, AttackCenterX, AttackCenterY, 1, 1, 0 , c_white, 1);

draw_sprite_ext(Spr_controller, 0, boxCenterX + boxControlX, boxCenterY +boxControlY, 1, 1, 0 , c_white, 1);

