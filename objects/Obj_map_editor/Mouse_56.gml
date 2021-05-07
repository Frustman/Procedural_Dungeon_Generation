/// @description Insert description here
// You can write your code in this editor
mouse_down = false;

var ls = Scr_sprite_depth_sorting_index(Spr_desert_deco,mouseX,mouseY,index);

layer_sprite_speed(ls,0);

ds_list_add(sprite_list,ls);