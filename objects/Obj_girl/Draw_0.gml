/// @description Insert description here
// You can write your code in this editor

Scr_z_tilt_set();
if(state_name == "IDLE") draw_sprite_ext(Spr_girl_idle, image_index, x, y, image_xscale, image_yscale, 0, c_white, image_alpha);
if(state_name == "MOVETOSTOP") draw_sprite_ext(Spr_girl_move_to_stop, image_index, x, y, image_xscale, image_yscale, 0, c_white, image_alpha);
if(state_name == "MOVE") draw_sprite_ext(Spr_girl_move, image_index, x, y, image_xscale, image_yscale, 0, c_white, image_alpha);
if(state_name == "CROUCHING") draw_sprite_ext(Spr_girl_crouch, image_index, x, y, image_xscale, image_yscale, 0, c_white, image_alpha);
if(state_name == "CROUCH") draw_sprite_ext(Spr_girl_crouch, 6, x, y, image_xscale, image_yscale, 0, c_white, image_alpha);
Scr_z_tilt_reset();