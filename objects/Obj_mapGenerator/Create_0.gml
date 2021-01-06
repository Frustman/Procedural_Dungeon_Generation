/// @description Insert description here

randomize();

dg_width = 23;
dg_height = 19;

dg_trim = 6;

real_width = dg_width * 9;
real_height = dg_height * 8;

map_list = ds_grid_create(dg_width,dg_height);

real_map = ds_grid_create(real_width, real_height);

ds_grid_set_region(real_map, 0,0, real_width - 1, real_height - 1, 1);

ds_grid_set_region(map_list, 0,0, dg_width - 1, dg_height - 1, -1);
ds_grid_set_region(map_list, dg_trim - 1, dg_trim  - 1, dg_width - dg_trim, dg_height - dg_trim, 1)
ds_grid_set_region(map_list, dg_trim, dg_trim, dg_width - 1 - dg_trim, dg_height - 1 - dg_trim, 0);

map_grid = ds_grid_create(9,8);
door_grid = ds_grid_create(9,8);

ds_grid_set(map_grid,4,3,1);
ds_grid_set_region(door_grid, 0, 0, 8, 7, 0);

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

alarm[0] = 60;

dir_list[0][0] = -1; // 0 - left / 1 - down / 2 - right / 3 - up
dir_list[0][1] = 0;
dir_list[1][0] = 0;
dir_list[1][1] = 1;
dir_list[2][0] = 1;
dir_list[2][1] = 0;
dir_list[3][0] = 0;
dir_list[3][1] = -1;