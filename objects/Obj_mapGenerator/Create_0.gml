/// @description Insert description here

randomize();

dg_width = 23;
dg_height = 19;

dg_trim = 6;

real_width = dg_width * 9;
real_height = dg_height * 8;

for(var i = 0; i < 5; i++){
	map_list[i] = ds_grid_create(dg_width,dg_height);
}

map = real(load_csv("dungeon_map.csv"));

for(var i = 0; i < ds_grid_width(map); i++){
	for(var j = 0; j < ds_grid_height(map); j++){
		map[# i, j] = real(map[# i, j]);
	}
}

for(var i = 0; i < ds_grid_height(map) div dg_height; i++){
	ds_grid_set_grid_region(map_list[i],map,0,i*dg_height,dg_width-1,(i+1)*dg_height - 1,0,0);
}



real_map = ds_grid_create(real_width, real_height);


ds_grid_set_region(real_map, 0,0, real_width - 1, real_height - 1, -1);

/*
ds_grid_set_region(map_list[0], 0,0, dg_width - 1, dg_height - 1, -1);
ds_grid_set_region(map_list[0], dg_trim - 1, dg_trim  - 1, dg_width - dg_trim, dg_height - dg_trim, 1)
ds_grid_set_region(map_list[0], dg_trim, dg_trim, dg_width - 1 - dg_trim, dg_height - 1 - dg_trim, 0);

ds_grid_set_region(map_list[1], 0,0, dg_width - 1, dg_height - 1, -1);
ds_grid_set_region(map_list[1], dg_trim - 1, dg_trim  - 1, dg_width - dg_trim, dg_height - dg_trim, 1)
ds_grid_set_region(map_list[1], dg_trim, dg_trim, dg_width - 1 - dg_trim, dg_height - 1 - dg_trim, 0);

ds_grid_set_region(map_list[1],dg_trim + 4, dg_trim + 4, dg_trim + 4, dg_height - dg_trim - 5, 1);
ds_grid_set_region(map_list[1],dg_trim + 4, dg_height - dg_trim - 5, dg_width - dg_trim - 5, dg_height - dg_trim - 5, 1);

*/
map_grid = ds_grid_create(9,8);
miniMap_grid = ds_grid_create(9,8);
Map_visit_grid = ds_grid_create(9,8);
door_grid = ds_grid_create(9,8);

ds_grid_set(map_grid,4,3,1);
ds_grid_set_region(door_grid, 0, 0, 8, 7, 0);
ds_grid_set_region(miniMap_grid, 0, 0, 8, 7, 0);
ds_grid_set_region(Map_visit_grid, 0, 0, 8, 7, 0);
ds_grid_set(miniMap_grid,4,3,1);
ds_grid_set(Map_visit_grid,4,3,1);

room_queue = ds_queue_create();
ds_queue_enqueue(room_queue, 43);

room_list = ds_list_create();
endroom_list = ds_stack_create();

generated = false;
tiled = false;

xpos = 4;
ypos = 3;

map_cnt = 1;
max_mapcnt = 9;


dir_list[0][0] = -1; // 0 - left / 1 - down / 2 - right / 3 - up
dir_list[0][1] = 0;
dir_list[1][0] = 0;
dir_list[1][1] = 1;
dir_list[2][0] = 1;
dir_list[2][1] = 0;
dir_list[3][0] = 0;
dir_list[3][1] = -1;