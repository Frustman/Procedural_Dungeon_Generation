/// @description Insert description here
// You can write your code in this editor

room_goto(newRoom);

room_instance_add(newRoom,0,0,Obj_controller);
room_instance_add(newRoom,0,0,Obj_mapCreator);

var start_room = node_list[|0];
room_instance_add(newRoom,start_room[2] * CELL_WIDTH, start_room[3] * CELL_HEIGHT,Obj_camera);
room_instance_add(newRoom,start_room[2] * CELL_WIDTH, start_room[3] * CELL_HEIGHT,Obj_chr);