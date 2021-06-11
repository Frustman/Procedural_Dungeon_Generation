/// @description Insert description here
// You can write your code in this editor
var interval = 30;
for(var i = 0; i < 99; i ++){
	_channel = animcurve_get_channel(ac_shake_duration, 0);
	_val = animcurve_channel_evaluate(_channel, i / shake_duration);
	var _offsetX = Scr_perlin_noise_1d(100 + i * 2) * 30 * _val;
	//var _offsetX = 30 * _val;
	draw_circle(i * 10,200 + Scr_perlin_noise_1d(i + current_time / 100) * 20,1,true);
	draw_text(i * 50, 0, Scr_perlin_noise_1d(i + current_time / 100));
	draw_circle(i * 10,300 + _offsetX,1,true);
}


for(var i = 0; i < DG_WIDTH; i++){
	for(var j = 0; j < DG_HEIGHT; j++){
		draw_text(10 * i, 400 + 10 * j, map[#i, j]);	
	}
}

for(var i = 0; i < DG_WIDTH; i++){
	for(var j = 0; j < DG_HEIGHT; j++){
		draw_text(500 + 10 * i, 400 + 10 * j, Scr_Pdg_CountNeighbor(map, i, j));	
	}
}


draw_line(0,200,1600,200);
draw_line(0,300,1600,300);
draw_line(0,330,1600,330);
draw_line(0,270,1600,270);