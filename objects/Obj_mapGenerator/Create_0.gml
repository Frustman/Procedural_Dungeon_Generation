/// @description Insert description here
#macro DG_WIDTH 16
#macro DG_HEIGHT 12

#macro ALARMINACTIVE -100

for(var i = 0; i < 12; i++){
	Alarm[i] = ALARMINACTIVE;
}

randomize();

deviceWidth = display_get_width() * 0.75;
deviceHeight = display_get_height() * 0.75;
window_set_size(deviceWidth,deviceHeight);
surface_resize(application_surface,deviceWidth,deviceHeight);
display_set_gui_size(deviceWidth,deviceHeight);

display_reset(8, true);

Alarm[0] = 1;


global.paused = false;

deco_width = DG_WIDTH * 2;
deco_height = DG_HEIGHT * 2;

map_cnt = 1;
max_mapcnt = global.level + 3;

clear = true;

dg_trim = 6;

real_width = DG_WIDTH * 9;
real_height = DG_HEIGHT * 8;

dungeon_cnt = 3;

for(var i = 0; i < dungeon_cnt; i++){
	solid_map[i] = ds_grid_create(DG_WIDTH, DG_HEIGHT);
	ground_map[i] = ds_grid_create(DG_WIDTH * 2, DG_HEIGHT * 2);
	inst_list[i] = ds_list_create();
}

reward_cnt = 1;

for(var i = 0; i < dungeon_cnt; i++){
	reward_solid_map[i] = ds_grid_create(DG_WIDTH, DG_HEIGHT);
	reward_ground_map[i] = ds_grid_create(DG_WIDTH * 2, DG_HEIGHT * 2);
	reward_inst_list[i] = ds_list_create();
}

Scr_get_map_template(solid_map[0], ground_map[0], inst_list[0], rm_desert_1);
Scr_get_map_template(solid_map[1], ground_map[1], inst_list[1], rm_desert_2);
Scr_get_map_template(solid_map[2], ground_map[2], inst_list[2], rm_desert_3);
Scr_get_map_template(reward_solid_map[0], reward_ground_map[0], reward_inst_list[0], rm_desert_reward1);

real_solid = ds_grid_create(real_width, real_height);
real_ground = ds_grid_create(real_width * 2, real_height * 2);

map_grid_list = ds_grid_create(9,8);

ds_grid_set_region(real_solid, 0,0, real_width - 1, real_height - 1, -1);
ds_grid_set_region(real_ground, 0,0, real_width - 1, real_height - 1, -1);

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

minimap_gen = false;

curRoom = 0;

dir_list[0][0] = -1; // 0 - left / 1 - down / 2 - right / 3 - up
dir_list[0][1] = 0;
dir_list[1][0] = 0;
dir_list[1][1] = 1;
dir_list[2][0] = 1;
dir_list[2][1] = 0;
dir_list[3][0] = 0;
dir_list[3][1] = -1;

mini_resize = false;

mapW_target = 2.0;
mapH_target = 2.0;

mapW = 1.0;
mapH = 1.0;

mapX = 90 * mapW;
bosshpY = deviceHeight + 60;

for(var i = 0; i < Obj_valueContainer.bullet_maxCount; i++){
	global.bullet_ui[i] = instance_create_layer(x,y,"bullet_gui",Obj_bullet_ui);
	/*with(bullet_ui[i]){
		xpos = 300 - 24 + 20 * i;
		ypos = 30;
	}*/
}