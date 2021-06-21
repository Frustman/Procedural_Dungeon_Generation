/// @description Insert description here
// You can write your code in this editor
if(state == bulletState.exist){
	draw_sprite_ext(Spr_bullet_ui2,0,xpos,ypos,scale,scale,0,c_white,1.0);
	draw_sprite_ext(Spr_bullet_ui1,0,xpos,ypos,scale,scale,0,c_white,1.0);
} else if(state == bulletState.shoot){
	draw_sprite_ext(Spr_bullet_ui2,real_index,xpos,ypos,scale,scale,0,c_white,1.0);
	draw_sprite_ext(Spr_bullet_ui1,real_index,xpos,ypos,scale,scale,0,c_white,1.0);
} else if(state == bulletState.reload){
	draw_sprite_ext(Spr_bullet_ui3,real_index,xpos,ypos,scale,scale,0,c_white,1.0);
	draw_sprite_ext(Spr_bullet_ui1,0,xpos,ypos,scale,scale,0,c_white,1.0);
} else if(state == bulletState.used){
	draw_sprite_ext(Spr_bullet_ui2,0,xpos,ypos,scale,scale,0,c_white,1.0);
}