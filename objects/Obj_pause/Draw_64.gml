/// @description Insert description here
// You can write your code in this editor
	if(paused_surf != -1){
		draw_sprite_ext(paused_surf,0,0,0,1,1,0,c_white,1);
		draw_set_alpha(0.5);
		draw_rectangle_colour(0, 0, room_width, room_height, c_black, c_black, c_black, c_black, false);
		draw_set_alpha(1);
	}