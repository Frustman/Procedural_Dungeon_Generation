/// @description Insert description here
// You can write your code in this editor
draw_sprite(Spr_enemy1,sp_index,x,y);

draw_rectangle_color(x-10,y-22,x-10 + hp/5, y-20,c_black,c_black,c_black,c_black,true);
draw_rectangle_color(x-10,y-22,x-10 + hp/5, y-20,c_red,c_red,c_red,c_red,false);
draw_sprite_ext(Spr_controller,0,targetX,targetY,0.5,0.5,0,c_white,0.3);
draw_text(x + 20,y + 20,targeted)