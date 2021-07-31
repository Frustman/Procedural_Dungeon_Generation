/// @description Insert description here
// You can write your code in this editor
var xpos = room_width / 2;
var ypos = room_height / 2;

var mouse_dir = point_direction(xpos, ypos, mouse_x, mouse_y);


draw_text(xpos, ypos + 100, mouse_dir);
draw_text(xpos, ypos + 120, angle_difference(mouse_dir, 60));

var xCenter = xpos + lengthdir_x(10, mouse_dir);
var yCenter = ypos + lengthdir_y(10, mouse_dir);

var handRadiusW = 10;
var handRadiusH = 4;

var swordRadiusW = 35;
var swordRadiusH = 28;


//draw_ellipse(xpos - handRadiusW, ypos - handRadiusH + 6, xpos + handRadiusW, ypos + 6 + handRadiusH, true);
//draw_circle(xpos + lengthdir_x(handRadiusW, mouse_dir - 90), ypos + lengthdir_y(handRadiusH, mouse_dir - 90),2,false);

//draw_ellipse(xpos - swordRadiusW, ypos + swordHeight - swordRadiusH, xpos + swordRadiusW, ypos + swordHeight + swordRadiusH, true);
//draw_circle(xpos + lengthdir_x(swordRadiusW, mouse_dir - 90), ypos + swordHeight + lengthdir_y(swordRadiusH, mouse_dir - 90),2,false);


var lengthD = 6;
var lengthU = 6;


if(abs(angle_difference(mouse_dir, 60)) <= 30){
	draw_sprite(Spr_chr_, 1, xpos, ypos);	
} else if(abs(angle_difference(mouse_dir, 0)) <= 30){
	draw_sprite(Spr_chr_, 0, xpos, ypos);	
} else if(abs(angle_difference(mouse_dir, 300)) <= 30){
	draw_sprite(Spr_chr_, 2, xpos, ypos);	
}

draw_sprite_ext(Spr_sword_1, 0, xpos + lengthdir_x(handRadiusW, mouse_dir - 90), ypos + 6 + lengthdir_y(handRadiusH, mouse_dir - 90), 0.5, 0.5, mouse_dir - 150, c_white, 1.0);


/*draw_sprite_pos(Spr_sword_1, 0, xpos + lengthdir_x(swordRadiusW, mouse_dir - 90) + lengthdir_x(lengthU, mouse_dir),
								ypos + swordHeight + lengthdir_y(swordRadiusH, mouse_dir - 90) + lengthdir_y(lengthU, mouse_dir),
								xpos + lengthdir_x(swordRadiusW, mouse_dir - 90) + lengthdir_x(lengthU, mouse_dir - 180),
								ypos + swordHeight + lengthdir_y(swordRadiusH, mouse_dir - 90) + lengthdir_y(lengthU, mouse_dir - 180),
								xpos + lengthdir_x(handRadiusW, mouse_dir - 90) + lengthdir_x(lengthD, mouse_dir - 180),
								ypos + lengthdir_y(handRadiusH, mouse_dir - 90) + lengthdir_y(lengthD, mouse_dir - 180),
								xpos + lengthdir_x(handRadiusW, mouse_dir - 90) + lengthdir_x(lengthD, mouse_dir),
								ypos + lengthdir_y(handRadiusH, mouse_dir - 90) + lengthdir_y(lengthD, mouse_dir),
								1.0);*/

/*
draw_primitive_begin_texture(pr_trianglestrip, tex);

var lsize = ds_list_size(point_list);

for(var i = 0; i < lsize; i++){
	var px = point_list[| i][0];
	var py = point_list[| i][1];
	var dx = point_list[| i][2];
	var dy = point_list[| i][3];
	draw_vertex_texture_color(px, py, i / lsize, 0, c_white, 1.0);
	draw_vertex_texture_color(dx, dy, i / lsize, 1, c_white, 1.0);
}

draw_primitive_end();*/


draw_primitive_begin_texture(pr_trianglestrip, tex);


for(var i = 0; i < 1; i += step_size){
	var px = path_get_x(p_trail_i, i);
	var py = path_get_y(p_trail_i, i);
	var dx = path_get_x(p_trail_o, i);
	var dy = path_get_y(p_trail_o, i);
	draw_vertex_texture_color(px, py, i, 0, c_white, 1.0);
	draw_vertex_texture_color(dx, dy, i, 1, c_white, 1.0);
}

draw_primitive_end();


if(abs(angle_difference(mouse_dir, 240)) < 30){
	draw_sprite_ext(Spr_chr_, 2, xpos, ypos, -1.0, 1.0, 0, c_white, 1.0);	
} else if(abs(angle_difference(mouse_dir, 180)) <= 30){
	draw_sprite_ext(Spr_chr_, 0, xpos, ypos, -1.0, 1.0, 0, c_white, 1.0);	
} else if(abs(angle_difference(mouse_dir, 120)) < 30){
	draw_sprite_ext(Spr_chr_, 1, xpos, ypos, -1.0, 1.0, 0, c_white, 1.0);	
}
