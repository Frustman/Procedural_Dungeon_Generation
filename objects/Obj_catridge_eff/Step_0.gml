/// @description Insert description here
// You can write your code in this editor
time += global.timeScale;
cat_len = max(0, cat_len - 0.16 * global.timeScale);
for(var i = 0; i < cat_cnt; i++){
	cat_dir[i] -= 2 * dir * global.timeScale;
	cat_pos[i] = [x + cat_hspeed_st[i] * dir * time, y + (cat_vspeed_st[i] + cat_grav[i] * time) * time];
}

if(cat_len <= 0) instance_destroy(self);