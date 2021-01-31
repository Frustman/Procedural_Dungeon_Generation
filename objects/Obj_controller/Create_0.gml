/// @description Insert description here
// You can write your code in this editor

boxCenterX = (300) / 2;
boxCenterY = (1200 - 64) / 2;
boxRadius = 128;

AttackCenterX = (2960 - 360) / 2;
AttackCenterY = (1200 - 64) / 2;
AttackRadius = 128;

dashCenterX = (2960 - 120) / 2;
dashCenterY = (1200 - 320) / 2;
dashRadius = 32;

joyIndex = -1;

clickOne = false;
clickTwo = false;

directionBox = 90;
distanceBox = 0;

move = false;

can_attack = true;
can_dash = true;


globalvar path_grid;
path_grid = mp_grid_create(0,0,room_width / CELL_WIDTH, room_height / CELL_HEIGHT,CELL_WIDTH,CELL_HEIGHT);
mp_grid_add_instances(path_grid, Obj_wall, false);