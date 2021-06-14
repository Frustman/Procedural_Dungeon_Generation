/// @description Insert description here
// You can write your code in this editor
if(instance_exists(Obj_chr) && point_distance(x,y,Obj_chr.x,Obj_chr.y) <= 160){
	shader_set(Sha_set_alpha);
	if(instance_exists(Obj_chr)){
		shader_set_uniform_f(chr_pos, Obj_chr.x, Obj_chr.y);
	} else{
		shader_set_uniform_f(chr_pos, 0, 0);
	}
	shader_set_uniform_f(invis_min_range, 0);
	shader_set_uniform_f(invis_falloff_range, 64);

	draw_sprite(sprite_index,image_index,x,y);

	shader_reset();
} else {
	draw_sprite(sprite_index,image_index,x,y);
}