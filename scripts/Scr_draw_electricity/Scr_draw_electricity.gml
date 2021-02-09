// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Scr_draw_electricity(x1, y1, x2, y2, cnt){
	var dir = point_direction(x1,y1,x2,y2);
	var len = point_distance(x1,y1,x2,y2);
	
	var xpos = x1;
	var ypos = y1;

	var point_list = ds_list_create();
	ds_list_add(point_list,[x1,y1]);
	for(var i = 0; i < cnt - 1; i++){
		xpos += lengthdir_x(len / cnt, dir);
		ypos += lengthdir_y(len / cnt, dir);
		var rand = random(20) - 10;
		ds_list_add(point_list, [xpos + lengthdir_x(rand, dir + 90),ypos + lengthdir_y(rand, dir + 90)]);
	}
	ds_list_add(point_list,[x2,y2]);
	for(var i = 0; i < ds_list_size(point_list) - 1; i++){
		draw_line(point_list[|i][0],point_list[|i][1],point_list[|i + 1][0],point_list[|i + 1][1]);
	}
}