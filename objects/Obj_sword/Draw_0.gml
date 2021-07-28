/// @description Insert description here
// You can write your code in this editor
var xpos = room_width / 2;
var ypos = room_height / 2;

draw_sprite(Spr_chr, 0, xpos, ypos);

var mouse_dir = point_direction(xpos, ypos, mouse_x, mouse_y);

var xCenter = xpos + lengthdir_x(10, mouse_dir);
var yCenter = ypos + lengthdir_y(10, mouse_dir);

var handRadiusW = 16;
var handRadiusH = 8;

draw_ellipse(xpos - handRadiusW, ypos - handRadiusH, xpos + handRadiusW, ypos + handRadiusH, true);
draw_circle(xpos + lengthdir_x(handRadiusW, mouse_dir - 90), ypos + lengthdir_y(handRadiusH, mouse_dir - 90),2,false);

var swordRadiusW = 40;
var swordRadiusH = 20;


draw_ellipse(xpos - swordRadiusW, ypos + swordHeight - swordRadiusH, xpos + swordRadiusW, ypos + swordHeight + swordRadiusH, true);
draw_circle(xpos + lengthdir_x(swordRadiusW, mouse_dir - 90), ypos + swordHeight + lengthdir_y(swordRadiusH, mouse_dir - 90),2,false);

/*
draw_circle(xpos + lengthdir_x(swordRadiusW, mouse_dir - 90) + lengthdir_x(5, mouse_dir),
			ypos + swordHeight + lengthdir_y(swordRadiusH, mouse_dir - 90) + lengthdir_y(5, mouse_dir),
			1, false);

draw_circle(xpos + lengthdir_x(swordRadiusW, mouse_dir - 90) + lengthdir_x(5, mouse_dir - 180),
			ypos + swordHeight + lengthdir_y(swordRadiusH, mouse_dir - 90) + lengthdir_y(5, mouse_dir - 180),
			1, false);
			

draw_circle(xpos + lengthdir_x(handRadiusW, mouse_dir - 90) + lengthdir_x(3, mouse_dir - 180),
			ypos + lengthdir_y(handRadiusH, mouse_dir - 90) + lengthdir_y(3, mouse_dir - 180),
			1, false);


draw_circle(xpos + lengthdir_x(handRadiusW, mouse_dir - 90) + lengthdir_x(3, mouse_dir),
			ypos + lengthdir_y(handRadiusH, mouse_dir - 90) + lengthdir_y(3, mouse_dir),
			1, false);
*/

var lengthD = 3;
var lengthU = 3;

draw_sprite_pos(Spr_sword_1, 0, xpos + lengthdir_x(swordRadiusW, mouse_dir - 90) + lengthdir_x(lengthU, mouse_dir),
								ypos + swordHeight + lengthdir_y(swordRadiusH, mouse_dir - 90) + lengthdir_y(lengthU, mouse_dir),
								xpos + lengthdir_x(swordRadiusW, mouse_dir - 90) + lengthdir_x(lengthU, mouse_dir - 180),
								ypos + swordHeight + lengthdir_y(swordRadiusH, mouse_dir - 90) + lengthdir_y(lengthU, mouse_dir - 180),
								xpos + lengthdir_x(handRadiusW, mouse_dir - 90) + lengthdir_x(lengthD, mouse_dir - 180),
								ypos + lengthdir_y(handRadiusH, mouse_dir - 90) + lengthdir_y(lengthD, mouse_dir - 180),
								xpos + lengthdir_x(handRadiusW, mouse_dir - 90) + lengthdir_x(lengthD, mouse_dir),
								ypos + lengthdir_y(handRadiusH, mouse_dir - 90) + lengthdir_y(lengthD, mouse_dir),
								1.0);