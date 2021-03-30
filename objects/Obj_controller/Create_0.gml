/// @description Insert description here
// You can write your code in this editor

deviceWidth = 1480;
deviceHeight = 720;
window_set_size(1480,720);
surface_resize(application_surface,1480,720);
display_set_gui_size(1480,720);

alarm[11] = 1;

boxCenterX = 160;
boxCenterY = deviceHeight - 256;
boxRadius = 128;

AttackCenterX = deviceWidth - 216;
AttackCenterY = deviceHeight - 256;
AttackX = deviceWidth - 216;
AttackY = deviceHeight - 256;
AttackRadius = 160;

dashCenterX = AttackCenterX + 160;
dashCenterY = AttackCenterY - 160;
dashRadius = 32;

attack = false;

infoCenterX = deviceWidth - 64;
infoCenterY = 64;
infoRadius = 32;

joyIndex = -1;
attackIndex = -1;

clickOne = false;
clickTwo = false;

chargeMax = 100;
charge = 0;

AttackDirection = 90;
AttackDistance = 0;

directionBox = 90;
distanceBox = 0;

move = false;
keypress = false;

can_attack = true;
can_info = true;
can_dash = true;

dash_delay = 30;


globalvar path_grid;
path_grid = mp_grid_create(0,0,room_width / CELL_WIDTH, room_height / CELL_HEIGHT,CELL_WIDTH,CELL_HEIGHT);
mp_grid_add_instances(path_grid, Obj_wall, false);