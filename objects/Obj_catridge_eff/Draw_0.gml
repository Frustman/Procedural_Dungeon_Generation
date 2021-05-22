/// @description Insert description here
// You can write your code in this editor

for(var i = 0; i < cat_cnt; i++){
	draw_line_width(cat_pos[i][0] + lengthdir_x(cat_len,cat_dir[i] + 180),
					cat_pos[i][1] + lengthdir_y(cat_len,cat_dir[i] + 180),
					cat_pos[i][0] + lengthdir_x(cat_len,cat_dir[i]),
					cat_pos[i][1] + lengthdir_y(cat_len,cat_dir[i]),
					1.5);
}