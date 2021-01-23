/// @description Insert description here
// You can write your code in this editor
enum states{
	idle,
	move,
	attack,
	hurt,
	attack_ready
}

upixelH = shader_get_uniform(Sha_white_outline,"pixelH");
upixelW = shader_get_uniform(Sha_white_outline,"pixelW");
texelH = texture_get_texel_height(sprite_get_texture(sprite_index,0));
texelW = texture_get_texel_width(sprite_get_texture(sprite_index,0));


knuckback = false;
in_sight = false;
state_change = true;
state = states.idle;

anim_maxIndex = image_number;
anim_index = 0;
anim_fps = 10;

dx = 0;
dy = 0;