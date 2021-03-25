/// @description Insert description here
// You can write your code in this editor
map = real(load_csv("dungeon_map.csv"));

dg_width = 23;
dg_height = 19;

for(var i = 0; i < ds_grid_width(map); i++){
	for(var j = 0; j < ds_grid_height(map); j++){
		map[# i, j] = real(map[# i, j]);
	}
}
dungeon_cnt = ds_grid_height(map) div dg_height;

for(var i = 0; i < dungeon_cnt; i++){
	map_list[i] = ds_grid_create(dg_width,dg_height);
	ds_grid_set_grid_region(map_list[i],map,0,i*dg_height,dg_width-1,(i+1)*dg_height - 1,0,0);
}

sprite_list = ds_list_create();

mouseX = device_mouse_x(0);
mouseY = device_mouse_y(0);

mouse_down = false;

max_index = 34;
index = 0;