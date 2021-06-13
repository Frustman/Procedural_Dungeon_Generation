/// @description Insert description here
// You can write your code in this editor
sprite_index = Spr_desert_deco;
image_index = 0;
image_speed = 0;

Scr_update_depth(x,y);

chr_pos = shader_get_uniform(Sha_set_alpha,"chr_pos");
invis_min_range = shader_get_uniform(Sha_set_alpha,"invis_min_range");
invis_falloff_range = shader_get_uniform(Sha_set_alpha,"invis_falloff_range");