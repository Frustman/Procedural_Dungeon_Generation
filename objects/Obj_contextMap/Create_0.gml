/// @description Insert description here
// You can write your code in this editor

ray_count = 16;
maxidx = 0;

for(var i = 0; i < ray_count; i++){
	var dir = 360 / ray_count * i;
	context_dir[i] = dir;
	context_map[i] = 0;
	context_friendly[i] = 0;
	context_aggressive[i] = 0;
}