/// @description Insert description here
// You can write your code in this editor
draw_text(0,300,_val);
draw_text(0,310,Scr_perlin_noise_1d(shake_cnt + seed));
draw_text(0,320,"offsetY = " + string(_offsetY));
draw_text(0,330,_offsetR);
draw_text(0,340,max_offset);
draw_text(0,350,max_roll);
draw_text(0,360,_offsetR);

draw_circle(500 + shake_cnt, 180 - _val * 60, 5, false);