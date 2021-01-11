/// Scr_ran_dir(xpos, ypos)
function Scr_ran_dir(xpos, ypos){
	var rand = random(360);
	
	while(collision_line(xpos, ypos, xpos + lengthdir_x(24,rand), ypos + lengthdir_y(24,rand),Obj_wall,true,false) != noone){
		rand = random(360);
	}
	
	return rand;
}