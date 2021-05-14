/// @description Insert description here
// You can write your code in this editor

for(var i = 0; i < ray_count; i++){
	if(context_map[i] >= 0){
		draw_set_color(c_green);
	} else {
		draw_set_color(c_red);
	}
	if(i == maxidx) draw_set_color(c_blue);
	draw_line(x,y,x + lengthdir_x(abs(context_map[i] * 200),context_dir[i]), y + lengthdir_y(abs(context_map[i] * 200), context_dir[i]));
	//draw_text(x + lengthdir_x(abs(context_map[i] * 200),context_dir[i]), y + lengthdir_y(abs(context_map[i] * 200), context_dir[i]),context_dir[i]);
	draw_set_color(c_white);
}

draw_circle(x,y,200,true);