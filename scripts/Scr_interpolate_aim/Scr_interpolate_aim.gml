/// @function Scr_interpolate_aim(xpos, ypos, dir)

function Scr_interpolate_aim(xpos, ypos, dir){
	var target = noone;
	for(var i = 0; i <= 25; i += 1){
		var tar_L = collision_line(xpos,ypos,xpos + lengthdir_x(600,dir + i),ypos + lengthdir_y(600,dir + i),Obj_enemy,false,true);
		var tar_R = collision_line(xpos,ypos,xpos + lengthdir_x(600,dir - i),ypos + lengthdir_y(600,dir - i),Obj_enemy,false,true);
		
		
		var wall_L_list = ds_list_create();
		var wall_R_list = ds_list_create();
		var wall_L = noone;
		var wall_R = noone;
		collision_line_list(xpos,ypos,xpos + lengthdir_x(600,dir + i),ypos + lengthdir_y(600,dir + i),Obj_wall,false,true,wall_L_list,true);
		collision_line_list(xpos,ypos,xpos + lengthdir_x(600,dir - i),ypos + lengthdir_y(600,dir - i),Obj_wall,false,true,wall_R_list,true);
		
		for(var j = 0; j < ds_list_size(wall_L_list); j++){
			if(wall_L_list[| j].solid == true){
				wall_L = wall_L_list[| j];	
			}
		}
		for(var j = 0; j < ds_list_size(wall_R_list); j++){
			if(wall_R_list[| j].solid == true){
				wall_R = wall_R_list[| j];	
			}
		}
		
		
		if(tar_L != noone && wall_L != noone){
			if(point_distance(xpos,ypos,tar_L.x,tar_L.y) < point_distance(xpos,ypos,wall_L.x,wall_L.y)){
				target = tar_L;
				break;
			} else continue;
		}
		if(tar_R != noone && wall_R != noone){
			if(point_distance(xpos,ypos,tar_R.x,tar_R.y) < point_distance(xpos,ypos,wall_R.x,wall_R.y)){
				target = tar_R;
				break;
			} else continue;
		}
		
		if(tar_L != noone && wall_L == noone){
			target = tar_L;
			break;
		}
		if(tar_R != noone && wall_R == noone){
			target = tar_R;
			break;
		}
	}
	
	return target;
}