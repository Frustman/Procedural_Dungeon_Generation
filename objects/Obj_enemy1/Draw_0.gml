/// @description Insert description here
// You can write your code in this editor
event_inherited();
if(!stun){
	sprite_index = Spr_slime;
	draw_sprite_ext(Spr_slime,real_index,x,y,image_xscale,1.0,0,c_white,1.0);
}
else
	draw_sprite_ext(Spr_slime_hurt,-1,x,y,image_xscale,1.0,0,c_white,1.0);
shader_reset();


for(var i = 0; i < path_get_number(player_path); i++){
	targetx[i] = path_get_point_x(player_path,i);
	targety[i] = path_get_point_y(player_path,i);
}
	draw_circle(targetx[1],targety[1],2,false);
draw_text(x,y+30,path_get_number(player_path));

if(player_path != -1) draw_path(player_path,x,y,1);

draw_rectangle_color(x-10,y-22,x-10 + hp/1.5, y-20,c_black,c_black,c_black,c_black,true);
draw_rectangle_color(x-10,y-22,x-10 + hp/1.5, y-20,c_red,c_red,c_red,c_red,false);