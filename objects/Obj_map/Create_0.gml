/// @description Insert description here
LAND = 1;
dungeon_width = 50;
dungeon_height = 25;

MIN_SIZE = 11;

randomize();

geo_map = ds_grid_create(dungeon_width, dungeon_height);
ds_grid_set_region(geo_map, 0, 0, dungeon_width - 1, dungeon_height - 1, 0);

node_list = ds_list_create();

newRoom = room_duplicate(room);

room_set_width(newRoom, dungeon_width * 32);
room_set_height(newRoom, dungeon_height * 32);

var root_node = instance_create_layer(0,0,"room",Obj_room);
with root_node{
	x1 = 1;
	y1 = 1;
	x2 = other.dungeon_width - 2;
	y2 = other.dungeon_height - 2;
}

alarm[0] = 10;

alarm[1] = 20;