/// @description Insert description here
// You can write your code in this editor
if(boss == false){
	draw_sprite_ext(Spr_hpbar,0,x - 11,bbox_bottom + 4, hp/maxhp, 1.0, 0 ,c_white,1.0);
	draw_sprite(Spr_hpbar_frame,0,x - 14,bbox_bottom + 2);
}


if(hit) {
	if(boss == false){
		shader_set(Sha_hit);
	} else {
		shader_set(Sha_boss_hit);
	}
}