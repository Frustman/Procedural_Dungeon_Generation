/// @description Insert description here
// You can write your code in this editor

time = 0;

dir = 1;

cat_cnt = irandom(3) + 3;

for(var i = 0; i < cat_cnt; i++){
	cat_pos[i] = [x,y];
	cat_hspeed_st[i] = random(7);
	cat_vspeed_st[i] = -6 + random(8);
	cat_grav[i] = abs(cat_vspeed_st[i]) / 100 + 0.1;
	
	var tilt = (-2 * cat_grav[i] * time + cat_vspeed_st[i]) / cat_hspeed_st[i];
	cat_dir[i] = point_direction(0,0,1,tilt);
	
	cat_len = 2;
}
