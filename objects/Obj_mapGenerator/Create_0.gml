/// @description Insert description here
#macro DG_WIDTH 23
#macro DG_HEIGHT 19

randomize();

deviceWidth = display_get_width() * 0.75;
deviceHeight = display_get_height() * 0.75;
window_set_size(deviceWidth,deviceHeight);
surface_resize(application_surface,deviceWidth,deviceHeight);
display_set_gui_size(deviceWidth,deviceHeight);

display_reset(8, true);

alarm[0] = 1;


global.paused = false;

deco_width = DG_WIDTH * 2;
deco_height = DG_HEIGHT * 2;

map_cnt = 1;
max_mapcnt = global.level + 3;

clear = true;

dg_trim = 6;

real_width = DG_WIDTH * 9;
real_height = DG_HEIGHT * 8;

for(var i = 0; i < max_mapcnt; i++){
	map_list[i] = Scr_Pdg_Init(DG_WIDTH,DG_HEIGHT);
	Scr_Pdg_Process(map_list[i],DG_WIDTH,DG_HEIGHT);
	Scr_Pdg_Process(map_list[i],DG_WIDTH,DG_HEIGHT);
	Scr_Pdg_Process(map_list[i],DG_WIDTH,DG_HEIGHT);
	Scr_Pdg_Process(map_list[i],DG_WIDTH,DG_HEIGHT);
	Scr_Pdg_Process(map_list[i],DG_WIDTH,DG_HEIGHT);
	Scr_Pdg_Process(map_list[i],DG_WIDTH,DG_HEIGHT);
	Scr_Pdg_Process(map_list[i],DG_WIDTH,DG_HEIGHT);
	Scr_Pdg_Process(map_list[i],DG_WIDTH,DG_HEIGHT);
	Scr_Pdg_Process(map_list[i],DG_WIDTH,DG_HEIGHT);
	Scr_Pdg_Process(map_list[i],DG_WIDTH,DG_HEIGHT);
	Scr_Pdg_Process(map_list[i],DG_WIDTH,DG_HEIGHT);
	Scr_Pdg_Process(map_list[i],DG_WIDTH,DG_HEIGHT);
	Scr_Pdg_Process(map_list[i],DG_WIDTH,DG_HEIGHT);
}

dungeon_cnt = max_mapcnt;
/*map = real(load_csv("dungeon_map.csv"));

for(var i = 0; i < ds_grid_width(map); i++){
	for(var j = 0; j < ds_grid_height(map); j++){
		map[# i, j] = real(map[# i, j]);
	}
}
dungeon_cnt = ds_grid_height(map) div DG_HEIGHT;

for(var i = 0; i < dungeon_cnt; i++){
	map_list[i] = ds_grid_create(DG_WIDTH,DG_HEIGHT);
	ds_grid_set_grid_region(map_list[i],map,0,i*DG_HEIGHT,DG_WIDTH-1,(i+1)*DG_HEIGHT - 1,0,0);
}

*/
deco_map = real(load_csv("deco_map.csv"));

for(var i = 0; i < ds_grid_width(deco_map); i++){
	for(var j = 0; j < ds_grid_height(deco_map); j++){
		deco_map[# i, j] = real(deco_map[# i, j]);
	}
}
deco_cnt = ds_grid_height(deco_map) div deco_height;

for(var i = 0; i < deco_cnt; i++){
	deco_list[i] = ds_grid_create(deco_width,deco_height);
	ds_grid_set_grid_region(deco_list[i],deco_map,0,i*deco_width,deco_width-1,(i+1)*deco_height - 1,0,0);
}

real_map = ds_grid_create(real_width, real_height);
deco_real = ds_grid_create(real_width * 2, real_height * 2);

map_grid_list = ds_grid_create(9,8);

ds_grid_set_region(real_map, 0,0, real_width - 1, real_height - 1, -1);
ds_grid_set_region(deco_real, 0,0, real_width * 2 - 1, real_height * 2 - 1, -1);

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