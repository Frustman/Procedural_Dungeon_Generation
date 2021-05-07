/// @function Scr_get_point_line(xpos, ypos, dir, obj)
/// @param {real} xpos
/// @param {real} ypos
/// @param {real} dir
/// @param {real} obj

function Scr_get_point_line(xpos, ypos, dir, obj){
	
	var len = point_distance(xpos, ypos, obj.x, obj.y);
	
	var x_prev = xpos + lengthdir_x(len, dir);
	var y_prev = ypos + lengthdir_y(len, dir);
	
	var x_next = xpos;
	var y_next = ypos;
	
	
	while(point_distance(x_prev, y_prev, x_next, y_next) >= 0.001){
		var x_mid = (x_prev + x_next) / 2;
		var y_mid = (y_prev + y_next) / 2;
		if(collision_point(x_mid,y_mid,obj,true,false) != noone){
			x_prev = x_mid;
			y_prev = y_mid;
		} else{
			x_next = x_mid;
			y_next = y_mid;
		}
	}
	var result = ds_list_create();
	ds_list_add(result, x_next);
	ds_list_add(result, y_next);
	
	return result;
}