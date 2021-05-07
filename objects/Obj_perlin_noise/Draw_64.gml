/// @description Insert description here
// You can write your code in this editor
var interval = 30;
for(var i = 0; i < 99; i ++){
	draw_circle(i * 10,200 + Scr_perlin_noise_1d(i + current_time / 100) * 20,1,true);
	draw_text(i * 50, 0, Scr_perlin_noise_1d(i + current_time / 100));
}




for(var i = 0; i < DG_WIDTH; i++){
	for(var j = 0; j < DG_HEIGHT; j++){
		draw_text(i * 10, 300 + 10 * j, map[#i, j]);
	}
}

draw_line(0,200,1600,200);