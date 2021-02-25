/// @description Insert description here
// You can write your code in this editor
enum states{
	idle,
	move,
	attack,
	hurt,
	attack_ready
}

hitList = ds_list_create();

upixelH = shader_get_uniform(Sha_white_outline,"pixelH");
upixelW = shader_get_uniform(Sha_white_outline,"pixelW");
texelH = texture_get_texel_height(sprite_get_texture(sprite_index,0));
texelW = texture_get_texel_width(sprite_get_texture(sprite_index,0));

maxhp = 20;
hp = 20;

ac_cnt = 0;

xscale = 1;
yscale = 1;

height = abs(bbox_bottom - bbox_top)*3/5;
width = abs(bbox_left - bbox_right)*3/5;

hit = false;
knuckback = false;
in_sight = false;
state_change = true;
state = states.idle;

anim_maxIndex = image_number;
anim_index = 0;
anim_fps = 10;

Scr_update_depth(x,y);

dx = 0;
dy = 0;