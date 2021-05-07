/// @function Scr_BS_line(xpos, ypos, dir, len, inst)
///@param {real} xpos
///@param {real} ypos
///@param {real} dir
///@param {real} len
///@param {real} inst
function Scr_BS_line(xpos, ypos, dir, len, inst){
	var x_prev = xpos;
	var y_prev = ypos;
	
	var x_next = x_prev + lengthdir_x(len, 360 - dir);
	var y_next = y_prev + lengthdir_y(len, 360 - dir);
	
	while(point_distance(x_prev, y_prev, x_next, y_next) >= 0.001){
		var x_mid = (x_prev + x_next) / 2;
		var y_mid = (y_prev + y_next) / 2;
		var left = collision_line(x_prev,y_prev,x_mid,y_mid,inst,true,false) != noone;
		var right = collision_line(x_mid,y_mid,x_next,y_next,inst,true,false) != noone;
		if(left){
			x_next = x_mid;
			y_next = y_mid;
		}
		if(right){
			x_prev = x_mid;
			y_prev = y_mid;
		}
	}
	var val = ds_list_create();
	ds_list_add(val,x_next);
	ds_list_add(val,y_next);
	
	return val;
}