/// @description Insert description here
// You can write your code in this editor

deviceWidth = display_get_width();
deviceHeight = display_get_height();
window_set_size(deviceWidth,deviceHeight);
surface_resize(application_surface,deviceWidth,deviceHeight);
alarm[11] = 1;

boxCenterX = deviceHeight / 5;
boxCenterY = deviceHeight * 4 / 5;
boxRadius = 128;

AttackCenterX = deviceWidth * 6 / 7;
AttackCenterY = deviceHeight * 4 / 5;
AttackRadius = 128;

dashCenterX = AttackCenterX + 128;
dashCenterY = AttackCenterY - 128;
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