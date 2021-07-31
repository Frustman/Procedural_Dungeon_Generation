/// @description Insert description here
// You can write your code in this editor
camera_set_view_size(view_camera[0], 640, 360);

swordHeight = 10;

point_list = ds_list_create();

p_trail_o = path_add();
path_set_closed(p_trail_o, false);
path_set_kind(p_trail_o, 1);

p_trail_i = path_add();
path_set_closed(p_trail_i, false);
path_set_kind(p_trail_i, 1);

length = -36;
step_size = 0.01;
tex = sprite_get_texture(Spr_beam, 0);

previous_mouse_x = mouse_x;
previous_mouse_y = mouse_y;

tick = 0;