/// @description Insert description here
// You can write your code in this editor
switch(irandom(5)){
	case 0 :
		sprite_index = Spr_desert_tree1A;
		break;
	case 1 :
		sprite_index = Spr_desert_tree1B;
		break;
	case 2 :
		sprite_index = Spr_desert_tree2A;
		break;
	case 3 :
		sprite_index = Spr_desert_tree2B;
		break;
	case 4 :
		sprite_index = Spr_desert_tree3A;
		break;
	case 5 :
		sprite_index = Spr_desert_tree3B;
		break;
}
image_index = 0;
image_speed = 0;

Scr_update_depth(x,y);

chr_pos = shader_get_uniform(Sha_set_alpha,"chr_pos");
invis_min_range = shader_get_uniform(Sha_set_alpha,"invis_min_range");
invis_falloff_range = shader_get_uniform(Sha_set_alpha,"invis_falloff_range");