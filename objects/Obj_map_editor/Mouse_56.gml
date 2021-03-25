/// @description Insert description here
// You can write your code in this editor
mouse_down = false;

var ls = layer_sprite_create(layer_get_id("sprite"),mouseX,mouseY,Spr_desert_deco);

layer_sprite_index(ls,index);
layer_sprite_speed(ls,0);

ds_list_add(sprite_list,ls);