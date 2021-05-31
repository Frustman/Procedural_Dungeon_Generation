/// @description Insert description here
// You can write your code in this editor
if(hit){
	shader_set(Sha_hit);
	draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,0,c_white,1);
	shader_reset();
} else{
	shader_reset();
	draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,0,c_white,1);	
}